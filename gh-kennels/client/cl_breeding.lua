-- ============================================================
--  Breed a dog. Picks a dog under the max breed count, plays
--  a progress bar, then asks the server to award puppies.
-- ============================================================

local function startBreedingProgress(dogId)
    -- Optional kneel emote while breeding
    if Config.Care.kneelEmote and Config.Care.kneelEmote ~= '' then
        ExecuteCommand(Config.Care.kneelEmote)
    end

    local success = lib.progressBar({
        duration  = Config.Breeding.timeSeconds * 1000,
        label     = 'Breeding dog...',
        useWhileDead = false,
        canCancel = true,
        disable   = { car = true, move = true, combat = true }
    })

    if Config.Care.cancelEmote and Config.Care.cancelEmote ~= '' then
        ExecuteCommand(Config.Care.cancelEmote)
    end

    if success then
        TriggerServerEvent('kennels:server:completeBreeding', dogId)
    else
        Kennels.Notify('Breeding cancelled.', 'error')
    end
end

RegisterNetEvent('kennels:client:openBreeding', function()
    ESX.TriggerServerCallback('kennels:server:getMyDogs', function(dogs)
        Kennels.ShowDogPicker(
            'kennels_breeding_menu',
            'Breed Dog (requires shots + paperwork)',
            dogs,
            function(dog)
                if dog.stage ~= 'adult' then return false end
                if not Kennels.IsTrue(dog.has_shots) then return false end
                if not Kennels.IsTrue(dog.has_paperwork) then return false end
                local breed = Config.Breeds[dog.breed]
                local maxBreedings = (breed and breed.maxBreedings) or 5
                return (dog.breeding_count or 0) < maxBreedings
            end,
            function(dog)
                lib.hideContext('kennels_breeding_menu')
                ESX.TriggerServerCallback('kennels:server:canBreed', function(canBreed, reason)
                    if canBreed then
                        startBreedingProgress(dog.id)
                    else
                        Kennels.Notify(reason or 'Cannot breed right now.', 'error')
                    end
                end, dog.id)
            end
        )
    end)
end)
