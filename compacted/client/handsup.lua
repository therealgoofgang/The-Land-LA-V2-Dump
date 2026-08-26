local handsup = false

RegisterCommand('handsup', function()
    if exports.wasabi_ambulance:isPlayerDead() then return end

    local dict = "missminuteman_1ig_2"
    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end

    if not handsup then
        TaskPlayAnim(PlayerPedId(), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
        handsup = true
        LocalPlayer.state:set('isHandsUp', true, true)
    else
        handsup = false
        ClearPedTasks(PlayerPedId())
        Wait(3000)
        LocalPlayer.state:set('isHandsUp', false, true)
    end
end)

RegisterKeyMapping('handsup', 'Raise and Lower Hands', 'keyboard', 'X')