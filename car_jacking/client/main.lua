-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  CAR JACKING — client                                                      ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

local jobPed                 -- the static "shady dealer"
local jobBlip                -- dealer map blip
local routeBlip              -- the GPS route blip (spawn point / drop-off)
local radiusBlip             -- the search-area circle at the spawn point
local currentJob = nil       -- { netId, stage = 'find'|'deliver', spawn, drop }
local minigameVehicle = nil  -- entity currently being hacked
local dropPed = nil          -- the receiver NPC (local, non-networked)

local function myId()
    return GetPlayerServerId(PlayerId())
end

-- ── notifications ─────────────────────────────────────────────────────────────

local function notify(msg, ntype)
    lib.notify({ title = 'Car Jacking', description = msg, type = ntype or 'inform' })
end

RegisterNetEvent('car_jacking:notify', function(msg, ntype)
    notify(msg, ntype)
end)

-- ── route / blip helpers ──────────────────────────────────────────────────────

local function clearRoute()
    if routeBlip then RemoveBlip(routeBlip); routeBlip = nil end
    if radiusBlip then RemoveBlip(radiusBlip); radiusBlip = nil end
end

local function createRoute(coords, colour, label, withRadius)
    clearRoute()

    routeBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(routeBlip, Config.Route.sprite)
    SetBlipColour(routeBlip, colour)
    SetBlipRoute(routeBlip, true)
    SetBlipRouteColour(routeBlip, colour)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(label or 'Car Jacking')
    EndTextCommandSetBlipName(routeBlip)

    if withRadius then
        radiusBlip = AddBlipForRadius(coords.x, coords.y, coords.z, Config.Route.searchRadius)
        SetBlipColour(radiusBlip, colour)
        SetBlipAlpha(radiusBlip, Config.Route.radiusAlpha)
    end

    -- NOTE: we intentionally do NOT call SetNewWaypoint here. The styled blip
    -- route above already draws a coloured line to the destination; setting a
    -- user waypoint as well produced a second (purple) GTA route on top of it.
end

-- ── job giver menu ────────────────────────────────────────────────────────────

local function requestJob(difficulty)
    local ok, data = lib.callback.await('car_jacking:startJob', false, difficulty)
    if not ok then
        notify(data or 'Unable to start the job', 'error')
        return
    end

    currentJob = { netId = data.netId, stage = 'find', spawn = data.spawn, difficulty = data.difficulty }
    notify('A vehicle has been spotted nearby. It is locked — find it and crack it open.', 'success')
    createRoute(data.spawn, Config.Route.findColour, 'Stolen Vehicle', true)

    -- keep the target vehicle locked while we are still hunting it
    CreateThread(function()
        while currentJob and currentJob.stage == 'find' and not currentJob.unlocked do
            local veh = NetworkGetEntityFromNetworkId(currentJob.netId)
            if veh and veh ~= 0 and DoesEntityExist(veh) then
                SetVehicleDoorsLocked(veh, 2)
            end
            Wait(1500)
        end
    end)
end

local function openJobMenu()
    local options = {}

    local diff  = Config.Difficulty or {}
    local order = diff.order or {}
    local wireOn = Config.WireGame and Config.WireGame.enabled

    -- pull the player's XP + per-level unlock state from the server
    local progress     = lib.callback.await('car_jacking:getProgress', false) or {}
    local xpEnabled    = progress.enabled
    local xp           = progress.xp or 0
    local levelState   = progress.levels or {}

    -- header: current reputation / XP and what each job is worth
    if xpEnabled then
        options[#options + 1] = {
            title       = ('Reputation — %d XP'):format(xp),
            description = ('Earn %d XP for every vehicle you deliver'):format(progress.perMission or 0),
            icon        = 'star',
            readOnly    = true,
        }
    end

    for _, key in ipairs(order) do
        local lvl = diff.levels and diff.levels[key]
        if lvl then
            -- build a short description so the player sees the timers up front
            local desc = ('Tablet %ds per tap'):format((lvl.tabletTime or 0) / 1000)
            if wireOn then
                desc = lvl.wireTime and lvl.wireTime > 0
                    and ('%s · Rewire in %ds'):format(desc, lvl.wireTime / 1000)
                    or  ('%s · Rewire (no limit)'):format(desc)
            end

            local st       = levelState[key] or {}
            local required = st.xpRequired or lvl.xpRequired or 0
            -- locked only when XP gating is on and the server says so
            local locked   = xpEnabled and (st.unlocked == false)

            if locked then
                local short = math.max(0, required - xp)
                options[#options + 1] = {
                    title       = ('%s — Locked'):format(lvl.label or key),
                    description = ('Requires %d XP · %d more to unlock'):format(required, short),
                    icon        = 'lock',
                    disabled    = true,
                }
            else
                options[#options + 1] = {
                    title       = ('Steal a vehicle — %s'):format(lvl.label or key),
                    description = desc,
                    icon        = 'car',
                    onSelect    = function() requestJob(key) end,
                }
            end
        end
    end

    -- fallback: if no levels are configured, keep the original single option
    if #options == 0 then
        options[#options + 1] = {
            title       = 'Steal a vehicle',
            description = 'Take on a car-jacking job for a cut',
            icon        = 'car',
            onSelect    = function() requestJob() end,
        }
    end

    options[#options + 1] = {
        title    = 'Never mind',
        icon     = 'xmark',
        onSelect = function() end,
    }

    lib.registerContext({
        id      = 'carjack_menu',
        title   = 'Shady Dealer',
        options = options,
    })
    lib.showContext('carjack_menu')
