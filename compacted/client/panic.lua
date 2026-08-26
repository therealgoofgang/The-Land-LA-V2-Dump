lib.callback.register('panic:getStreet', function(source)
    local coords = GetEntityCoords(GetPlayerPed(source))
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    return streetName
end)