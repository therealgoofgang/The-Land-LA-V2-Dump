lib.onCache('vehicle', function(vehicle, oldveh)
    if vehicle then
		DisplayRadar(true)
		local playerID = PlayerId()
        while GetVehiclePedIsIn(PlayerPedId(), false) == vehicle do
			local isBike = GetVehicleClass(vehicle) == 8
			if isBike then
				RemovePedHelmet(PlayerPedId(), true)
				SetPedConfigFlag(PlayerPedId(), 35, false)
			end
            Wait(4)
        end
	else
		DisplayRadar(false)
    end
end)

RegisterCommand('engine', function()
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if not currentVehicle or currentVehicle == 0 then
        lib.notify({ type = 'error', description = 'You are not in a vehicle.' })
        return
    end

    local engineState = GetIsVehicleEngineRunning(currentVehicle)
    if engineState then
        SetVehicleEngineOn(currentVehicle, false, false, true)
        lib.notify({ type = 'success', description = 'Engine turned off.' })
    else
        SetVehicleEngineOn(currentVehicle, true, false, true)
        lib.notify({ type = 'success', description = 'Engine turned on.' })
    end
end)

RegisterNetEvent('txcl:vehicle:fix', function()
	local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	exports['nn_fuel']:SetFuel(currentVehicle, 100.0)
end)