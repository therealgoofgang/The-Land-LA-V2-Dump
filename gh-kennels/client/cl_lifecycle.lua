-- ============================================================
--  Dog lifecycle (client side):
--
--    1. Use puppy item -> name prompt
--    2. Confirm name -> raycast placement preview (mouse moves it,
--       scroll wheel rotates, Enter places, Backspace cancels)
--    3. Confirm placement -> dog row is created, kennel becomes
--       a real targetable entity. Until both feed (4) and water (4)
--       counts are full, the puppy is in the kennel.
--    4. When the puppy hits the threshold, dog promotes to adult
--       and the kennel disappears. /dogmenu summons the adult dog
--       anywhere on the map.
--
--  Kennel coords are NOT persisted to the DB. On rejoin with an
--  unfinished puppy, a kennel respawns next to the player with the
--  same placement preview so they can re-place it.
-- ============================================================

-- ---------------- Local state ----------------
local kennels         = {}    -- [dogId] = { obj, dog }
local puppyFlowActive = false -- single-flight lock for the puppy use flow
local placing         = false -- placement preview running

-- ---------------- Utility ----------------
local function loadModel(name)
    local hash = type(name) == 'number' and name or joaat(name)
    if not IsModelInCdimage(hash) then return nil end
    RequestModel(hash)
    local timeout = GetGameTimer() + 10000
    while not HasModelLoaded(hash) do
        Wait(10)
        if GetGameTimer() > timeout then return nil end
    end
    return hash
end

local function getOffsetFromPlayer(distance)
    local pPed = PlayerPedId()
    local pCoords = GetEntityCoords(pPed)
    local fwd = GetEntityForwardVector(pPed)
    return vector3(pCoords.x + fwd.x * distance,
                   pCoords.y + fwd.y * distance,
                   pCoords.z)
end

-- Raycast from the gameplay camera. Returns hit coords or nil.
local function cameraRaycast(maxDist)
    local cam = GetGameplayCamCoord()
    local rot = GetGameplayCamRot(2)
    local rad = math.pi / 180.0
    local rx = rot.x * rad
    local rz = rot.z * rad
    local cosrx = math.cos(rx)
    local dir = vector3(-math.sin(rz) * math.abs(cosrx),
                         math.cos(rz) * math.abs(cosrx),
                         math.sin(rx))
    local dest = cam + dir * maxDist

    local handle = StartShapeTestRay(cam.x, cam.y, cam.z,
                                     dest.x, dest.y, dest.z,
                                     -1, PlayerPedId(), 0)
    local _, hit, endCoords = GetShapeTestResult(handle)
    if hit == 1 then return endCoords end
    return nil
end

-- ============================================================
--  PLACEMENT PREVIEW
--  Returns vector4(x, y, z, heading) on confirm, nil on cancel.
-- ============================================================
local function placementPreview()
    if placing then return nil end
    placing = true

    local hash = loadModel(Config.Lifecycle.kennelProp)
    if not hash then
        placing = false
        return nil
    end

    local pCoords = GetEntityCoords(PlayerPedId())
    local ghost = CreateObject(hash, pCoords.x, pCoords.y, pCoords.z,
                               false, false, false)
    SetEntityCollision(ghost, false, false)
    SetEntityAlpha(ghost, 150, false)
    SetEntityHasGravity(ghost, false)
    SetModelAsNoLongerNeeded(hash)

    local heading = GetEntityHeading(PlayerPedId())
    local result  = nil

    lib.showTextUI(
        '[Mouse Wheel] Rotate  \n[Enter] Place  \n[Backspace] Cancel',
        { position = 'top-center' }
    )

    while placing do
        local hit = cameraRaycast(20.0)
        if hit then
            SetEntityCoords(ghost, hit.x, hit.y, hit.z, false, false, false, false)
            SetEntityHeading(ghost, heading)
            PlaceObjectOnGroundProperly(ghost)
        end

        DisableControlAction(0, 14, true)  -- mouse wheel down
        DisableControlAction(0, 15, true)  -- mouse wheel up
        DisableControlAction(0, 18, true)  -- ENTER
        DisableControlAction(0, 177, true) -- BACKSPACE / cancel

        if IsDisabledControlJustPressed(0, 14) then
            heading = (heading - 15.0) % 360.0
        elseif IsDisabledControlJustPressed(0, 15) then
            heading = (heading + 15.0) % 360.0
        elseif IsDisabledControlJustPressed(0, 18) then
            local p = GetEntityCoords(ghost)
            result = vector4(p.x, p.y, p.z, heading)
            break
        elseif IsDisabledControlJustPressed(0, 177) then
            break
        end
        Wait(0)
    end

    lib.hideTextUI()
    if DoesEntityExist(ghost) then DeleteEntity(ghost) end
    placing = false
    return result
