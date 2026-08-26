RegisterNetEvent('showNewAdvertisement', function(data)
    if not data or not data.fullName or not data.message then return end
    
    SendNuiMessage(json.encode({
        action = 'newAdvertisement',
        data = {
            fullName = data.fullName or 'Unknown',
            message = data.message or 'Unknown',
        }
    }))
end)