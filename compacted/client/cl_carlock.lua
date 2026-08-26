local hotWiring = false
local keys = {}

local function trim(s)
    return s:match( "^%s*(.-)%s*$" )
end

lib.callback.register('GetClosestPlayer', function ()
    local playerId, _, _  = lib.getClosestPlayer(GetEntityCoords(cache.ped), 5.0, false)
    local alert = lib.alertDialog({
        header = 'Hello there',
        content = 'Would You Like To Give Your Car Keys To ID:' .. GetPlayerServerId(playerId),
        centered = true,
        cancel = true
    })
    return alert == 'confirm' and GetPlayerServerId(playerId) or false
end)

local function Skill()
    return lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'E'})
end

lib.onCache('seat', function(seat)
    if seat ~= -1 then return end
    Wait(50)
    vehicle = cache.vehicle
    local trimmedplate = trim(GetVehicleNumberPlateText(vehicle))
    local Owned = lib.callback.await('DoesPlayerOwnVehicle', false, trimmedplate)
    local npcVehicle = lib.callback.await('IsVehicleANPCVehicle', false, trim(GetVehicleNumberPlateText(vehicle)))
    if Owned or npcVehicle then return end 

    hotWiring = true
    CreateThread(function()
        while hotWiring and cache.vehicle do
            if GetIsVehicleEngineRunning(vehicle) then
                SetVehicleEngineOn(vehicle, false, false, true)
            end

            if not cache.vehicle then
                hotWiring = false
            end

            Wait(0)
        end
        hotWiring = false
    end)
    SetVehicleEngineOn(vehicle, false, false, true)
    SetVehicleUndriveable(vehicle, true)
    if Skill() then
        SetVehicleUndriveable(vehicle, false)
        hotWiring = false
        lib.notify('You Have Successfully Stolen The Vehicle')
        Wait(500)
        SetVehicleEngineOn(vehicle, true, false, true)
    elseif lib.alertDialog({
        header = 'Attempt To Hotwire',
        content = 'You Have Failed To Hotwire The Vehicle Would you like to attempt this again?',
        centered = true,
        cancel = true
    }) == 'confirm' then
        Skill()
    else
        hotWiring = false
        TaskLeaveVehicle(cache.ped, vehicle, 0)
    end
end)

local function SendNotify(msg, type)
    if not type then type = "success" end
    lib.notify({
        description = msg,
        type = type
    })
end

function LockVehicle()
    local veh = lib.getClosestVehicle(GetEntityCoords(cache.ped), 2.5, true)
    if veh ~= nil and veh ~= 0 then
        local result = false
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            veh = GetVehiclePedIsIn(PlayerPedId(), true)
        end
        if not keys[trim(GetVehicleNumberPlateText(veh))] then
            result = lib.callback.await("CheckHasKey", false, trim(GetVehicleNumberPlateText(veh)))
        elseif keys[trim(GetVehicleNumberPlateText(veh))] then
            result = true
        end
        if result then
            if not keys[trim(GetVehicleNumberPlateText(veh))] then
                keys[trim(GetVehicleNumberPlateText(veh))] = true
            end
            local vehLockStatus = GetVehicleDoorLockStatus(veh)
            lib.requestAnimDict("anim@heists@keycard@", 100)
            TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 48, 0, 0, 0, 0)
            NetworkRequestControlOfEntity(veh)
            if vehLockStatus == 1 then
                SetVehicleDoorsLocked(veh, 2)
                if (GetVehicleDoorLockStatus(veh) == 2)then
                    SendNotify("Vehicle locked!")
                else
                    SendNotify("Something went wrong whit the locking system!")
                end
            else
                SetVehicleDoorsLocked(veh, 1)
                if(GetVehicleDoorLockStatus(veh) == 1)then
                    SendNotify("Vehicle unlocked!")
                else
                    SendNotify("Something went wrong whit the locking system!")
                end
            end
            if not IsPedInAnyVehicle(PlayerPedId()) then
                SetVehicleLights(veh, 2)
                Wait(250)
                SetVehicleLights(veh, 1)
                Wait(200)
                SetVehicleLights(veh, 0)
            end
        else
            SendNotify('You dont have the keys of the vehicle..', 'error')
        end
    end
end

RegisterCommand('lockVehicle', function ()
    LockVehicle()
end)

RegisterKeyMapping('lockVehicle', 'Toggle Vehicle Locks', 'keyboard', 'L')