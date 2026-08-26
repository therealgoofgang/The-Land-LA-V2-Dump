local storageUnitsCache = {}

local function initStorageUnits()
    local storageUnits = lib.callback.await('compacted:server:fetchStorageUnits', 3000)

    for i = 1, #storageUnits do
        local coords = json.decode(storageUnits[i].coords)

        local inputLocationindex = nil
        inputLocationindex = exports.svdden_dialog:createInputLocation({
            coords = coords,
            radius = 2.0,
            key = 'E',
            label = 'Storage Unit',
            onClicked = function()
                local canBuy = lib.callback.await('compacted:server:canBuyStorageUnit', 2000, { index = storageUnits[i].index })
                if canBuy == nil then return end

                if canBuy then
                    lib.registerContext({
                        id = 'buy_storage_unit',
                        title = 'Buy Storage Unit',
                        menu = 'buy_storage_unit_2',
                        options = {
                            {
                                title = 'Buy Storage Unit',
                                icon = 'fas fa-lock',
                                onSelect = function()
                                    lib.callback.await('compacted:server:buyStorageUnit', 3000, { index = storageUnits[i].index })
                                end,
                            },
                            {
                                title = 'No thank you',
                                icon = 'fas fa-times',
                                onSelect = function() end,
                            }
                        }
                    })
                    lib.showContext('buy_storage_unit')
                else
                    local input = lib.inputDialog('Storage Unit', {
                        {
                            type = 'input', 
                            label = 'Password',
                            description = 'Enter the password to open the storage unit',
                            icon = 'fas fa-key',
                            password = true
                        },
                    })
                       
                    if not input then return end
                    local password = input[1]
    
                    if not password then return end
    
                    local result = lib.callback.await('compacted:server:attemptToOpenUnit', 100, { index = storageUnits[i].index, attemptPassword = password })
                    if result == nil then return end
                    if not result then
                        lib.notify({ type = 'error', description = 'Incorrect password' })
                        return
                    end
    
                    lib.registerContext({
                        id = 'storage_unit',
                        title = 'Storage Unit',
                        menu = 'storage_unit_2',
                        options = {
                            {
                                title = 'Open Storage Unit',
                                icon = 'fas fa-lock',
                                onSelect = function()
                                    lib.callback.await('compacted:server:openStorageUnit', 100, { index = storageUnits[i].index, password = password })
                                end,
                            },
                            {
                                title = 'Change Password',
                                icon = 'fas fa-key',
                                onSelect = function()
                                    local input = lib.inputDialog('Storage Unit', {
                                        {
                                            type = 'input', 
                                            label = 'Password',
                                            description = 'Enter the password to open the storage unit',
                                            icon = 'fas fa-key',
                                            password = true
                                        },
                                    })
                                       
                                    if not input then return end
                                    local newPassword = input[1]
                    
                                    if not newPassword then return end
    
                                    lib.callback.await('compacted:server:changePassword', 100, { index = storageUnits[i].index, newPassword = newPassword, oldPassword = password })
                                end,
                            }
                        }
                    })
                     
                    lib.showContext('storage_unit')
                end
            end
        })

        if storageUnits[i] and storageUnits[i].canBuy then
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, 50)
            SetBlipScale(blip, 0.5)
            SetBlipColour(blip, 2)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('Storage Unit For Sale')
            EndTextCommandSetBlipName(blip)
        end

        storageUnitsCache[#storageUnitsCache + 1] = {
            inputLocationindex = inputLocationindex,
            coords = coords
        }
    end
end

RegisterNetEvent('compacted:client:openStorageUnit', function(storageUI)
    exports.ox_inventory:openInventory('stash', storageUI)
end)

Citizen.CreateThread(function()
    initStorageUnits()
end)