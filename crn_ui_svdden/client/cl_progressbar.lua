local progressbarActive = false

RegisterNetEvent('crn_progress:progress', function(data)
    if progressbarActive then return end
    if not data then return end
    progressbarActive = true

    SendNuiMessage(json.encode({
        action = 'progress',
        data = {
            label = data.label,
            duration = data.duration
        }
    }))
end)

RegisterNetEvent('crn_progress:cancelProgress', function()
    progressbarActive = false
    SendNuiMessage(json.encode({
        action = 'cancelProgress',
    }))
end)

RegisterNUICallback('progressComplete', function(data, cb)
    progressbarActive = false
    TriggerEvent('crn_progress:progressCompletedSync')
    cb(1)
end)