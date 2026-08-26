

local function identificationOfficer()
    exports.svdden_dialog:createDialogPed({
        coords = Config.courtHouse.identificationOfficer.pedData.coords + vector4(0.0, 0.0, 1.0, 0.0),
        pedData = Config.courtHouse.identificationOfficer.pedData,
        radius = Config.courtHouse.identificationOfficer.interactionDistance,
        key = Config.courtHouse.identificationOfficer.key,
        label = Config.courtHouse.identificationOfficer.label,
        dialogData = {
            icon = 'fa fa-id-card',
            title = 'Ida',
            description = 'Which identification would you like to receive?',
            buttons = {
                {
                    label = 'Identity Card',
                    onSelect = function()
                        SendNUIMessage({
                            action = 'uploadImage',
                            data = {
                                url = getPedHeadShotUrl(PlayerPedId()),
                                type = 'identity'
                            }
                        })
                    end,
                },
                {
                    label = 'Firearm Certificate',
                    onSelect = function()
                        if not lib.callback.await('identity:hasFirearmLicense', 5000) then lib.notify( { type = 'error', description = 'You do not have a firearm license.' }) return end

                        SendNUIMessage({
                            action = 'uploadImage',
                            data = {
                                url = getPedHeadShotUrl(PlayerPedId()),
                                type = 'firearm'
                            }
                        })
                    end,
                },
            },
        },
    })
end

RegisterNetEvent('showIdentityCardByType', function(data)
    if not data then return end
    nuiHandler(true, true, data.cardType == 'identity' and 'IDCARD' or 'WEAPONCARD', data)
end)

RegisterNuiCallback('identityCreated', function(data, cb)
    local result = lib.callback.await('identity:createIdentityCard', false, data)
    cb('')
end)

function initIdentityPed()
    identificationOfficer()
end