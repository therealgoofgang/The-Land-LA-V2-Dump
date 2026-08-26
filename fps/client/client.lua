local KVP_KEY = "fps:settings"
local CLEANUP_INTERVAL = 2000
local PARTICLE_CLEAR_RADIUS = 20.0
local FPS_PUSH_INTERVAL = 250

-- Benchmark timings, per phase. Changing the LOD scale does not take effect on the next
-- frame: the streamer has to page LODs in or out, which takes a few seconds. Sampling
-- before that settles measures the transition rather than the steady state, so the
-- warmup has to outlast it.
local BENCH_WARMUP = 4000
local BENCH_SAMPLE = 5000
local BENCH_PROGRESS_INTERVAL = 250

-- Every run happens at the same fixed scene, not wherever the player happens to stand:
-- otherwise two runs are not comparable with each other, and a player in an interior
-- would measure nothing. Del Perro beach, facing up the coast toward Vespucci and the
-- skyline — ocean on one side (so flatOcean has waves to flatten), city LODs ahead (so
-- lodScale/dome have geometry to cull). Tweak coords in-game if the framing is off.
local BENCH_SCENE = { x = -1795.0, y = -1178.0, z = 9.0, heading = 315.0 }

-- The camera is a straight, slow dolly: it starts above the scene, faces its heading,
-- and glides forward with its rotation locked. No orbiting and no panning — rotation is
-- what makes people motion-sick, a constant-velocity slide is what stays comparable.
-- Position is a pure function of elapsed time, so every phase traces the identical path
-- over identical scenery regardless of framerate.
local BENCH_DOLLY_DISTANCE = 60.0
local BENCH_HEIGHT = 12.0
local BENCH_PITCH = -12.0
local BENCH_FOV = 60.0
local BENCH_FADE_MS = 400

-- Test subjects: settings like clearParticles and disableDecals measure nothing unless
-- the scene actually contains particles and decals. Each phase respawns the same set of
-- effects at the same offsets, so every phase renders an identical extra load — except
-- the phases whose whole point is removing it.
local BENCH_FX_ASSET = "core"
local BENCH_FX = {
    -- offsets are along the dolly direction (fwd) and perpendicular to it (side)
    { name = "ent_amb_smoke_general", fwd = 18.0, side = -4.0, up = 1.0, scale = 3.0 },
    { name = "ent_amb_smoke_general", fwd = 30.0, side = 5.0, up = 1.0, scale = 3.0 },
    { name = "ent_amb_smoke_foundry", fwd = 42.0, side = -6.0, up = 2.0, scale = 2.0 },
    { name = "ent_amb_torch_fire", fwd = 24.0, side = 2.0, up = 0.5, scale = 4.0 },
    { name = "ent_amb_torch_fire", fwd = 36.0, side = -2.0, up = 0.5, scale = 4.0 },
}
local BENCH_DECALS = { count = 24, spacing = 2.5, type = 1010, size = 1.2 }

local INPUT_FRONTEND_PAUSE = 200
local INPUT_FRONTEND_CANCEL = 202

-- viewDistance at its slider max means "no dome".
local VIEW_DISTANCE_OFF = 3000
local DOME_MODIFIER = "fps_dome"

local settings = Config.Defaults()
local menuOpen = false
local benchRunning = false
local benchAborted = false
local benchCam
local benchDir
local benchReturn
local benchFxHandles = {}
local benchDecalHandles = {}
local domeCreated = false

-- Trust nothing from the NUI: rebuild the table from the schema, one key at a time.
local function sanitize(values)
    local clean = Config.Defaults()

    for key, default in pairs(clean) do
        local value = values and values[key]

        if type(value) == type(default) then
            clean[key] = value
        end
    end

    return clean
end

local function saveSettings()
    SetResourceKvp(KVP_KEY, json.encode(settings))
end

local function loadSettings()
    local raw = GetResourceKvpString(KVP_KEY)
    if not raw then return end

    local ok, saved = pcall(json.decode, raw)
    if not ok or type(saved) ~= "table" then return end

    settings = sanitize(saved)
