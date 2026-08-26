---@diagnostic disable: undefined-global

RegisterCommand('claims', function()
    local input = lib.inputDialog('Lookup Claims', {
        {
            type = 'select',
            label = 'Lookup by',
            options = {
                { value = 'ingame',  label = 'In-Game ID'  },
                { value = 'discord', label = 'Discord ID'  },
            }
        },
        { type = 'input', label = 'ID', placeholder = 'Enter ID...' }
    })

    if not input or not input[2] or input[2] == '' then return end

    lib.callback('itemclaims:listClaims', false, function(claims)
        if claims == nil then
            lib.notify({ type = 'error', description = 'Access denied or player not found.' })
            return
        end

        if #claims == 0 then
            lib.notify({ type = 'inform', description = 'No claims found for that ID.' })
            return
        end

        Wait(100)
        SetNuiFocus(true, true)
        SendNUIMessage({ action = 'showClaims', claims = claims })
    end, { type = input[1], id = input[2] })
end, false)

RegisterCommand('getinfo', function()
    local playerPed = PlayerPedId()
    local camCoords = GetGameplayCamCoord()
    local camRot = GetGameplayCamRot(2)
    local rx = math.rad(camRot.x)
    local rz = math.rad(camRot.z)
    local dir = vector3(
        -math.sin(rz) * math.abs(math.cos(rx)),
         math.cos(rz) * math.abs(math.cos(rx)),
         math.sin(rx)
    )
    local dest = camCoords + dir * 50.0

    local handle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, dest.x, dest.y, dest.z, -1, playerPed, 4)
    local _, hit, _, _, entity = GetShapeTestResult(handle)

    if not hit or entity == 0 then
        lib.notify({ type = 'error', description = 'Not looking at any entity.' })
        return
    end

    -- if not NetworkGetEntityIsNetworked(entity) then
    --     lib.notify({ type = 'error', description = 'Entity is not networked.' })
    --     return
    -- end

    local entityType = GetEntityType(entity)
    local netId     = NetworkGetNetworkIdFromEntity(entity)
    local health    = GetEntityHealth(entity)

    TriggerServerEvent('itemclaims:getinfo', netId, entityType, health)
end, false)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('deleteClaim', function(data, cb)
    lib.callback('itemclaims:deleteClaim', false, function(success)
        cb(success)
    end, data.claimId)
end)
