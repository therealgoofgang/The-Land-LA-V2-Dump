--[[
    Custom BuBu crafting client (plaintext replacement of escrowed table.lua).

    Interaction uses ox_target:
      * When a table is spawned (server broadcasts its netId + ownerLicense),
        if the owner is US, we add an ox_target to that specific entity with
        "Open Crafting" and "Pick Up Table" options.
      * Other players receive the broadcast but skip the target add, so they
        can't interact with tables they don't own. ox_target handles all the
        distance, prompt, and input for us — no scan loops needed.

    Placement: local ghost prop for the UX, raycast from camera + scroll to
    rotate. On confirm, server creates the real networked entity.
]]

local TABLE_MODEL  = `theo_lubudesk`
local RESOURCE     = GetCurrentResourceName()
local TARGET_ZONE  = 'bubuCraft_table'

local uiOpen          = false
local placementActive = false
local placingObj      = nil
local placementHeading = 0.0

-- Keep the last interacted entity's coords so openSession/pickup have them
local lastInteractCoords = nil
local lastInteractNetId  = nil

local myLicense = nil

-- ===========================================================================
-- Recipe payload + inventory counts for the NUI
-- ===========================================================================

local function buildRecipePayload()
    local payload = {}
    for i, r in ipairs(Recipes) do
        local ings = {}
        for j, ing in ipairs(r.ingredients) do
            ings[j] = { item = ing.item, count = ing.count }
        end
        payload[i] = {
            index       = i,
            id          = r.id,
            name        = r.name,
            rarity      = r.rarity,
            resultItem  = r.result.item,
            resultCount = r.result.count,
            ingredients = ings,
        }
    end
    return payload
end

local function getInventoryCounts()
    local counts = {}
    local seen = {}
    for _, r in ipairs(Recipes) do
        for _, ing in ipairs(r.ingredients) do
            if not seen[ing.item] then
                seen[ing.item] = true
                counts[ing.item] = exports.ox_inventory:Search('count', ing.item) or 0
            end
        end
    end
    return counts
end

local function sendInventoryToNUI()
    SendNUIMessage({ action = 'bubuCraft:updateInventory', counts = getInventoryCounts() })
end

-- ===========================================================================
-- UI open/close
-- ===========================================================================

local function openUI(coords)
    if uiOpen then return end
    lastInteractCoords = coords

    TriggerServerEvent('bubuCraft:openSession', coords)

    uiOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action  = 'bubuCraft:open',
        recipes = buildRecipePayload(),
        counts  = getInventoryCounts(),
    })
end

local function closeUI()
    if not uiOpen then return end
    uiOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'bubuCraft:close' })
    TriggerServerEvent('bubuCraft:closeSession')
end

RegisterNUICallback('bubuCraft_close', function(_, cb)
    closeUI()
    cb(1)
end)

RegisterNUICallback('bubuCraft_craft', function(data, cb)
    local idx = tonumber(data and data.index)
    if not idx then cb({ ok = false, reason = 'bad_index' }) return end
    TriggerServerEvent('bubuCraft:craft', idx)
    cb({ ok = true })
end)

RegisterNetEvent('bubuCraft:craftResult', function(result)
    if uiOpen then
        SendNUIMessage({
            action = 'bubuCraft:craftResult',
            ok     = result.ok,
            reason = result.reason,
            index  = result.index,
        })
        SetTimeout(150, sendInventoryToNUI)
    end
    if result.ok then
        lib.notify({ type = 'success', title = 'BuBu Crafting', description = 'Crafted successfully!' })
    elseif result.reason == 'missing_ingredients' then
        lib.notify({ type = 'error', title = 'BuBu Crafting', description = 'You are missing ingredients.' })
    elseif result.reason == 'too_far' then
        lib.notify({ type = 'error', title = 'BuBu Crafting', description = 'You moved away from the table.' })
    elseif result.reason == 'cooldown' then
        lib.notify({ type = 'error', title = 'BuBu Crafting', description = 'Slow down a second!' })
    elseif result.reason == 'no_session' then
        lib.notify({ type = 'error', title = 'BuBu Crafting', description = 'Open the table again.' })
    elseif result.reason == 'inventory_full' then
        lib.notify({ type = 'error', title = 'BuBu Crafting', description = 'Your inventory is full.' })
    end
end)

