function initDrugPlugsPeds()
    local drugPlugs = lib.callback.await('svdden_drugs:fetchDrugPlugs', false).drugPlugs
    for _, v in pairs(drugPlugs) do
        exports.svdden_dialog:createDialogPed({
            coords = vector4(v.coords.x, v.coords.y, v.coords.z + 1, v.coords.w),
            pedData = {
                coords = v.coords,
                pedModel = 'S_M_M_StudioSouEng_02',
                animation = 'WORLD_HUMAN_DRUG_DEALER',
                extraData = {
                    freezeEntity = true,
                    invincible = true,
                    blockingEvents = true,
                }
            },
            radius = 4.0,
            key = 'E',
            label = 'Speak with Drug Importer',
            dialogData = {
                icon = 'fas fa-dolly-flatbed',
                title = 'Drug Importer',
                description = 'You ready to re up?',
                overRideLeaveConversation = 'I\'ll be back for sure, but gotta go now.',
                buttons = {
                    {
                        label = 'Maybe next time, but this sounds tempting...',
                        onSelect = function() end,
                    },
                    {
                        label = 'Show me the goods, I’m ready to deal!',
                        onSelect = function()
                            local result = lib.callback.await('svdden_drugs:attemptToDealWithDrugImporter', false, v.id)
                            if result.response then 
                                local options = {}

                                for _, d in pairs(result.data.drugs) do
                                    table.insert(options, {
                                        title = d.label,
                                        image = 'https://cdn2.nullnetwork.ca/2adc0505f31cd560/inventory/' .. d.spawnName .. '.png',
                                        onSelect = function()
                                            local input = lib.inputDialog('Enter Amount', {
                                                { type = 'number', label = 'Drug Amount', description = 'Select the amount of this drug you want!' },
                                            })
 
                                            if not input then return end

                                            local result2 = lib.callback.await('svdden_drugs:purchaseDrug', false, {
                                                drugImporterId = v.id,
                                                drugId = d.drugId,
                                                amount = input[1]
                                            })

                                            lib.notify({ type = result2.response and 'success' or 'error', description = result2.message })
                                        end
                                    })
                                end

                                lib.registerContext({
                                    id = 'drug_importer',
                                    title = 'Drug Importer [' .. result.data.totalStock .. ']',   
                                    menu = 'drug_importer',
                                    options = options
                                })
                                 
                                lib.showContext('drug_importer')
                            else 
                                lib.notify({ type = 'error', description = result.message })
                            end
                        end,
                    },
                },
            }
        })
    end
end

RegisterNetEvent('svdden_drugs:createPlugPed', function(data)
    local coords = data.coords

    exports.svdden_dialog:createDialogPed({
        coords = vector4(coords.x, coords.y, coords.z + 1, coords.w),
        pedData = {
            coords = coords,
            pedModel = 'S_M_M_StudioSouEng_02',
            animation = 'WORLD_HUMAN_DRUG_DEALER',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        radius = 4.0,
        key = 'E',
        label = 'Speak with Drug Importer',
        dialogData = {
            icon = 'fas fa-dolly-flatbed',
            title = 'Drug Importer',
            description = 'You ready to re up?',
            overRideLeaveConversation = 'I\'ll be back for sure, but gotta go now.',
            buttons = {
                {
                    label = 'Maybe next time, but this sounds tempting...',
                    onSelect = function() end,
                },
                {
                    label = 'Show me the goods, I’m ready to deal!',
                    onSelect = function()
                        local result = lib.callback.await('svdden_drugs:attemptToDealWithDrugImporter', false, data.id)
                        if result.response then 
                            local options = {}

                            for _, d in pairs(result.data.drugs) do
                                table.insert(options, {
                                    title = d.label,
                                    image = 'https://cdn2.nullnetwork.ca/2adc0505f31cd560/inventory/' .. d.spawnName .. '.png',
                                    onSelect = function()
                                        local input = lib.inputDialog('Enter Amount', {
                                            { type = 'number', label = 'Drug Amount', description = 'Select the amount of this drug you want!' },
                                        })
                
                                        if not input then return end

                                        local result2 = lib.callback.await('svdden_drugs:purchaseDrug', false, {
                                            drugImporterId = data.id,
                                            drugId = d.drugId,
                                            amount = input[1]
                                        })

                                        lib.notify({ type = result2.response and 'success' or 'error', description = result2.message })
                                    end
                                })
                            end

                            lib.registerContext({
                                id = 'drug_importer',
                                title = 'Drug Importer [' .. result.data.totalStock .. ']',   
                                menu = 'drug_importer',
                                options = options
                            })
                            
                            lib.showContext('drug_importer')
                        else 
                            lib.notify({ type = 'error', description = result.message })
                        end
                    end,
                },
            },
        }
    })
end)

TriggerEvent('chat:addSuggestion', '/createdrugplug', 'Create a drug plug', {
    { name="discordId", help="The Discord ID of the plug owner" },
})
