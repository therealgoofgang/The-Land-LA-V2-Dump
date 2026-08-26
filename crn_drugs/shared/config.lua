ESX = exports.es_extended:getSharedObject()

Config = Config or {}

Config.debug = false

Config.clientNotify = function(type, message) -- This is coming from the client
    TriggerEvent('ox_lib:notify', { type = type, description = message })
end

Config.serverNotify = function(source, type, message) -- This is coming from the server
    TriggerClientEvent('ox_lib:notify', source, { type = type, description = message })
end

function debugPrint(msg) -- This is coming from the server and client
    if Config.debug then
        print(('^5[Svdden Drugs Debug]^0 %s'):format(msg))
    end
end