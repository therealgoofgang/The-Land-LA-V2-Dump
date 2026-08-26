local vendingModels = {
    `prop_vend_soda_02`,
    `prop_vend_fridge01`,
    `prop_vend_water_01`,
    `prop_vend_soda_01`
}

local lastUse = 0
local USE_COOLDOWN = 1000

local _PlayerPedId      = PlayerPedId
local _IsPedInAnyVehicle= IsPedInAnyVehicle
local _GetGameTimer     = GetGameTimer
local _DoesEntityExist  = DoesEntityExist
local _GetEntityModel   = GetEntityModel
local _TaskTurnPedToFaceEntity = TaskTurnPedToFaceEntity
local _Wait             = Wait

local modelToShop = {
    [`prop_vend_water_01`] = 'VendingMachineDrinks',
    [`prop_vend_fridge01`] = 'VendingMachineDrinks',
    [`prop_vend_soda_01`]  = 'VendingMachineDrinks',
    [`prop_vend_soda_02`]  = 'VendingMachineDrinks',
}

local function getShopKey(entity)
    if not entity or not _DoesEntityExist(entity) then return 'VendingMachineDrinks' end
    return modelToShop[_GetEntityModel(entity)] or 'VendingMachineDrinks'
end

local function extractEntity(arg)
    if type(arg) == 'number' then return arg end
    if type(arg) == 'table' then
        if type(arg.entity) == 'number' then return arg.entity end
        if type(arg.entityHit) == 'number' then return arg.entityHit end
    end
    return nil
end

local vendingMachineData = {
    name = 'vending_machine',
    icon = 'fa-solid fa-bottle-water',
    label = 'Use Vending Machine',
    distance = 2.0,
    canInteract = function(entity, distance)
        if distance and distance > 2.0 then return false end
        if _IsPedInAnyVehicle(_PlayerPedId(), false) then return false end
        return true
    end,
    onSelect = function(data)
        local now = _GetGameTimer()
        if now - lastUse < USE_COOLDOWN then return end
        lastUse = now

        local entity = extractEntity(data)
        if LocalPlayer and LocalPlayer.state and LocalPlayer.state.invBusy then return end

        local ped = _PlayerPedId()
        if entity and _DoesEntityExist(entity) then
            _TaskTurnPedToFaceEntity(ped, entity, 500)
            _Wait(300)
        end

        local shopKey = getShopKey(entity)
        exports.ox_inventory:openInventory('shop', { type = shopKey })
    end
}

exports.ox_target:addModel(vendingModels, {vendingMachineData})