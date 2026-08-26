RegisterNetEvent('crn_notify:notify', function(data)
    if not data then return end
    SendNuiMessage(json.encode({
        action = 'sendNotify',
        data = {
            icon = data.icon or 'fas fa-user',
            title = data.title or false,
            message = data.description or false,
            duration = data.duration or 5000
        }
    }))
end)