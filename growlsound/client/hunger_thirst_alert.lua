local hunger, thirst = 100, 100

AddEventHandler('esx_status:onTick', function(data)
    for i = 1, #data do
        if data[i].name == 'hunger' then
            hunger = data[i].val
        elseif data[i].name == 'thirst' then
            thirst = data[i].val
        end
    end
end)

CreateThread(function()
    while true do
        Wait(10000)
        if hunger < Config.HungerThreshold or thirst < Config.ThirstThreshold then
            SendNUIMessage({
                transactionType = 'playSound',
                transactionFile = Config.SoundPath,
                transactionVolume = Config.volume,
            })
            TriggerServerEvent('pm_growlsound:notifyNearbyPlayers')
        end
    end
end)

RegisterNetEvent('pm_growlsound:playSoundNearby', function(coords)
    if #(GetEntityCoords(PlayerPedId()) - coords) < 8.0 then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile = Config.SoundPath,
            transactionVolume = Config.volume,
        })
    end
end)