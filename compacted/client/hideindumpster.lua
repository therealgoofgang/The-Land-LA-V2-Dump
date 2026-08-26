local DUMPSTER_MODELS = {
    `prop_dumpster_01a`,
    `prop_dumpster_02a`,
    `prop_dumpster_02b`,
    `prop_dumpster_4a`,
    `prop_dumpster_4b`,
}

local USE_TEXT_UI = true
local EXIT_KEY = 38
local EXIT_PROMPT = 'Press [~g~E~w~] to get out'

local inTrash = false
local currentDumpster = nil
local animDict = 'timetable@floyd@cryingonbed@base'
local animName = 'base'

local function requestAnim(dict)
    if lib and lib.requestAnimDict then
        lib.requestAnimDict(dict, 5000)
        return
    end
    RequestAnimDict(dict)
    local timeout = GetGameTimer() + 5000
    while not HasAnimDictLoaded(dict) and GetGameTimer() < timeout do
        Wait(0)
    end
end

local function draw3d(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if not onScreen then return end
    SetTextScale(0.35, 0.35)
    SetTextFont(6)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 180)
    SetTextCentre(1)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = #text / 460
    DrawRect(_x, _y + 0.012, 0.02 + factor, 0.027, 28, 28, 28, 95)
end

local function isDumpsterOccupied(dumpster)
    for _, pid in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(pid)
        if ped ~= 0 and DoesEntityExist(ped) then
            if IsEntityAttachedToEntity(ped, dumpster) then
                return true
            end
        end
    end
    return false
end

local function exitDumpster()
    if not inTrash then return end
    local ped = PlayerPedId()
    SetEntityCollision(ped, true, true)
    SetEntityVisible(ped, true, false)
    ClearPedTasks(ped)
    if IsEntityAttached(ped) then
        DetachEntity(ped, true, true)
    end
    local back = GetOffsetFromEntityInWorldCoords(ped, 0.0, -0.7, -0.75)
    SetEntityCoords(ped, back.x, back.y, back.z, false, false, false, false)
    inTrash = false
    currentDumpster = nil
    if USE_TEXT_UI and lib and lib.hideTextUI then
        lib.hideTextUI()
    end
end

local function enterDumpster(dumpster)
    if inTrash then return end
    local ped = PlayerPedId()
    if not DoesEntityExist(dumpster) then return end
    if isDumpsterOccupied(dumpster) then
        lib.notify({ type = 'error', description = 'This dumpster is occupied' })
        return
    end
    requestAnim(animDict)
    AttachEntityToEntity(ped, dumpster, -1, 0.0, -0.30, 2.00, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 1, 0.0, false, false, false)
    Wait(50)
    SetEntityVisible(ped, false, false)
    SetEntityCollision(ped, false, false)
    currentDumpster = dumpster
    inTrash = true
    if USE_TEXT_UI and lib and lib.showTextUI then
        lib.showTextUI('Press [E] to get out')
    end
end

CreateThread(function()
    while not exports or not exports.ox_target do
        Wait(250)
    end
    exports.ox_target:addModel(DUMPSTER_MODELS, {
        {
            name = 'dumpster_hide',
            icon = 'fa-solid fa-dumpster',
            label = 'Hide inside',
            distance = 2.0,
            canInteract = function(entity, distance)
                if inTrash then return false end
                if not DoesEntityExist(entity) then return false end
                if IsPedDeadOrDying(PlayerPedId(), true) or IsPedFatallyInjured(PlayerPedId()) then return false end
                if isDumpsterOccupied(entity) then return false end
                return distance <= 1.8
            end,
            onSelect = function(data)
                enterDumpster(data.entity)
            end
        }
    })
end)

CreateThread(function()
    while true do
        if not inTrash then
            Wait(200)
        else
            local ped = PlayerPedId()
            if IsControlJustReleased(0, EXIT_KEY) then
                exitDumpster()
            else
                if IsPedDeadOrDying(ped, true) or IsPedFatallyInjured(ped) then
                    exitDumpster()
                elseif not currentDumpster or not DoesEntityExist(currentDumpster) then
                    exitDumpster()
                else
                    if not IsEntityPlayingAnim(ped, animDict, animName, 3) then
                        requestAnim(animDict)
                        TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 1, 0.0, false, false, false)
                    end
                    if not USE_TEXT_UI then
                        local p = GetEntityCoords(currentDumpster)
                        draw3d(p.x, p.y, p.z + 1.1, EXIT_PROMPT)
                    end
                end
            end
            Wait(5)
        end
    end
end)

RegisterCommand('exitdumpster', function()
    exitDumpster()
    print('Reset Trash')
end, false)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    if inTrash then exitDumpster() end
end)