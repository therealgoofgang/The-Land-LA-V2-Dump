local blipCache = {}

local function openChinaTownMarket(index) 
    exports.ox_inventory:openInventory('shop', { type = 'ChinaMarket'..index, id = 1 })
end

function initChinaTown()
    for i = 1, #Config.chinaTownMarket do
        local chinaTownDealer = Config.chinaTownMarket[i]
        local index = i

        exports.svdden_dialog:createDialogPed({
            coords = chinaTownDealer.coords,
            pedData = chinaTownDealer.pedData,
            radius = chinaTownDealer.interactionDistance,
            key = 'E',
            label = 'Speak with ' .. chinaTownDealer.name,
            dialogData = {
                icon = chinaTownDealer.dialogData.icon,
                title = chinaTownDealer.dialogData.title,
                description = chinaTownDealer.dialogData.description,
                buttons = {
                    {
                        label = 'Yes please',
                        onSelect = function()
                            openChinaTownMarket(index)
                        end,
                    },
                },
            }
        })

        if chinaTownDealer and chinaTownDealer.blipData then
            blipCache[index] = AddBlipForCoord(chinaTownDealer.blipData.coords)
            SetBlipSprite(blipCache[index], chinaTownDealer.blipData.sprite)
            SetBlipDisplay(blipCache[index], 4)
            SetBlipScale(blipCache[index], chinaTownDealer.blipData.scale)
            SetBlipColour(blipCache[index], chinaTownDealer.blipData.color)
            SetBlipAsShortRange(blipCache[index], chinaTownDealer.blipData.shortRange)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(chinaTownDealer.blipData.name)
            EndTextCommandSetBlipName(blipCache[index])
        end
    end
end

CreateThread(function()
    initChinaTown()
end)