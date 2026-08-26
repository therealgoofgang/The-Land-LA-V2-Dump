-- ============================================================
--  Spawns the activity NPCs and registers their ox_target
--  interactions. One NPC per activity, both breeds use it.
-- ============================================================

local spawnedPeds = {}
local spawnedBlips = {}

--- Load a model, blocking until ready.
local function loadModel(model)
    local hash = type(model) == 'string' and joaat(model) or model
    if not IsModelInCdimage(hash) then return nil end
    RequestModel(hash)
    local timeout = GetGameTimer() + 10000
    while not HasModelLoaded(hash) do
        Wait(10)
        if GetGameTimer() > timeout then return nil end
    end
    return hash
end

--- Create an NPC at the given coords, frozen and invincible.
local function spawnNpc(model, coords)
    local hash = loadModel(model)
    if not hash then return nil end
    local ped = CreatePed(4, hash, coords.x, coords.y, coords.z - 1.0, coords.w or 0.0, false, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetModelAsNoLongerNeeded(hash)
    return ped
end

--- Add a blip for a location.
--local function addBlip(coords, blipCfg)
--    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
--    SetBlipSprite(blip, blipCfg.sprite or 273)
--    SetBlipColour(blip, blipCfg.color or 0)
--    SetBlipScale(blip, blipCfg.scale or 0.8)
--    SetBlipAsShortRange(blip, true)
--    BeginTextCommandSetBlipName('STRING')
--    AddTextComponentString(blipCfg.label or 'Kennels')
--    EndTextCommandSetBlipName(blip)
--    return blip
--end

--- Register an ox_target option on a ped that triggers a client event.
local function addTargetOption(ped, optionName, label, icon, eventName)
    exports.ox_target:addLocalEntity(ped, {
        {
            name   = optionName,
            icon   = icon or 'fas fa-paw',
            label  = label,
            onSelect = function()
                TriggerEvent(eventName)
            end
        }
    })
end

--- Spawn all activity NPCs from config.
local function setupLocations()
    -- Shots
    local shotsCfg = Config.Locations.shots
    local shotsPed = spawnNpc(shotsCfg.model, shotsCfg.coords)
    if shotsPed then
        spawnedPeds[#spawnedPeds + 1] = shotsPed
        addTargetOption(shotsPed, 'kennels_shots', 'Vaccinate Dog', 'fas fa-syringe', 'kennels:client:openShots')
        --spawnedBlips[#spawnedBlips + 1] = addBlip(shotsCfg.coords, shotsCfg.blip)
    end

    -- Paperwork
    local pwCfg = Config.Locations.paperwork
    local pwPed = spawnNpc(pwCfg.model, pwCfg.coords)
    if pwPed then
        spawnedPeds[#spawnedPeds + 1] = pwPed
        addTargetOption(pwPed, 'kennels_paperwork', 'File Paperwork', 'fas fa-file-signature', 'kennels:client:openPaperwork')
        --spawnedBlips[#spawnedBlips + 1] = addBlip(pwCfg.coords, pwCfg.blip)
    end

    -- Breeding
    local brCfg = Config.Locations.breeding
    local brPed = spawnNpc(brCfg.model, brCfg.coords)
    if brPed then
        spawnedPeds[#spawnedPeds + 1] = brPed
        addTargetOption(brPed, 'kennels_breeding', 'Breed Dog', 'fas fa-heart', 'kennels:client:openBreeding')
        --spawnedBlips[#spawnedBlips + 1] = addBlip(brCfg.coords, brCfg.blip)
    end

    -- Selling
    local slCfg = Config.Locations.selling
    local slPed = spawnNpc(slCfg.model, slCfg.coords)
    if slPed then
        spawnedPeds[#spawnedPeds + 1] = slPed
        addTargetOption(slPed, 'kennels_selling', 'Sell Dog', 'fas fa-dollar-sign', 'kennels:client:openSelling')
        --spawnedBlips[#spawnedBlips + 1] = addBlip(slCfg.coords, slCfg.blip)
    end

    -- Transfer
    local tfCfg = Config.Locations.transfer
    local tfPed = spawnNpc(tfCfg.model, tfCfg.coords)
    if tfPed then
        spawnedPeds[#spawnedPeds + 1] = tfPed
        addTargetOption(tfPed, 'kennels_transfer', 'Transfer Dog', 'fas fa-exchange-alt', 'kennels:client:openTransfer')
        --spawnedBlips[#spawnedBlips + 1] = addBlip(tfCfg.coords, tfCfg.blip)
    end

    -- Vendor (sells starter puppies)
    local vdCfg = Config.Locations.vendor
    local vdPed = spawnNpc(vdCfg.model, vdCfg.coords)
    if vdPed then
        spawnedPeds[#spawnedPeds + 1] = vdPed
        addTargetOption(vdPed, 'kennels_vendor', 'Buy Puppy', 'fas fa-shopping-bag', 'kennels:client:openVendor')
        --spawnedBlips[#spawnedBlips + 1] = addBlip(vdCfg.coords, vdCfg.blip)
    end
end

--- Clean up everything we spawned (resource stop, player drop).
local function cleanup()
    for _, ped in ipairs(spawnedPeds) do
        if DoesEntityExist(ped) then DeleteEntity(ped) end
    end
    --for _, blip in ipairs(spawnedBlips) do
    --    if DoesBlipExist(blip) then RemoveBlip(blip) end
    --end
    spawnedPeds = {}
    --spawnedBlips = {}
end

CreateThread(function()
    setupLocations()
end)

AddEventHandler('onResourceStop', function(resName)
    if resName == GetCurrentResourceName() then cleanup() end
end)