end

-- ============================================================
--  KENNEL - target options + spawn
-- ============================================================

--- Run a 2-second progress bar, then trigger the server's care event.
--- 'kind' is 'feed' or 'water'.
local function startCareAction(dog, kind)
    local label = (kind == 'feed' and 'Feeding ' or 'Watering ') .. dog.dog_name

    -- "Petting / interacting with animal" anim - kneel down and use hands
    local anim = {
        dict = 'creatures@rottweiler@tricks@',
        clip = 'petting_franklin'
    }

    local success = lib.progressBar({
        duration  = 2000,
        label     = label,
        useWhileDead = false,
        canCancel = true,
        disable   = { car = true, move = true, combat = true },
        anim      = anim
    })
    if not success then
        Kennels.Notify('Cancelled.', 'error')
        return
    end
    TriggerServerEvent('kennels:server:careDog', dog.id, kind)
end

local function buildKennelTargetOptions(dog)
    return {
        {
            name  = 'kennels_kennel_feed_' .. dog.id,
            icon  = 'fas fa-bone',
            label = 'Feed ' .. dog.dog_name,
            onSelect = function() startCareAction(dog, 'feed') end,
            canInteract = function() return dog.stage ~= 'adult' end
        },
        {
            name  = 'kennels_kennel_water_' .. dog.id,
            icon  = 'fas fa-tint',
            label = 'Water ' .. dog.dog_name,
            onSelect = function() startCareAction(dog, 'water') end,
            canInteract = function() return dog.stage ~= 'adult' end
        },
        {
            name  = 'kennels_kennel_status_' .. dog.id,
            icon  = 'fas fa-info-circle',
            label = 'Status',
            onSelect = function()
                lib.notify({
                    description = ('%s | Stage: %s | Fed: %d/%d | Watered: %d/%d')
                        :format(dog.dog_name, dog.stage,
                                dog.feed_count or 0, Config.Care.maxFeeding,
                                dog.water_count or 0, Config.Care.maxWatering),
                    type = 'inform'
                })
            end
        }
    }
end

--- Spawn the real (solid, targetable) kennel at given coords.
local function spawnKennel(dog, coords)
    if kennels[dog.id] then return kennels[dog.id].obj end

    local hash = loadModel(Config.Lifecycle.kennelProp)
    if not hash then return nil end

    local obj = CreateObject(hash, coords.x, coords.y, coords.z,
                             false, false, false)
    SetEntityHeading(obj, coords.w or 0.0)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    SetModelAsNoLongerNeeded(hash)
    Wait(0)

    exports.ox_target:addLocalEntity(obj, buildKennelTargetOptions(dog))
    kennels[dog.id] = { obj = obj, dog = dog }
    return obj
end

local function refreshKennelTarget(dog)
    local rec = kennels[dog.id]
    if not rec or not DoesEntityExist(rec.obj) then return end
    rec.dog = dog
    exports.ox_target:removeLocalEntity(rec.obj)
    Wait(0)
    exports.ox_target:addLocalEntity(rec.obj, buildKennelTargetOptions(dog))
end

local function removeKennel(dogId)
    local rec = kennels[dogId]
    if not rec then return end
    if rec.obj and DoesEntityExist(rec.obj) then
        exports.ox_target:removeLocalEntity(rec.obj)
        DeleteEntity(rec.obj)
    end
    kennels[dogId] = nil