end

-- ── spawn the dealer + register targets ───────────────────────────────────────

CreateThread(function()
    local p = Config.JobPed
    local hash = joaat(p.model)

    RequestModel(hash)
    local t = 0
    while not HasModelLoaded(hash) and t < 200 do Wait(10); t = t + 1 end

    jobPed = CreatePed(4, hash, p.coords.x, p.coords.y, p.coords.z - 1.0, p.coords.w, false, true)
    SetEntityAsMissionEntity(jobPed, true, true)
    FreezeEntityPosition(jobPed, true)
    SetEntityInvincible(jobPed, true)
    SetBlockingOfNonTemporaryEvents(jobPed, true)
    if p.scenario then TaskStartScenarioInPlace(jobPed, p.scenario, 0, true) end
    SetModelAsNoLongerNeeded(hash)

    exports.ox_target:addLocalEntity(jobPed, {
        {
            name     = 'carjack_talk',
            icon     = 'fas fa-comments',
            label    = 'Talk to dealer',
            distance = 2.5,
            onSelect = openJobMenu,
        },
    })

    if p.blip and p.blip.enabled then
        jobBlip = AddBlipForCoord(p.coords.x, p.coords.y, p.coords.z)
        SetBlipSprite(jobBlip, p.blip.sprite)
        SetBlipColour(jobBlip, p.blip.colour)
        SetBlipScale(jobBlip, p.blip.scale)
        SetBlipAsShortRange(jobBlip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(p.blip.label)
        EndTextCommandSetBlipName(jobBlip)
    end
end)

-- the locked vehicle: bypass option (only on the owner's job vehicle, while hunting)
exports.ox_target:addGlobalVehicle({
    {
        name     = 'carjack_bypass',
        icon     = 'fas fa-car-burst',
        label    = 'Bypass lock',
        distance = 2.0,
        canInteract = function(entity)
            if not currentJob or currentJob.stage ~= 'find' or currentJob.unlocked then return false end
            return Entity(entity).state.carjack_owner == myId()
        end,
        onSelect = function(data)
            minigameVehicle = data.entity
            OpenMinigame()
        end,
    },
})

-- the receiver NPC is spawned LOCALLY (non-networked) on the owner's client only,
-- with a local third-eye target, so no ped is replicated to the network.

local function clearDropPed()
    if dropPed and DoesEntityExist(dropPed) then
        exports.ox_target:removeLocalEntity(dropPed)
        DeleteEntity(dropPed)
    end
    dropPed = nil
end

local function spawnDropPed(drop)
    clearDropPed()

    local hash = joaat(Config.DropOff.pedModel)
    RequestModel(hash)
    local t = 0
    while not HasModelLoaded(hash) and t < 200 do Wait(10); t = t + 1 end

    dropPed = CreatePed(4, hash, drop.x, drop.y, drop.z - 1.0, drop.w or 0.0, false, true)
    SetEntityAsMissionEntity(dropPed, true, true)
    FreezeEntityPosition(dropPed, true)
    SetEntityInvincible(dropPed, true)
    SetBlockingOfNonTemporaryEvents(dropPed, true)
    SetModelAsNoLongerNeeded(hash)

    exports.ox_target:addLocalEntity(dropPed, {
        {
            name     = 'carjack_deliver',
            icon     = 'fas fa-handshake',
            label    = 'Hand over vehicle',
            distance = 2.5,
            canInteract = function()
                return currentJob ~= nil and currentJob.stage == 'deliver'
            end,
            onSelect = function()
                TriggerServerEvent('car_jacking:completeDelivery')
            end,
        },
    })
end

-- ── replicated lock flag (applies on every client that streams the vehicle) ───

AddStateBagChangeHandler('carjack_locked', nil, function(bagName, _, value)
    local entity = GetEntityFromStateBagName(bagName)
    if not entity or entity == 0 then return end
    SetVehicleDoorsLocked(entity, value and 2 or 1)
    if not value then SetVehicleDoorsLockedForAllPlayers(entity, false) end
end)

-- ── unlocking ─────────────────────────────────────────────────────────────────
-- Fully unlocks a vehicle locally and briefly re-asserts it, so nothing (the
-- streaming system, a late lock write, etc.) can clamp it back shut.

local function unlockVehicle(veh)
    if not veh or veh == 0 or not DoesEntityExist(veh) then return end

    CreateThread(function()
        for _ = 1, 8 do
            if not DoesEntityExist(veh) then return end
            SetVehicleDoorsLocked(veh, 1)
            SetVehicleDoorsLockedForAllPlayers(veh, false)
            SetVehicleDoorsLockedForPlayer(veh, PlayerId(), false)
            Wait(250)
        end
    end)
end

-- ── vehicle keys ──────────────────────────────────────────────────────────────
-- Hands the player keys to the bypassed vehicle. Add more branches here for
-- whatever keys system(s) your server runs.

local function giveVehicleKeys(vehicle)
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then return end
    local plate = GetVehicleNumberPlateText(vehicle)

    if GetResourceState('compacted') == 'started' then
        TriggerServerEvent('giveCarKeys', plate)
    -- elseif GetResourceState('qb-vehiclekeys') == 'started' then
    --     TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
    end
end

-- ── bypass emote + held prop ───────────────────────────────────────────────────
-- Plays the "striker" animation with the fuse prop attached to the right hand
-- for the duration of the bypass (tablet + wiring). Config-equivalent of:
--   dict='propadstriker@animation', anim='propadstriker_clip',
--   prop='reh_prop_reh_fuse_01a', bone=28422, loop=true
-- NOTE: the clip inside this custom .ycd is 'propadstriker_clip' (verified by
-- decompressing the file) — NOT 'base'.

local BYPASS_DICT  = 'propadstriker@animation'
local BYPASS_ANIM  = 'propadstriker_clip'
local BYPASS_PROP  = 'reh_prop_reh_fuse_01a'
local BYPASS_BONE  = 28422
local bypassProp   = nil
local bypassActive = false  -- guards the keeper thread below

-- flag 1 = looping full-body play (the player is held in the NUI during the
-- bypass, so a full-body loop reads best and is the configuration we verified)
local BYPASS_FLAG  = 1

local function startBypassEmote()
    bypassActive = true

    -- kick off the dict + prop requests
    RequestAnimDict(BYPASS_DICT)
    local model = joaat(BYPASS_PROP)
    RequestModel(model)

    -- Keeper thread: streamed .ycd clips can take a moment to load and the task
    -- can be cleared by the scenario/idle, so we re-assert the anim until it is
    -- actually playing and keep it playing for the whole bypass. The prop is
    -- attached as soon as its model is ready.
    CreateThread(function()
        while bypassActive do
            local ped = PlayerPedId()

            -- (re)play the anim once the clip dictionary is available
            if HasAnimDictLoaded(BYPASS_DICT) then
                if not IsEntityPlayingAnim(ped, BYPASS_DICT, BYPASS_ANIM, 3) then
                    TaskPlayAnim(ped, BYPASS_DICT, BYPASS_ANIM, 8.0, -8.0, -1, BYPASS_FLAG, 0.0, false, false, false)
                end
            end

            -- attach the prop once (model loaded and not yet spawned)
            if not bypassProp and HasModelLoaded(model) then
                local c = GetEntityCoords(ped)
                -- local, non-networked prop (isNetwork = false, netMissionEntity = false)
                bypassProp = CreateObject(model, c.x, c.y, c.z + 0.2, false, false, false)
                local bone = GetPedBoneIndex(ped, BYPASS_BONE)
                AttachEntityToEntity(bypassProp, ped, bone,
                    0.0, 0.0, 0.0,   -- placement x, y, z
                    0.0, 0.0, 0.0,   -- rotation  x, y, z
                    true, true, false, true, 1, true)
                SetModelAsNoLongerNeeded(model)
            end

            Wait(250)
        end
    end)
end

local function stopBypassEmote()
    bypassActive = false
    local ped = PlayerPedId()
    StopAnimTask(ped, BYPASS_DICT, BYPASS_ANIM, 1.0)
    ClearPedSecondaryTask(ped)
    if bypassProp and DoesEntityExist(bypassProp) then
        DeleteEntity(bypassProp)
    end
    bypassProp = nil
    RemoveAnimDict(BYPASS_DICT)
end

-- ── minigame (NUI) ─────────────────────────────────────────────────────────────

function OpenMinigame()
    -- resolve the level chosen for this job (falls back to the default level,
    -- then to the legacy Config.Minigame / Config.WireGame values)
    local diff    = Config.Difficulty or {}
    local diffKey = (currentJob and currentJob.difficulty) or diff.default
    local lvl     = (diff.levels and (diff.levels[diffKey] or diff.levels[diff.default])) or {}

    local tabletTime = lvl.tabletTime or Config.Minigame.timePerStep
    local wireTime   = lvl.wireTime
    if wireTime == nil then wireTime = Config.WireGame.time end

    startBypassEmote()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action      = 'open',
        targetApp   = Config.Minigame.targetApp,
        steps       = lvl.steps or Config.Minigame.steps,
        time        = tabletTime,
        failOnWrong = Config.Minigame.failOnWrong,
        apps        = Config.Minigame.apps,
        wire        = {
            enabled = Config.WireGame.enabled,
            wires   = lvl.wires or Config.WireGame.wires,
            time    = wireTime,
        },
    })