end

-- The dome: a runtime timecycle modifier that only overrides far_clip, applied through
-- the *extra* modifier slot so scripts using the main slot (drug effects, weather mods)
-- keep working. Everything past the far clip simply is not rendered.
local function applyDome()
    if settings.viewDistance >= VIEW_DISTANCE_OFF then
        ClearExtraTimecycleModifier()
        return
    end

    if not domeCreated then
        CreateTimecycleModifier(DOME_MODIFIER)
        domeCreated = true
    end

    local distance = settings.viewDistance + 0.0
    SetTimecycleModifierVar(DOME_MODIFIER, "far_clip", distance, distance)
    SetExtraTimecycleModifier(DOME_MODIFIER)
end

-- Everything the game only needs told once, on change.
local function applyPersistent()
    SetDistantCarsEnabled(not settings.noDistantCars)

    SetReducePedModelBudget(settings.reduceModelBudget)
    SetReduceVehicleModelBudget(settings.reduceModelBudget)
    SetPedPopulationBudget(settings.populationBudget)
    SetVehiclePopulationBudget(settings.populationBudget)

    DisableVehicleDistantlights(settings.noVehicleDistantLights)

    SetCloudsAlpha(settings.noClouds and 0.0 or 1.0)

    -- CASCADE_SHADOWS_ENABLE_ENTITY_TRACKER, aka _SET_FAR_SHADOWS_SUPPRESSED: passing
    -- true is the cheap direction, since shadows then only draw as you get nearer.
    CascadeShadowsEnableEntityTracker(settings.suppressFarShadows)
    CascadeShadowsSetCascadeBoundsScale(settings.shadowDistance / 100.0)

    -- Leave vehicle lights alone during a blackout, so driving at night stays possible.
    SetArtificialLightsState(settings.blackout)
    SetArtificialLightsStateAffectsVehicles(not settings.blackout)

    if settings.flatOcean then
        SetDeepOceanScaler(0.0)
    else
        ResetDeepOceanScaler()
    end

    if settings.disableScreenBlur then
        DisableScreenblurFade()
    end

    applyDome()
end

local function needsPerFrame()
    return settings.lodScale ~= 100 or settings.disableDecals
end

local function needsCleanup()
    return settings.clearParticles or settings.clearGlass or settings.cleanPed
        or settings.disablePostFx
end

local function applyPerFrame()
    if settings.lodScale ~= 100 then
        OverrideLodscaleThisFrame(settings.lodScale / 100.0)
    end

    if settings.disableDecals then
        SetDisableDecalRenderingThisFrame()
    end
end

--[[ Benchmark scene ]]--------------------------------------------------------

local function scenePoint(fwd, side, up)
    return BENCH_SCENE.x + benchDir.x * fwd - benchDir.y * side,
        BENCH_SCENE.y + benchDir.y * fwd + benchDir.x * side,
        BENCH_SCENE.z + up
end

local function benchStopFx()
    for _, handle in ipairs(benchFxHandles) do
        if DoesParticleFxLoopedExist(handle) then
            StopParticleFxLooped(handle, false)
        end
    end

    benchFxHandles = {}
end

