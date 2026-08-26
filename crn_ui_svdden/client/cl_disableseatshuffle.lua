local IsPedInAnyVehicle = IsPedInAnyVehicle
local GetVehiclePedIsIn = GetVehiclePedIsIn
local GetPedInVehicleSeat = GetPedInVehicleSeat
local GetIsTaskActive = GetIsTaskActive
local SetPedIntoVehicle = SetPedIntoVehicle

CreateThread(function()
    while true do
        if IsPedInAnyVehicle(cache.ped, false) then
            veh = GetVehiclePedIsIn(cache.ped, false)
            if GetPedInVehicleSeat(veh, 0) == cache.ped and GetIsTaskActive(cache.ped, 165) then
                SetPedIntoVehicle(cache.ped, veh, 0)
            end
            Wait(5)
        else
            Wait(1000)
        end
    end
end)