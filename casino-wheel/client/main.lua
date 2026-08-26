-- ===============================================================
-- CASINO WHEEL
-- ===============================================================

-- Per-wheel state: { prop, dui, txd, tex, ready, spinning, pos, cfg, off }
local wheels = {}
local anyReady = false
local editorWheelId = nil   -- set by client/editor.lua while tuning

-- Build a wheel's DUI face offset: defaults <- config override <- saved file
local function BuildOffset(cfg, saved)
    local o = {}
    for k, v in pairs(Config.DefaultOffset) do o[k] = v end
    if cfg and cfg.offset then
        for k, v in pairs(cfg.offset) do if o[k] ~= nil then o[k] = v + 0.0 end end
    end
    if saved then
        for k, v in pairs(saved) do if o[k] ~= nil then o[k] = v + 0.0 end end
    end
    return o
end

local ANIM = {
    spin      = { dict = 'anim_casino_b@amb@casino@games@lucky7wheel@female',  name = 'enter_right_to_baseidle' },
    idle      = { dict = 'anim_casino_b@amb@casino@games@lucky7wheel@female',  name = 'idle' },
    celebrate = { dict = 'anim@mp_player_intcelebrationmale@freakout',          name = 'freakout' },
    sad       = { dict = 'anim@mp_player_intcelebrationmale@face_palm',         name = 'face_palm' },
    clap      = { dict = 'amb@world_human_cheering@male_a',                     name = 'base' },
}

local lastRewardType = nil
local pendingReaction = false
local playerLocked = false

-- Cached natives
local PlayerPedId = PlayerPedId
local GetEntityCoords = GetEntityCoords
local DoesEntityExist = DoesEntityExist
local GetOffsetFromEntityInWorldCoords = GetOffsetFromEntityInWorldCoords
local GetEntityRotation = GetEntityRotation

-- ---------------------------------------------------------------
-- ANIM HELPERS
-- ---------------------------------------------------------------
local function LoadDict(dict)
    if HasAnimDictLoaded(dict) then return true end
    RequestAnimDict(dict)
    local t = 0
    while not HasAnimDictLoaded(dict) do
        Wait(10)
        t = t + 10
        if t > 5000 then return false end
    end
    return true
end

local function PlayAnim(ped, dict, name, flag, duration)
    if not LoadDict(dict) then return end
    TaskPlayAnim(ped, dict, name, 8.0, -8.0, duration or -1, flag or 0, 0, false, false, false)
end

local function StopAnim(ped, dict, name)
    StopAnimTask(ped, dict, name, 1.0)
end

-- ---------------------------------------------------------------
-- PARTICLE EFFECTS
-- ---------------------------------------------------------------
local function PlayConfetti(ped)
    CreateThread(function()
        local ptfx = 'scr_indep_fireworks'
        RequestNamedPtfxAsset(ptfx)
        local t = 0
        while not HasNamedPtfxAssetLoaded(ptfx) do
            Wait(10)
            t = t + 10
            if t > 5000 then return end
        end

        local coords = GetEntityCoords(ped)
        for i = 1, 3 do
            UseParticleFxAsset(ptfx)
            local p = StartParticleFxLoopedAtCoord(
                'scr_indep_firework_starburst',
                coords.x + math.random(-2, 2) * 0.5,
                coords.y + math.random(-2, 2) * 0.5,
                coords.z + 2.0 + i * 0.5,
                0.0, 0.0, 0.0, 0.5, false, false, false, false
            )
            Wait(600)
            if p and p ~= 0 then
                StopParticleFxLooped(p, false)
                RemoveParticleFx(p, false)
            end
        end
        RemoveNamedPtfxAsset(ptfx)
    end)
end

-- ---------------------------------------------------------------
-- LOCK / UNLOCK
-- ---------------------------------------------------------------
local function LockPlayer(lock)
    local ped = PlayerPedId()
    playerLocked = lock
    FreezeEntityPosition(ped, lock)
    SetEntityInvincible(ped, lock)
end

-- ---------------------------------------------------------------
-- REACTION AFTER SPIN
-- ---------------------------------------------------------------
local function PlayReaction(rewardType)
    local ped = PlayerPedId()

    if rewardType == 'big_win' then
        PlayAnim(ped, ANIM.celebrate.dict, ANIM.celebrate.name, 49, 4000)
        PlayConfetti(ped)
        Wait(4000)
    elseif rewardType == 'small_win' then
        PlayAnim(ped, ANIM.clap.dict, ANIM.clap.name, 49, 3000)
        Wait(3000)
    else
        PlayAnim(ped, ANIM.sad.dict, ANIM.sad.name, 49, 3500)
        Wait(3500)
    end

    ClearPedTasks(ped)
    LockPlayer(false)
end

-- ---------------------------------------------------------------
-- HELPERS
-- ---------------------------------------------------------------
local function SendToDUI(w, d)
    if w and w.dui then SendDuiMessage(w.dui, json.encode(d)) end
