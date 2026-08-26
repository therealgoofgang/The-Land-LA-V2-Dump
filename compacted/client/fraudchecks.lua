Citizen.CreateThread(function()
    exports.svdden_dialog:createDialogPed({
        coords = vector4(247.0902, 225.0836, 106.2876, 163.5712),
        pedData  = { -- (https://docs.fivem.net/docs/game-references/ped-models)
            coords = vector4(247.0902, 225.0836, 105.2876, 163.5712), -- This is the location of the ped
            pedModel = 's_m_m_fiboffice_02', -- This is the model of the ped
            animation = 'WORLD_HUMAN_CLIPBOARD', -- This is the animation the ped will play (https://wiki.rage.mp/index.php?title=Scenarios)
            extraData = {
                freezeEntity = true, -- This will freeze the ped in place
                invincible = true, -- This will make the ped invincible to damage
                blockingEvents = true, -- This will block events from being triggered
            }
        },
        radius = 2.0,
        key = 'E',
        label = 'Speak with Markus',
        dialogData = {
            icon = 'fa fa-info-circle',
            title = 'Markus',
            description = 'Would you like to cash in your checks?',
            buttons = {
                {
                    label = 'Yea i have some checks',
                    onSelect = function()
                        local coordBefore = GetEntityCoords(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), true)
                        if lib.progressBar({
                            duration = 10000,
                            label = 'Cashing in forged check',
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                            },
                        }) then
                            local chance = 20 -- percent

                            if math.random(1, 100) <= chance then
                                local data = exports['cd_dispatch']:GetPlayerInfo()
                                TriggerServerEvent('cd_dispatch:AddNotification', {
                                    job_table = {'police'}, 
                                    coords = data.coords,
                                    title = '10-15 - Fake Check',
                                    message = 'A '..data.sex..' has been caught cashing in a forged check at the bank',
                                    flash = 0,
                                    unique_id = data.unique_id,
                                    sound = 1,
                                    blip = {
                                        sprite = 431, 
                                        scale = 1.2, 
                                        colour = 3,
                                        flashes = false, 
                                        text = '911 - Fake Check',
                                        time = 5,
                                        radius = 0,
                                    }
                                })
                            end

                            local newCoords = GetEntityCoords(PlayerPedId())

                            if LocalPlayer.state.dead then
                                FreezeEntityPosition(PlayerPedId(), false)
                                lib.notify({ type = 'error', description = 'You died while cashing in the check' })
                                return
                            end

                            if Vdist(coordBefore, newCoords) < 10.0 then
                                TriggerServerEvent('cashInForgedCheck')
                                FreezeEntityPosition(PlayerPedId(), false)
                            else
                                lib.notify({ type = 'error', description = 'You moved too far away from the ped' })
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    end,
                }
            },
        }
    })
end)