-- ESC via raw key (works while NUI has focus)
CreateThread(function()
    while true do
        if uiOpen then
            if IsRawKeyReleased(0x1B) then closeUI() end
            Wait(0)
        else
            Wait(500)
        end
    end
end)

-- ===========================================================================
-- ox_target bindings per entity
-- ===========================================================================

local function addTargetForEntity(entity)
    exports.ox_target:addLocalEntity(entity, {
        {
            name   = 'bubuCraft_open_' .. entity,
            label  = '✿ Open BuBu Crafting',
            icon   = 'fa-solid fa-wand-magic-sparkles',
            distance = 2.5,
            onSelect = function(data)
                if placementActive then return end
                local ent = data.entity
                if not ent or not DoesEntityExist(ent) then return end
                openUI(GetEntityCoords(ent))
            end,
        },
        {
            name   = 'bubuCraft_pickup_' .. entity,
            label  = 'Pick Up Table',
            icon   = 'fa-solid fa-hand',
            distance = 2.5,
            onSelect = function(data)
                if placementActive then return end
                local ent = data.entity
                if not ent or not DoesEntityExist(ent) then return end
                local netId = NetworkGetNetworkIdFromEntity(ent)
                if netId == 0 then return end
                TriggerServerEvent('bubuCraft:requestPickup', netId)
            end,
        },
    })
end

local function removeTargetForEntity(entity)
    if not entity or entity == 0 then return end
    exports.ox_target:removeLocalEntity(entity, {
        'bubuCraft_open_' .. entity,
        'bubuCraft_pickup_' .. entity,
    })
end

-- Wait for a networked entity to actually arrive on this client before
-- binding the target (streaming delay — server spawned, broadcast arrived,
-- but the entity might not have streamed in yet for every client).
local function waitForEntityAndBind(netId)
    CreateThread(function()
        local timeout = GetGameTimer() + 10000
        while GetGameTimer() < timeout do
            local ent = NetworkDoesEntityExistWithNetworkId(netId) and NetworkGetEntityFromNetworkId(netId) or 0
            if ent ~= 0 and DoesEntityExist(ent) then
                addTargetForEntity(ent)
                return
            end
            Wait(250)
        end
    end)
end

-- ===========================================================================
-- Server broadcasts
-- ===========================================================================

RegisterNetEvent('bubuCraft:tableSpawned', function(netId, ownerLicense)
    if ownerLicense == myLicense then
        waitForEntityAndBind(netId)
    end
end)

RegisterNetEvent('bubuCraft:tableRemoved', function(netId)
    if NetworkDoesEntityExistWithNetworkId(netId) then
        local ent = NetworkGetEntityFromNetworkId(netId)
        if ent ~= 0 then removeTargetForEntity(ent) end
    end
end)

RegisterNetEvent('bubuCraft:ownershipSync', function(snapshot)
    for _, row in ipairs(snapshot) do
        if row.owner == myLicense then
            waitForEntityAndBind(row.netId)
        end
    end
end)

RegisterNetEvent('bubuCraft:whoAmIResponse', function(license)
    myLicense = license
    -- After we know who we are, ask for current tables so we can
    -- re-bind targets to any that existed before we joined.
    TriggerServerEvent('bubuCraft:requestOwnershipSync')
end)

CreateThread(function()
    Wait(500) -- let server resource finish init
    TriggerServerEvent('bubuCraft:whoAmI')
end)

-- ===========================================================================
-- Placement mode (ghost prop → server spawns real networked entity)
-- ===========================================================================

local function endPlacement(deleteGhost)
    placementActive = false
    local obj = placingObj
    placingObj = nil
    if obj and DoesEntityExist(obj) and deleteGhost then
        SetEntityAsMissionEntity(obj, true, true)
        DeleteObject(obj)
        if DoesEntityExist(obj) then DeleteEntity(obj) end
    end
    lib.hideTextUI()