end

-- ============================================================
--  ADULT DOG summoning REMOVED (2026-08-04)
--  Kennel dogs are breeding/selling stock, not companions - the
--  companion system is nn_petshop (Paws of Sandy Shores). Adults
--  stay in your records: breed them or sell them at the kennels.
-- ============================================================

-- ============================================================
--  PUPPY USE FLOW
--  Strict single-flight: puppyFlowActive blocks any duplicate
--  trigger until the whole flow finishes (success or refund).
-- ============================================================
local function refund(item)
    TriggerServerEvent('kennels:server:refundPuppy', item)
end

local function runPuppyFlow(item)
    -- Step 1: name prompt
    local input = lib.inputDialog('Name your puppy', {
        { type = 'input', label = 'Puppy name', required = true, min = 1, max = 50 }
    })
    if not input or not input[1] or input[1] == '' then
        Kennels.Notify('Cancelled. Puppy returned to your inventory.', 'inform')
        refund(item)
        return
    end
    local dogName = input[1]

    -- Step 2: placement preview
    Kennels.Notify('Position the kennel with your camera.', 'inform')
    local coords = placementPreview()
    if not coords then
        Kennels.Notify('Placement cancelled. Puppy returned.', 'inform')
        refund(item)
        return
    end

    -- Step 3: server registration
    ESX.TriggerServerCallback('kennels:server:registerFromPuppy',
        function(ok, dogRowOrError)
            if not ok then
                Kennels.Notify(dogRowOrError or 'Failed to register puppy.', 'error')
                refund(item)
                return
            end
            spawnKennel(dogRowOrError, coords)
            Kennels.Notify(
                dogRowOrError.dog_name .. "'s kennel is set up. Feed and water them to grow up.",
                'success')
        end,
        item, dogName)
end

-- ============================================================
--  EVENT HANDLERS
-- ============================================================

-- Aggressive client-side de-dupe. ANY usePuppy event that arrives
-- within 3 seconds of the previous one is treated as a duplicate
-- and dropped silently (no refund, no notification). This catches
-- the case where another resource on your server is also wired to
-- trigger kennels:client:usePuppy and bypasses our server hook.
-- A duplicate is harmless because the original event is what consumed
-- the item; the duplicate is just noise.
local lastUsePuppyAt = 0

RegisterNetEvent('kennels:client:usePuppy', function(item)
    local now = GetGameTimer()
    if (now - lastUsePuppyAt) < 3000 then
        return
    end
    lastUsePuppyAt = now

    if puppyFlowActive then return end
    puppyFlowActive = true

    runPuppyFlow(item)

    puppyFlowActive = false
end)

RegisterNetEvent('kennels:client:dogUpdated', function(dog)
    -- Refresh kennel target options as feed/water counters change
    if kennels[dog.id] then
        refreshKennelTarget(dog)
    end
end)

-- Server fires this when a puppy hits the threshold and is written to
-- the DB as an adult. The puppy's old (synthetic) id is gone; the
-- adult has a new numeric DB id.
RegisterNetEvent('kennels:client:puppyPromoted', function(oldPuppyId, newAdultDbId)
    if kennels[oldPuppyId] then
        removeKennel(oldPuppyId)
    end
    Kennels.Notify(
        'Your puppy has grown up! Visit the vet and the office - grown dogs can be bred or sold at the kennels.',
        'success')
end)

-- /dogmenu no longer summons - kennel dogs are stock, not companions
RegisterCommand('dogmenu', function()
    Kennels.Notify(
        'Your kennel dogs stay at the kennels - breed them or sell them there. Looking for a companion? Visit Paws of Sandy Shores.',
        'inform')
end, false)

