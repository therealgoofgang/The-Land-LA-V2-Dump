CreateThread(function()
    while true do
        SendNUIMessage({
            action = "setGender",
            data = {
                isFemale = LocalPlayer.state.isFemale or false
            }
        })
        Wait(10000)
    end
end)

RegisterNetEvent('crn_ui_svdden:waterMarkState', function(state)
    brandingHidden = state
    SendNUIMessage({
        action = "brandingHandle",
        data = {
            state = state,
        }
    })
end)

-- Force-hide the persistent watermark while a fullscreen flow owns the screen
-- (character select / spawn selector). While locked, the visibility loop below
-- keeps it hidden regardless of pause/inventory state. Fire with `false` to
-- release the lock and resume normal behaviour.
brandingLocked = false
RegisterNetEvent('crn_ui_svdden:client:brandingLock', function(hidden)
    brandingLocked = hidden and true or false
    -- push the new state immediately so it doesn't wait for the 2s tick
    SendNUIMessage({
        action = "brandingHandle",
        data = { state = (not brandingLocked) and not (IsPauseMenuActive() or LocalPlayer.state.invOpen) }
    })
end)

CreateThread(function()
    while true do
        local visible = not (brandingLocked or IsPauseMenuActive() or LocalPlayer.state.invOpen)
        SendNUIMessage({
            action = "brandingHandle",
            data = {
                state = visible,
            }
        })
        Wait(2000)
    end
end)