CreateThread(function()
    SetMaxWantedLevel(0)

    for i = 1, 15 do
        EnableDispatchService(i, false)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(500)
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL50'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_SMG'))

        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)

        SetVehicleModelIsSuppressed(GetHashKey("rubble"), true)
        SetVehicleModelIsSuppressed(GetHashKey("dump"), true)
        SetVehicleModelIsSuppressed(GetHashKey("taco"), true)
        SetVehicleModelIsSuppressed(GetHashKey("biff"), true)
        SetVehicleModelIsSuppressed(GetHashKey("hydra"), true)
        SetVehicleModelIsSuppressed(GetHashKey("rhino"), true)
        SetVehicleModelIsSuppressed(GetHashKey("polmav"), true)
        SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
        SetVehicleModelIsSuppressed(GetHashKey("blimp2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("lazer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("policeb"), true)
    end
end)

AddEventHandler("playerSpawned", function()
    NetworkSetFriendlyFireOption(true)
    SetCanAttackFriendly(PlayerPedId(), true, true)
end)

Citizen.CreateThread(function()
    local sleep = 1000
    while true do
        Citizen.Wait(sleep)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            sleep = 0
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        else
            sleep = 1000
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        N_0xf4f2c0d4ee209e20()
        Wait(5000)
    end
end)