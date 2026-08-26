CreateThread(function()
    if Inventory == 'qb' then
        RegisterNetEvent(TriggerName('openStash'))
        AddEventHandler(TriggerName('openStash'), function(slots, weight, objectId, stashLabel)
            local stashName = 'campingstash_'..objectId
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', stashName, {slots = slots, maxweight = weight})
            TriggerEvent('inventory:client:SetCurrentStash', stashName)
        end)
    end
end)