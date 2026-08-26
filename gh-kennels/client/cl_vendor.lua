-- ============================================================
--  Puppy vendor menu. Pick a puppy, server charges and gives
--  the matching item. Then the player USES the item to spawn
--  the dog and register it.
-- ============================================================

RegisterNetEvent('kennels:client:openVendor', function()
    local options = {}
    for _, stock in ipairs(Config.VendorStock) do
        options[#options + 1] = {
            title       = stock.label,
            description = ('$%d'):format(stock.price),
            onSelect    = function()
                lib.hideContext('kennels_vendor_menu')
                local confirm = lib.alertDialog({
                    header   = 'Buy ' .. stock.label .. '?',
                    content  = ('This will cost $%d.'):format(stock.price),
                    centered = true,
                    cancel   = true
                })
                if confirm == 'confirm' then
                    TriggerServerEvent('kennels:server:buyPuppy', stock.item)
                end
            end
        }
    end
    options[#options + 1] = {
        title    = 'Close',
        icon     = 'fas fa-times',
        onSelect = function() lib.hideContext('kennels_vendor_menu') end
    }

    lib.registerContext({
        id      = 'kennels_vendor_menu',
        title   = 'Puppy Vendor',
        options = options
    })
    lib.showContext('kennels_vendor_menu')
end)
