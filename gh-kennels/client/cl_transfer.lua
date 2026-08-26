-- ============================================================
--  Transfer ownership of a dog to a nearby player.
--  Player picks dog -> picks nearby player -> server moves
--  the row to the target's citizenid.
-- ============================================================

local function getNearbyPlayers()
    local me = PlayerPedId()
    local myCoords = GetEntityCoords(me)
    local nearby = {}

    for _, playerId in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(playerId)
        if ped ~= me and DoesEntityExist(ped) then
            if #(GetEntityCoords(ped) - myCoords) <= 5.0 then
                local serverId = GetPlayerServerId(playerId)
                nearby[#nearby + 1] = {
                    serverId = serverId,
                    name     = GetPlayerName(playerId) or ('Player ' .. serverId)
                }
            end
        end
    end
    return nearby
end

local function pickTargetPlayer(dog)
    local players = getNearbyPlayers()
    if #players == 0 then
        Kennels.Notify(Config.Messages.transferTargetNotFound, 'error')
        return
    end

    local options = {}
    for _, p in ipairs(players) do
        options[#options + 1] = {
            title    = p.name .. ' [' .. p.serverId .. ']',
            onSelect = function()
                lib.hideContext('kennels_transfer_target')
                TriggerServerEvent('kennels:server:transferDog', dog.id, p.serverId)
            end
        }
    end
    options[#options + 1] = {
        title    = 'Cancel',
        icon     = 'fas fa-times',
        onSelect = function() lib.hideContext('kennels_transfer_target') end
    }

    lib.registerContext({
        id      = 'kennels_transfer_target',
        title   = 'Transfer ' .. dog.dog_name .. ' to...',
        options = options
    })
    lib.showContext('kennels_transfer_target')
end

RegisterNetEvent('kennels:client:openTransfer', function()
    ESX.TriggerServerCallback('kennels:server:getMyDogs', function(dogs)
        Kennels.ShowDogPicker(
            'kennels_transfer_menu',
            'Transfer Dog (requires shots + paperwork)',
            dogs,
            function(dog)
                return dog.stage == 'adult'
                   and Kennels.IsTrue(dog.has_shots)
                   and Kennels.IsTrue(dog.has_paperwork)
            end,
            function(dog)
                lib.hideContext('kennels_transfer_menu')
                pickTargetPlayer(dog)
            end
        )
    end)
end)