end

local function Pos(w)
    local o = w.off
    if not w.prop or not DoesEntityExist(w.prop) then
        return w.cfg.coords.x, w.cfg.coords.y, w.cfg.coords.z + 1.5
    end
    local p = GetOffsetFromEntityInWorldCoords(w.prop, o.localX, o.localY, o.localZ)
    return p.x, p.y, p.z
end

local function Rot(w)
    local o = w.off
    if not w.prop or not DoesEntityExist(w.prop) then
        return o.dRotX, o.dRotY, o.dRotZ
    end
    local r = GetEntityRotation(w.prop, 2)
    return r.x + o.dRotX, r.y + o.dRotY, r.z + o.dRotZ
end

-- ---------------------------------------------------------------
-- SPAWN
-- ---------------------------------------------------------------
CreateThread(function()
    Wait(3000)

    local h = GetHashKey('vw_prop_vw_luckywheel_01a')
    RequestModel(h)
    local t = 0
    while not HasModelLoaded(h) do Wait(10) t = t + 10 if t > 10000 then return end end

    local url = 'nui://' .. GetCurrentResourceName() .. '/html/index.html'
    local segs = {}
    for i, s in ipairs(Config.Segments) do
        segs[i] = { label = s.label, color = s.color, textColor = s.textColor }
    end

    for id, cfg in ipairs(Config.Wheels) do
        local prop = CreateObjectNoOffset(h, cfg.coords.x, cfg.coords.y, cfg.coords.z, false, false, false)
        if prop and prop ~= 0 then
            SetEntityHeading(prop, cfg.heading)
            FreezeEntityPosition(prop, true)
            SetEntityCollision(prop, true, false)

            local w = {
                cfg      = cfg,
                prop     = prop,
                pos      = GetEntityCoords(prop),
                off      = BuildOffset(cfg, nil),
                txd      = 'casinowheel_txd_' .. id,
                tex      = 'casinowheel_tex_' .. id,
                ready    = false,
                spinning = false,
            }

            w.dui = CreateDui(url, Config.DuiWidth, Config.DuiHeight)
            if w.dui then
                local txd = CreateRuntimeTxd(w.txd)
                CreateRuntimeTextureFromDuiHandle(txd, w.tex, GetDuiHandle(w.dui))
            end

            wheels[id] = w
        end
    end

    SetModelAsNoLongerNeeded(h)
    Wait(2000)

    for _, w in pairs(wheels) do
        if w.dui then
            SendToDUI(w, { type = 'init', segments = segs })
            w.ready = true
            anyReady = true
        end
    end

    for _, a in pairs(ANIM) do
        RequestAnimDict(a.dict)
    end

    -- Pull any offsets saved from the in-game editor
    TriggerServerEvent('casino-wheel:requestOffsets')
end)

-- Saved offsets arriving from the server (startup or after a save)
RegisterNetEvent('casino-wheel:applyOffsets', function(saved)
    if type(saved) ~= 'table' then return end
    for id, w in pairs(wheels) do
        w.off = BuildOffset(w.cfg, saved[id] or saved[tostring(id)])
    end
end)

-- ---------------------------------------------------------------
-- RENDER + INPUT — single thread, sleeps when far
-- ---------------------------------------------------------------
CreateThread(function()
    local renderDist = Config.RenderDistance
    local interactDist = Config.InteractionDistance
    local renderSq = renderDist * renderDist
    local interactSq = interactDist * interactDist

    while true do
        if not anyReady then
            Wait(500)
        else
            local pos = GetEntityCoords(PlayerPedId())
            local drew = false

            for id, w in pairs(wheels) do
                if w.ready then
                    local wPos = w.pos or w.cfg.coords
                    local dx = pos.x - wPos.x
                    local dy = pos.y - wPos.y
                    local dz = pos.z - wPos.z
                    local distSq = dx*dx + dy*dy + dz*dz
                    local editing = (editorWheelId == id)

                    if distSq < renderSq or editing then
                        drew = true

                        local mx, my, mz = Pos(w)
                        local rx, ry, rz = Rot(w)
                        local sz = w.off.size

                        DrawMarker(9, mx, my, mz, 0, 0, 0, rx, ry, rz,
                            sz, sz, 0.001, 255, 255, 255, 255,
                            false, false, 2, false, w.txd, w.tex, false)

                        if distSq < interactSq and not editing then
                            if not w.spinning and not playerLocked then
                                DrawText3D(mx, my, mz + sz * 0.55, '~g~[E]~w~ Spin the Wheel')

                                -- Input check inline — no separate thread
                                if IsControlJustPressed(0, 38) then
                                    TriggerServerEvent('casino-wheel:requestSpin', id)
                                end
                            elseif w.spinning then
                                DrawText3D(mx, my, mz + sz * 0.55, '~y~Spinning...')
                            end
                        end
                    end
                end
            end

            -- Far from every wheel — sleep long
            Wait(drew and 0 or 2000)
        end
    end
end)