end

RegisterNUICallback('result', function(data, cb)
    SetNuiFocus(false, false)
    stopBypassEmote()

    if data and data.success then
        if Config.Debug then print('[car_jacking] minigame success -> triggering vehicleUnlocked') end
        notify('Lock bypassed. Get in and drive it to the drop-off.', 'success')
        -- flip the flag first so the re-lock loop stops immediately
        if currentJob then currentJob.unlocked = true end
        TriggerServerEvent('car_jacking:vehicleUnlocked')
        if minigameVehicle and DoesEntityExist(minigameVehicle) then
            unlockVehicle(minigameVehicle)
            giveVehicleKeys(minigameVehicle)
        end
    else
        notify('You botched the bypass. Wait a moment and try again.', 'error')
    end

    minigameVehicle = nil
    cb('ok')
end)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    stopBypassEmote()
    minigameVehicle = nil
    cb('ok')
end)

-- ── stage transitions from the server ─────────────────────────────────────────

RegisterNetEvent('car_jacking:startDelivery', function(drop)
    if Config.Debug then print('[car_jacking] startDelivery received', drop and drop.x, drop and drop.y) end
    if not currentJob then
        -- shouldn't happen, but don't silently swallow the drop info
        currentJob = { stage = 'deliver', unlocked = true }
    end
    currentJob.stage    = 'deliver'
    currentJob.unlocked = true
    currentJob.drop     = drop

    -- make sure the vehicle is unlocked locally
    if currentJob.netId then
        unlockVehicle(NetworkGetEntityFromNetworkId(currentJob.netId))
    end

    notify('Vehicle unlocked. Deliver it to the marked drop-off location.', 'inform')
    clearRoute()
    createRoute(drop, Config.Route.dropColour, Config.DropOff.blip.label, false)

    -- spawn the receiver as a local, non-networked ped on this client only
    spawnDropPed(drop)
end)

