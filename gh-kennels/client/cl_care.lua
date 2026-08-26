-- ============================================================
--  Dog care: feeding and watering.
--  Player uses dog_food / dog_water items while near their
--  dog (any breed) to refill its care meters.
-- ============================================================

local careState = {}   -- [dogNetId] = { feeding = N, watering = N, total = N }
local carrierProp = 'lilcarrierghg_prop'

--- Find the closest non-player ped within `radius` that is a
--- valid dog model.
local function findClosestDogPed(radius)
    local pPed = PlayerPedId()
    local pCoords = GetEntityCoords(pPed)
    local closest, closestDist = nil, radius

    -- Iterate every nearby ped (FiveM doesn't expose a native list,
    -- so we check entities found via the player's ped pool)
    local handle, ped = FindFirstPed()
    local success
    repeat
        if not IsPedAPlayer(ped) and DoesEntityExist(ped) then
            local model = GetEntityModel(ped)
            -- Reverse lookup model hash by checking against breed lists
            for _, breed in pairs(Config.Breeds) do
                for modelName in pairs(breed.models) do
                    if joaat(modelName) == model then
                        local d = #(GetEntityCoords(ped) - pCoords)
                        if d < closestDist then
                            closest, closestDist = ped, d
                        end
                        break
                    end
                end
            end
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return closest
end

local function getOrInitState(netId)
    if not careState[netId] then
        careState[netId] = { feeding = 0, watering = 0, total = 0 }
    end
    return careState[netId]
end

local function performCareAction(actionType, itemName, animDict, anim, label)
    local dog = findClosestDogPed(3.0)
    if not dog then
        Kennels.Notify('No dog nearby.', 'error')
        return
    end

    local netId = NetworkGetNetworkIdFromEntity(dog)
    local state = getOrInitState(netId)

    local maxForAction = (actionType == 'feeding') and Config.Care.maxFeeding or Config.Care.maxWatering
    if state[actionType] >= maxForAction then
        Kennels.Notify('This dog has had enough ' .. actionType .. ' for now.', 'error')
        return
    end
    if state.total >= Config.Care.maxTotal then
        Kennels.Notify('This dog is fully cared for.', 'error')
        return
    end

    -- Play animation
    if animDict and anim then
        RequestAnimDict(animDict)
        local timeout = GetGameTimer() + 2000
        while not HasAnimDictLoaded(animDict) and GetGameTimer() < timeout do Wait(10) end
        TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, -8.0, -1, 49, 0, false, false, false)
    end

    local success = lib.progressBar({
        duration  = 4000,
        label     = label,
        useWhileDead = false,
        canCancel = true,
        disable   = { car = true, combat = true }
    })

    ClearPedTasks(PlayerPedId())

    if success then
        state[actionType] = state[actionType] + 1
        state.total = state.total + 1
        Kennels.Notify('Dog ' .. (actionType == 'feeding' and 'fed' or 'watered') .. '.', 'success')
    end
end

-- Hook these events from your inventory (ox_inventory item.use callbacks
-- should TriggerEvent these names).
RegisterNetEvent('kennels:client:useFood', function()
    performCareAction('feeding', 'dog_food', 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 'Feeding dog...')
end)

RegisterNetEvent('kennels:client:useWater', function()
    performCareAction('watering', 'dog_water', 'amb@world_human_drinking@coffee@male@idle_a', 'idle_a', 'Watering dog...')
end)

-- Reset care state when a dog ped is gone (despawned / left area)
CreateThread(function()
    while true do
        Wait(30000)
        for netId in pairs(careState) do
            local ent = NetworkGetEntityFromNetworkId(netId)
            if not DoesEntityExist(ent) then careState[netId] = nil end
        end
    end
end)