-- Called at the start of every phase: earlier phases (clearParticles in particular) may
-- have destroyed the test effects, and every phase must start from the identical scene.
local function benchSpawnFx()
    benchStopFx()

    for _, fx in ipairs(BENCH_FX) do
        local x, y, z = scenePoint(fx.fwd, fx.side, fx.up)

        UseParticleFxAsset(BENCH_FX_ASSET)
        local handle = StartParticleFxLoopedAtCoord(
            fx.name, x, y, z, 0.0, 0.0, 0.0, fx.scale, false, false, false, false)

        benchFxHandles[#benchFxHandles + 1] = handle
    end
end

-- A strip of decals on the sand along the dolly path, so disableDecals has something to
-- stop rendering. Decal type 1010 is the generic splatter family; if this build rejects
-- the type the decals silently do not spawn and that phase honestly reads ~0.
local function benchSpawnDecals()
    for index = 1, BENCH_DECALS.count do
        local fwd = 10.0 + index * BENCH_DECALS.spacing
        local side = (index % 2 == 0) and 3.0 or -3.0
        local x, y, z = scenePoint(fwd, side, 1.0)

        local handle = AddDecal(
            BENCH_DECALS.type,
            x, y, z,
            0.0, 0.0, -1.0,
            1.0, 0.0, 0.0,
            BENCH_DECALS.size, BENCH_DECALS.size,
            0.4, 0.05, 0.05, 0.9,
            -1.0, false, false, false)

        benchDecalHandles[#benchDecalHandles + 1] = handle
    end
end

local function benchClearDecals()
    for _, handle in ipairs(benchDecalHandles) do
        RemoveDecal(handle)
    end

    benchDecalHandles = {}
end

local function benchSetup()
    local ped = PlayerPedId()
    local rad = math.rad(BENCH_SCENE.heading)

    -- GTA heading: 0 = north (+Y), increasing counter-clockwise.
    benchDir = { x = -math.sin(rad), y = math.cos(rad) }
    benchReturn = { coords = GetEntityCoords(ped), heading = GetEntityHeading(ped) }

    DoScreenFadeOut(BENCH_FADE_MS)
    while not IsScreenFadedOut() do Wait(0) end

    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityVisible(ped, false, false)
    SetPlayerControl(PlayerId(), false, 0)
    DisplayRadar(false)

    SetEntityCoordsNoOffset(ped, BENCH_SCENE.x, BENCH_SCENE.y, BENCH_SCENE.z, false, false, false)
    SetEntityHeading(ped, BENCH_SCENE.heading)
    RequestCollisionAtCoord(BENCH_SCENE.x, BENCH_SCENE.y, BENCH_SCENE.z)

    benchCam = CreateCamWithParams(
        "DEFAULT_SCRIPTED_CAMERA",
        BENCH_SCENE.x, BENCH_SCENE.y, BENCH_SCENE.z + BENCH_HEIGHT,
        BENCH_PITCH, 0.0, BENCH_SCENE.heading,
        BENCH_FOV, true, 2
    )

    SetCamActive(benchCam, true)
    RenderScriptCams(true, false, 0, true, true)
    SetFocusPosAndVel(BENCH_SCENE.x, BENCH_SCENE.y, BENCH_SCENE.z + BENCH_HEIGHT, 0.0, 0.0, 0.0)

    -- Let the scene stream in behind the fade before anything is measured.
    RequestNamedPtfxAsset(BENCH_FX_ASSET)
    local deadline = GetGameTimer() + 5000
    while not HasNamedPtfxAssetLoaded(BENCH_FX_ASSET) and GetGameTimer() < deadline do Wait(0) end
    Wait(1000)

    benchSpawnDecals()
    DoScreenFadeIn(BENCH_FADE_MS)
end

local function benchTeardown()
    DoScreenFadeOut(BENCH_FADE_MS)
    while not IsScreenFadedOut() do Wait(0) end

    benchStopFx()
    benchClearDecals()
    RemoveNamedPtfxAsset(BENCH_FX_ASSET)

    RenderScriptCams(false, false, 0, true, true)

    if benchCam and DoesCamExist(benchCam) then
        DestroyCam(benchCam, true)
    end

    benchCam = nil

    ClearFocus()
    DisplayRadar(true)

    local ped = PlayerPedId()

    if benchReturn then
        SetEntityCoordsNoOffset(ped, benchReturn.coords.x, benchReturn.coords.y, benchReturn.coords.z, false, false, false)
        SetEntityHeading(ped, benchReturn.heading)
        benchReturn = nil
    end

    SetPlayerControl(PlayerId(), true, 0)
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true, false)
    SetEntityInvincible(ped, false)

    DoScreenFadeIn(BENCH_FADE_MS)
end

-- t runs 0..1 across a phase. Only the coordinate moves; the rotation set at creation is
-- never touched again, so the horizon stays perfectly still.
local function updateBenchCam(t)
    local d = t * BENCH_DOLLY_DISTANCE
    local x = BENCH_SCENE.x + benchDir.x * d
    local y = BENCH_SCENE.y + benchDir.y * d
    local z = BENCH_SCENE.z + BENCH_HEIGHT

    SetCamCoord(benchCam, x, y, z)

    -- Stream around the camera, not the frozen ped.
    SetFocusPosAndVel(x, y, z, 0.0, 0.0, 0.0)
end

local function summarize(samples)
    local count = #samples
    if count == 0 then return { avg = 0, low = 0 } end

    table.sort(samples)

    local total = 0
    for index = 1, count do
        total = total + samples[index]
    end

    -- 1% low: the mean of the worst one percent of frames, which is what stutter feels like.
    local lowCount = math.max(1, math.floor(count * 0.01))
    local lowTotal = 0
    for index = 1, lowCount do
        lowTotal = lowTotal + samples[index]
    end

    return {
        avg = math.floor(total / count + 0.5),
        low = math.floor(lowTotal / lowCount + 0.5),
    }
end

local function runPhase(phase, phaseIndex, phaseCount)
    local phaseLength = BENCH_WARMUP + BENCH_SAMPLE
    local start = GetGameTimer()
    local warmupEnd = start + BENCH_WARMUP
    local phaseEnd = start + phaseLength
    local samples = {}
    local nextPush = 0
    local nextCleanup = 0

    while true do
        local now = GetGameTimer()
        if now >= phaseEnd then break end

        DisableAllControlActions(0)
        DisableAllControlActions(1)
        DisableAllControlActions(2)
        HideHudAndRadarThisFrame()

        if IsDisabledControlJustPressed(0, INPUT_FRONTEND_PAUSE)
            or IsDisabledControlJustPressed(0, INPUT_FRONTEND_CANCEL) then
            benchAborted = true
            return nil
        end

        updateBenchCam((now - start) / phaseLength)
        applyPerFrame()

        -- The cleanup-style settings act on the scene here; the regular cleanup thread
        -- is parked while a benchmark runs. The ped stands at the scene origin, so the
        -- player-relative natives behave exactly as they do in normal play.
        if now >= nextCleanup then
            nextCleanup = now + 1000

            if settings.clearParticles then
                RemoveParticleFxInRange(BENCH_SCENE.x, BENCH_SCENE.y, BENCH_SCENE.z, 80.0)
            end

            if settings.clearGlass then
                ClearAllBrokenGlass()
            end

            if settings.disablePostFx then
                AnimpostfxStopAll()
            end
        end

        local frameTime = GetFrameTime()
        if now >= warmupEnd and frameTime > 0.0 then
            samples[#samples + 1] = 1.0 / frameTime
        end

        if now >= nextPush then
            nextPush = now + BENCH_PROGRESS_INTERVAL

            local warming = now < warmupEnd
            local elapsed = (phaseIndex * phaseLength) + (now - start)

            SendNUIMessage({ action = "BENCH_PROGRESS", data = {
                label = phase.label,
                index = phaseIndex + 1,
                count = phaseCount,
                stage = warming and "warmup" or "sample",
                secondsLeft = math.ceil(((warming and warmupEnd or phaseEnd) - now) / 1000),
                progress = math.floor((elapsed / (phaseLength * phaseCount)) * 100),
            }})
        end

        Wait(0)
    end

    return summarize(samples)
end

--[[ Menu ]]------------------------------------------------------------------

local function openMenu(presetId)
    if benchRunning then return end

    if presetId then
        local values = Config.PresetValues(presetId)

        if values then
            settings = values
            applyPersistent()
            saveSettings()
        end

        return
    end

    if menuOpen then return end
    menuOpen = true

    SendNUIMessage({
        action = "OPEN_MENU",
        data = {
            categories = Config.Categories,
            presets = Config.Presets,
            values = settings,
            phaseSeconds = (BENCH_WARMUP + BENCH_SAMPLE) / 1000,
            phaseCount = #Config.BenchPhases(settings),
        },
    })
    SetNuiFocus(true, true)
end

local function closeMenu()
    menuOpen = false
    SetNuiFocus(false, false)
end

RegisterCommand("fps", function(_, args)
    openMenu(args[1])
end, false)

RegisterKeyMapping("fps", "Open FPS settings", "keyboard", "")

RegisterNUICallback("apply", function(data, cb)
    closeMenu()

    settings = sanitize(data.values)
    applyPersistent()
    saveSettings()
    cb("ok")
end)

RegisterNUICallback("cancel", function(_, cb)
    closeMenu()

    -- The menu and the benchmark both mutate `settings` live. Discarding means going
    -- back to whatever was last written to disk, not to whatever is in memory.
    settings = Config.Defaults()
    loadSettings()
    applyPersistent()
    cb("ok")
end)

RegisterNUICallback("benchmark", function(data, cb)
    if benchRunning then
        cb("busy")
        return
    end

    benchRunning = true
    benchAborted = false
    menuOpen = false
    SetNuiFocus(false, false)
    cb("ok")

    local pending = sanitize(data.values)
    local restore = sanitize(settings)

    CreateThread(function()
        local phases = Config.BenchPhases(pending)
        local rows = {}

        benchSetup()

        for index, phase in ipairs(phases) do
            settings = phase.values
            applyPersistent()
            benchSpawnFx()

            local stats = runPhase(phase, index - 1, #phases)
            if not stats then break end

            rows[#rows + 1] = { id = phase.id, label = phase.label, avg = stats.avg, low = stats.low }
        end

        benchTeardown()

        settings = restore
        applyPersistent()

        benchRunning = false
        menuOpen = true

        if benchAborted then
            SendNUIMessage({ action = "BENCH_ABORTED" })
        else
            SendNUIMessage({ action = "BENCH_RESULT", data = { rows = rows } })
        end

        SetNuiFocus(true, true)
    end)
end)

--[[ Threads ]]---------------------------------------------------------------

CreateThread(function()
    loadSettings()
    applyPersistent()

    while true do
        -- runPhase drives the per-frame natives itself while a benchmark is up.
        if not benchRunning and needsPerFrame() then
            applyPerFrame()
            Wait(0)
        else
            Wait(500)
        end
    end
end)

CreateThread(function()
    while true do
        -- Parked during a benchmark: runPhase does scene-local cleanup itself.
        if not benchRunning and needsCleanup() then
            local ped = PlayerPedId()

            if settings.clearGlass then
                ClearAllBrokenGlass()
            end

            if settings.clearParticles then
                local coords = GetEntityCoords(ped)
                RemoveParticleFxInRange(coords.x, coords.y, coords.z, PARTICLE_CLEAR_RADIUS)
            end

            if settings.disablePostFx then
                AnimpostfxStopAll()
            end

            if settings.cleanPed then
                ClearPedBloodDamage(ped)
                ClearPedWetness(ped)
                ClearPedEnvDirt(ped)
                ResetPedVisibleDamage(ped)
            end
        end

        Wait(CLEANUP_INTERVAL)
    end
end)

-- The live counter in the menu header. Only runs while the menu is up.
CreateThread(function()
    while true do
        if menuOpen then
            local frameTime = GetFrameTime()

            if frameTime > 0.0 then
                SendNUIMessage({ action = "FPS", data = { fps = math.floor(1.0 / frameTime + 0.5) } })
            end

            Wait(FPS_PUSH_INTERVAL)
        else
            Wait(500)
        end
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource ~= GetCurrentResourceName() then return end

    -- Never leave the player frozen, invisible, or stranded at the benchmark scene.
    if benchRunning then
        benchTeardown()
    end

    ClearExtraTimecycleModifier()
    SetNuiFocus(false, false)
end)