-- ---------------------------------------------------------------
-- EVENTS
-- ---------------------------------------------------------------
RegisterNetEvent('casino-wheel:doSpin', function(spinnerSrc, seg, wheelId)
    local w = wheels[wheelId]
    if not w then return end

    w.spinning = true
    SendToDUI(w, { type = 'spin', segment = seg, totalSegments = #Config.Segments, duration = Config.SpinDuration })

    if GetPlayerServerId(PlayerId()) == spinnerSrc then
        CreateThread(function()
            local ped = PlayerPedId()
            LockPlayer(true)

            local pCoords = GetEntityCoords(ped)
            local wCoords = w.pos or w.cfg.coords
            local angle = math.deg(math.atan(wCoords.y - pCoords.y, wCoords.x - pCoords.x)) - 90.0
            SetEntityHeading(ped, angle)
            Wait(100)

            PlayAnim(ped, ANIM.spin.dict, ANIM.spin.name, 49, 2000)
            Wait(2000)
            PlayAnim(ped, ANIM.idle.dict, ANIM.idle.name, 49, -1)
        end)
    end
end)

RegisterNetEvent('casino-wheel:spinResult', function(rewardType)
    lastRewardType = rewardType
    pendingReaction = true
end)

RegisterNetEvent('casino-wheel:spinComplete', function(wheelId)
    local w = wheels[wheelId]
    if w then w.spinning = false end

    if pendingReaction then
        pendingReaction = false
        local ped = PlayerPedId()
        StopAnim(ped, ANIM.idle.dict, ANIM.idle.name)
        ClearPedTasks(ped)
        Wait(300)
        CreateThread(function()
            PlayReaction(lastRewardType or 'nothing')
        end)
    end
end)

local function BroadcastToDUIs(d)
    for _, w in pairs(wheels) do SendToDUI(w, d) end
end

RegisterNetEvent('casino-wheel:notify', function(msg, t)
    BroadcastToDUIs({ type = 'notification', message = msg, notifType = t or 'info' })
    BeginTextCommandThefeedPost('STRING') AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(false, true)
end)

RegisterNetEvent('casino-wheel:cooldownInfo', function(r)
    if r > 0 then
        BroadcastToDUIs({ type = 'notification', message = 'Cooldown: ' .. math.ceil(r / 60) .. ' min', notifType = 'info' })
    end
end)

RegisterNetEvent('casino-wheel:spawnPrizeVehicle', function(v)
    local m = GetHashKey(v) RequestModel(m)
    local t = 0
    while not HasModelLoaded(m) do Wait(50) t = t + 50 if t > 10000 then return end end
    local p = GetEntityCoords(PlayerPedId())
    local h = GetEntityHeading(PlayerPedId())
    local veh = CreateVehicle(m, p.x + 3, p.y + 3, p.z, h, true, false)
    SetVehicleOnGroundProperly(veh) SetEntityAsMissionEntity(veh, true, true) SetModelAsNoLongerNeeded(m)
end)

-- ---------------------------------------------------------------
-- INTERNAL API (used by client/editor.lua)
-- ---------------------------------------------------------------
CasinoWheelInternal = {
    wheels = wheels,   -- live reference, mutated in place

    -- Nearest ready wheel to the player, or nil
    nearest = function()
        local pos = GetEntityCoords(PlayerPedId())
        local bestId, bestDist
        for id, w in pairs(wheels) do
            if w.ready then
                local wp = w.pos or w.cfg.coords
                local d = #(pos - wp)
                if not bestDist or d < bestDist then bestId, bestDist = id, d end
            end
        end
        return bestId, bestDist
    end,

    setEditing = function(id) editorWheelId = id end,
    isSpinning = function(id) local w = wheels[id] return w and w.spinning end,
}

-- ---------------------------------------------------------------
-- 3D TEXT + CLEANUP
-- ---------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local o, sx, sy = World3dToScreen2d(x, y, z)
    if o then
        SetTextScale(0.4, 0.4) SetTextFont(4) SetTextProportional(true)
        SetTextColour(255, 255, 255, 255) SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150) SetTextDropShadow() SetTextOutline()
        SetTextEntry('STRING') SetTextCentre(true) AddTextComponentString(text) DrawText(sx, sy)
    end
end

AddEventHandler('onResourceStop', function(r)
    if r == GetCurrentResourceName() then
        if playerLocked then
            LockPlayer(false)
            ClearPedTasks(PlayerPedId())
        end
        for _, w in pairs(wheels) do
            if w.prop and DoesEntityExist(w.prop) then DeleteEntity(w.prop) end
            if w.dui then DestroyDui(w.dui) end
        end
    end
end)

-- RegisterCommand('fixloc', function()
--     SetEntityCoords(PlayerPedId(), 806.0621, -280.0029, 66.4624)
-- end)