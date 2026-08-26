CreateThread(function()
    while true do
        Wait(700)
        local onlinePlayers = GetActivePlayers()
        local playerPed = PlayerPedId()
        for i=1, #onlinePlayers do
            if onlinePlayers[i] ~= PlayerId() and NetworkIsPlayerActive(onlinePlayers[i]) then
                if MumbleIsPlayerTalking(onlinePlayers[i]) then
                    local targetPed = GetPlayerPed(onlinePlayers[i])
                    if #(GetEntityCoords(targetPed) - GetEntityCoords(playerPed)) < 20 then
                        TaskLookAtEntity(playerPed, targetPed, 3000, 2048, 3)
                    end
                end
            end
        end
    end
end)