-- ============================================================
--  /placekennel - re-place an existing puppy's kennel.
--  Useful after a relog or if the player wants to move it.
-- ============================================================
RegisterCommand('placekennel', function()
    if puppyFlowActive then
        Kennels.Notify('You are already in the middle of placing a kennel.', 'error')
        return
    end
    ESX.TriggerServerCallback('kennels:server:getMyDogs', function(dogs)
        local options = {}
        for _, dog in ipairs(dogs) do
            if dog.stage == 'puppy' then
                options[#options + 1] = {
                    title       = dog.dog_name,
                    description = ('Fed: %d/%d | Watered: %d/%d'):format(
                        dog.feed_count or 0, Config.Care.maxFeeding,
                        dog.water_count or 0, Config.Care.maxWatering),
                    onSelect = function()
                        if kennels[dog.id] then removeKennel(dog.id) end
                        local coords = placementPreview()
                        if coords then
                            spawnKennel(dog, coords)
                            Kennels.Notify('Kennel placed.', 'success')
                        end
                    end
                }
            end
        end
        if #options == 0 then
            Kennels.Notify('You have no puppies that need a kennel.', 'error')
            return
        end
        options[#options + 1] = {
            title = 'Cancel', icon = 'fas fa-times',
            onSelect = function() lib.hideContext('kennels_place_menu') end
        }
        lib.registerContext({
            id = 'kennels_place_menu', title = 'Place a kennel', options = options
        })
        lib.showContext('kennels_place_menu')
    end)
end, false)

-- ============================================================
--  /cancelpuppy - delete a puppy that's still in the kennel stage.
--  Useful for cleaning up leftover rows from the DB. Doesn't give
--  the item back (you already used it).
-- ============================================================
RegisterCommand('cancelpuppy', function()
    ESX.TriggerServerCallback('kennels:server:getMyDogs', function(dogs)
        local options = {}
        for _, dog in ipairs(dogs) do
            if dog.stage == 'puppy' then
                options[#options + 1] = {
                    title       = dog.dog_name,
                    description = ('Fed: %d/%d | Watered: %d/%d -- DELETE'):format(
                        dog.feed_count or 0, Config.Care.maxFeeding,
                        dog.water_count or 0, Config.Care.maxWatering),
                    icon        = 'fas fa-trash',
                    onSelect = function()
                        local confirm = lib.alertDialog({
                            header   = 'Delete ' .. dog.dog_name .. '?',
                            content  = 'This will permanently remove the puppy. You will NOT get the item back.',
                            centered = true,
                            cancel   = true
                        })
                        if confirm == 'confirm' then
                            if kennels[dog.id] then removeKennel(dog.id) end
                            TriggerServerEvent('kennels:server:deletePuppy', dog.id)
                        end
                    end
                }
            end
        end
        if #options == 0 then
            Kennels.Notify('You have no puppies to cancel.', 'inform')
            return
        end
        options[#options + 1] = {
            title = 'Cancel', icon = 'fas fa-times',
            onSelect = function() lib.hideContext('kennels_cancel_menu') end
        }
        lib.registerContext({
            id = 'kennels_cancel_menu', title = 'Cancel a puppy', options = options
        })
        lib.showContext('kennels_cancel_menu')
    end)
end, false)

-- ============================================================
--  CLEANUP
-- ============================================================
AddEventHandler('onResourceStop', function(resName)
    if resName ~= GetCurrentResourceName() then return end
    placing         = false
    puppyFlowActive = false
    lib.hideTextUI()
    for dogId in pairs(kennels) do removeKennel(dogId) end
end)

-- On load: notify (but don't auto-spawn) puppies that need kennels.
-- The player runs /placekennel to place each one.
CreateThread(function()
    while not (ESX and ESX.PlayerLoaded) do Wait(500) end
    Wait(2000)
    ESX.TriggerServerCallback('kennels:server:getMyDogs', function(dogs)
        local count = 0
        for _, dog in ipairs(dogs) do
            if dog.stage == 'puppy' then count = count + 1 end
        end
        if count > 0 then
            Kennels.Notify(
                ('You have %d puppy%s waiting. Use /placekennel to set up their kennels.')
                    :format(count, count == 1 and '' or 'ies'),
                'inform')
        end
    end)
end)
