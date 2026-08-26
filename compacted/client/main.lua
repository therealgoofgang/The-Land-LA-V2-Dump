Citizen.CreateThread(function()
    SetNuiZindex(-1)
end)

TriggerEvent('chat:addSuggestion', '/renamebackpack', 'Rename your backpack', {
    { name = 'name', help = 'The name you want to give your backpack.' }
})

CreateThread(function()
    local poly = lib.zones.poly({
        points = {
            vec3(-111.0, 24.0, 61.0),
            vec3(-100.05000305176, 22.010000228882, 61.0),
            vec3(-128.58999633789, 60.419998168945, 61.0),
            vec3(-108.73999786377, 83.940002441406, 61.0),
            vec3(-29.969999313354, 44.509998321533, 61.0),
            vec3(-41.200000762939, 8.3999996185303, 61.0),
            vec3(-44.849998474121, 1.6399999856949, 61.0),
            vec3(-78.129997253418, 17.180000305176, 61.0),
        },
        thickness = 17.5,
        debug = false,
        onEnter = function()
            LocalPlayer.state:set('disableHitreg', true, true) 
        end,
        onExit = function()
            LocalPlayer.state:set('disableHitreg', false, true) 
        end,
    })
end)

RegisterCommand('roll', function(source, args, rawCommand)
    local number = math.random(1, 6)
    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1500)
    ClearPedTasks(GetPlayerPed(-1))
    TriggerServerEvent('3dme:shareDisplay', 'You Rolled: ' .. number)
end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterCommand('livery', function(source, args)
    local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local liveryID = tonumber(args[1])
        SetVehicleLivery(Veh, liveryID)
end, false)
    
    
RegisterCommand('extra', function(source, args)
    local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local extraID = tonumber(args[1])
    if IsVehicleExtraTurnedOn(Veh, extraID) then
        SetVehicleExtra(Veh, extraID, true)
    else
        SetVehicleExtra(Veh, extraID, false)
    end
end, false) 

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/extra', '', {
		{ name="ID", help="try 1 > 14 to see what extras the vehicle has, Do the command again to remove." }
	})

    TriggerEvent('chat:addSuggestion', '/housestash', 'Open your house stash', {
        { name = 'interactablePointId', help = 'The ID of the interactable point you want to access.' }
    
    })

end)

lib.onCache('vehicle', function(vehicle)
    if vehicle and vehicle ~= 0 then
        for _, v in pairs(GetGamePool("CObject")) do
          if IsEntityAttachedToEntity(cache.ped, v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
          end
        end
    end
end)