RegisterNetEvent('car_jacking:jobComplete', function(rewarded, xpGained, xpTotal)
    if rewarded == false then
        notify('Vehicle delivered, but the payment failed to process.', 'error')
    else
        notify('Vehicle delivered. Payment received.', 'success')
    end

    if xpGained and xpGained > 0 then
        notify(('You earned %d XP (total: %d).'):format(xpGained, xpTotal or xpGained), 'inform')

        -- announce any level whose threshold we just crossed with this gain
        local before = (xpTotal or 0) - xpGained
        local diff   = Config.Difficulty or {}
        for _, key in ipairs(diff.order or {}) do
            local lvl = diff.levels and diff.levels[key]
            local req = lvl and lvl.xpRequired or 0
            if lvl and req > 0 and before < req and (xpTotal or 0) >= req then
                notify(('New job unlocked: %s'):format(lvl.label or key), 'success')
            end
        end
    end

    currentJob = nil
    clearRoute()
    clearDropPed()
end)

RegisterNetEvent('car_jacking:jobCancelled', function()
    currentJob = nil
    clearRoute()
    clearDropPed()
end)

-- ── cleanup ───────────────────────────────────────────────────────────────────

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    if jobPed and DoesEntityExist(jobPed) then DeleteEntity(jobPed) end
    if jobBlip then RemoveBlip(jobBlip) end
    bypassActive = false
    if bypassProp and DoesEntityExist(bypassProp) then DeleteEntity(bypassProp) end
    clearDropPed()
    clearRoute()
    SetNuiFocus(false, false)
end)
