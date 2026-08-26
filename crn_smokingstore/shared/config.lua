ESX = exports.es_extended:getSharedObject()

Config = Config or {}

Config.debug = false

Config.billLocations = {
    vec3(-498.4413, 284.8172, 83.36),
    vec3(88.7720, -1430.1790, 29.4329),
    vec3(-1199.5499, -1383.9266, 4.0417),
}

Config.bossMenuLocation = {
    {
        job = 'smoking',
        coords = vec3(-499.2136, 295.8596, 83.3160),
    },
    {
        job = 'vapor',
        coords = vec3(98.2454, -1427.0891, 29.4296),
    },
    {
        job = 'vapeco',
        coords = vec3(-1196.9696, -1387.0680, 4.0532),
    },
    
}

Config.clientNotify = function(type, message) -- This is coming from the client
    TriggerEvent('ox_lib:notify', {
        type = type,
        description = message
    })
end

Config.serverNotify = function(source, type, message) -- This is coming from the server
    TriggerClientEvent('ox_lib:notify', source, {
        type = type,
        description = message
    })
end

function debugPrint(msg) -- This is coming from the server and client
    if Config.debug then
        print(('^5[' .. GetCurrentResourceName() .. ']^0 %s'):format(msg))
    end
end
