CreateThread(function()
    if Inventory == 'codem' then
        RegisterNetEvent(TriggerName('openStash'))
        AddEventHandler(TriggerName('openStash'), function(slots, weight, objectId, stashLabel)
            local stashName = 'campingstash_'..objectId
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', stashName, {slots = slots, maxweight = weight}) 
            TriggerServerEvent('codem-inventory:server:openstash', stashName, slot, weight, stashLabel)
        end)
    end
end)