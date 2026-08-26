RegisterNetEvent('defib_otc:use', function()
    local playerPed = PlayerPedId()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local animDict = "mini@cpr@char_a@cpr_str"
        if not HasAnimDictLoaded(animDict) then
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Wait(0)
            end
        end

        TaskPlayAnim(playerPed, animDict, "cpr_pumpchest", 8.0, -8.0, 6000, 1, 0, false, false, false)
        Wait(6000)

        TriggerServerEvent('defib_otc:defibFinish', GetPlayerServerId(closestPlayer))
    else
        lib.notify({
            title = "Defibrillator",
            description = "No player nearby to revive.",
            type = "error"
        })
    end
end)
