-- ============================================================
--  When the server asks for the model of the dog the player is
--  closest to, find it and report back.
-- ============================================================

local function findClosestDogPedClient(radius)
    local pPed = PlayerPedId()
    local pCoords = GetEntityCoords(pPed)
    local closest, closestDist, closestModel = nil, radius, nil

    local handle, ped = FindFirstPed()
    local success
    repeat
        if not IsPedAPlayer(ped) and DoesEntityExist(ped) then
            local model = GetEntityModel(ped)
            for _, breed in pairs(Config.Breeds) do
                for modelName in pairs(breed.models) do
                    if joaat(modelName) == model then
                        local d = #(GetEntityCoords(ped) - pCoords)
                        if d < closestDist then
                            closest, closestDist, closestModel = ped, d, modelName
                        end
                        break
                    end
                end
            end
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return closest, closestModel
end

RegisterNetEvent('kennels:client:getNearbyDogModel', function(name)
    local _, model = findClosestDogPedClient(3.0)
    if not model then
        Kennels.Notify('No dog within 3m to register.', 'error')
        return
    end
    TriggerServerEvent('kennels:server:registerDog', name, model)
end)
