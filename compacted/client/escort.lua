LocalPlayer.state.escort = false

RegisterCommand('escort', function()
    if LocalPlayer.state.escort then return lib.notify({ type = 'error', description = 'No can not do this right now!' }) end

    if IsPedInAnyVehicle(PlayerPedId(), false) then 
        return lib.notify({ type = 'error', description = 'You can not do this in a vehicle' }) 
    end

    local playerId, playerPed, playerCoords = lib.getClosestPlayer(GetEntityCoords(PlayerPedId()), 3.0, false)
    if not playerId then 
        return lib.notify({ type = 'error', description = 'No player found' }) 
    end

    local serverId = GetPlayerServerId(playerId)
    TriggerServerEvent('compacted:escortStart', serverId)
end)

RegisterNetEvent('compacted:escortGet', function(playerId)
    if not LocalPlayer.state.escort then
        local dragger = GetPlayerPed(GetPlayerFromServerId(playerId))
        SetEntityCoords(cache.ped, GetOffsetFromEntityInWorldCoords(dragger, 0.0, 0.45, 0.0))
        AttachEntityToEntity(cache.ped, dragger, 11816, 0.45, 0.45, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        LocalPlayer.state.escort = playerId
    else
        LocalPlayer.state.escort = false
        DetachEntity(cache.ped, true, false)
    end
end)