end

local function beginPlacement()
    if placementActive then return end

    lib.requestModel(TABLE_MODEL, 5000)

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    placementHeading = GetEntityHeading(ped)

    placingObj = CreateObject(TABLE_MODEL, coords.x, coords.y, coords.z, false, true, false)
    SetEntityAlpha(placingObj, 180, false)
    SetEntityCollision(placingObj, false, false)
    SetModelAsNoLongerNeeded(TABLE_MODEL)

    placementActive = true

    lib.showTextUI(
        '[Scroll] Rotate  •  Aim where to place  •  [Enter/LMB] Place  •  [Backspace/RMB] Cancel',
        { position = 'bottom-center', icon = 'arrows-rotate' }
    )

    local function getPlacementPos()
        local camCoord = GetGameplayCamCoord()
        local camRot   = GetGameplayCamRot(2)
        local rx = math.rad(camRot.x)
        local rz = math.rad(camRot.z)
        local dir = vector3(
            -math.sin(rz) * math.cos(rx),
             math.cos(rz) * math.cos(rx),
             math.sin(rx)
        )
        local rayEnd = camCoord + dir * 12.0
        local handle = StartShapeTestRay(
            camCoord.x, camCoord.y, camCoord.z,
            rayEnd.x, rayEnd.y, rayEnd.z,
            1 | 16, placingObj, 4
        )
        local _, hit, endPos = GetShapeTestResult(handle)
        if hit == 1 then return endPos end
        local pedZ = GetEntityCoords(PlayerPedId()).z
        return vector3(rayEnd.x, rayEnd.y, pedZ)
    end

    CreateThread(function()
        while placementActive do
            DisableControlAction(0, 14, true)
            DisableControlAction(0, 15, true)
            DisableControlAction(0, 16, true)
            DisableControlAction(0, 17, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)

            local pos = getPlacementPos()
            SetEntityCoordsNoOffset(placingObj, pos.x, pos.y, pos.z, false, false, false)
            SetEntityHeading(placingObj, placementHeading)
            PlaceObjectOnGroundProperly(placingObj)

            if IsDisabledControlJustPressed(0, 17) then
                placementHeading = (placementHeading - 15.0) % 360
            elseif IsDisabledControlJustPressed(0, 16) then
                placementHeading = (placementHeading + 15.0) % 360
            end

            if IsControlJustPressed(0, 191) or IsDisabledControlJustPressed(0, 24) then
                local placeCoord   = GetEntityCoords(placingObj)
                local placeHeading = placementHeading
                endPlacement(true)
                TriggerServerEvent('bubuCraft:confirmPlacement', placeCoord, placeHeading)
                lib.notify({
                    type = 'success',
                    title = 'BuBu Crafting',
                    description = 'Table placed!',
                })
                break
            end

            if IsControlJustPressed(0, 177) or IsDisabledControlJustPressed(0, 25) then
                endPlacement(true)
                lib.notify({
                    type = 'error',
                    title = 'BuBu Crafting',
                    description = 'Placement cancelled — table was lost.',
                })
                break
            end

            Wait(0)
        end
    end)
end

-- ox_inventory item export. Existing items.lua config references
-- 'at_labubu.useTableItem'.
--
-- We return `false` so ox_inventory does NOT auto-consume the item.
-- The server removes 1 'table' from the player's inventory only on
-- successful placement (bubuCraft:confirmPlacement handler). If the
-- player cancels, they keep the item.
exports('useTableItem', function(data, slot)
    beginPlacement()
    return false
end)

-- ===========================================================================
-- Cleanup
-- ===========================================================================

AddEventHandler('onResourceStop', function(res)
    if res == RESOURCE then
        if uiOpen then SetNuiFocus(false, false) end
        if placingObj and DoesEntityExist(placingObj) then
            DeleteEntity(placingObj)
        end
        lib.hideTextUI()
    end
end)
