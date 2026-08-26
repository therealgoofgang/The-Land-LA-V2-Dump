local itemNames = {}
 
Citizen.CreateThread(function()
    for item, data in pairs(exports.ox_inventory:Items()) do
        itemNames[item] = data.label
    end
end)

RegisterNetEvent('openOfflineInventory', function(data)
    local itemMenu = {}

    for i = 1, #data.inventory do
        local item = data.inventory[i]
        local itemData = {
            title = itemNames[item.name],
            description = item.count..'x',
            image = 'https://cdn2.nullnetwork.ca/2adc0505f31cd560/inventory/' .. item.name .. '.png',
            onSelect = function()
                TriggerServerEvent('takeOfflineItem', data.identifier, item.slot)
            end,
        }

        table.insert(itemMenu, itemData)
    end

    lib.registerContext({
        id = 'offlineInventory',
        title = 'Offline Inventory',
        options = itemMenu
    })

    lib.showContext('offlineInventory')
end)