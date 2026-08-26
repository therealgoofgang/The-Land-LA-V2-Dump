local ped = cache.ped

local Bag = {
    entityId = nil,
    model = nil,
    itemName = nil
}

lib.onCache('ped', function(newPed)
    ped = newPed
end)

lib.onCache('vehicle', function(value)
    if value then
        if Bag.entityId then
            Bag:reset(true)
        end
    else
        Wait(100)
        if not cache.vehicle then
            local hasBag = Bag:hasBagItem()
            if hasBag and not Bag.entityId then
                Bag.itemName = hasBag
                Bag:wear()
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        if Bag.entityId and not DoesEntityExist(Bag.entityId) then
          
            Bag.entityId = nil
            Bag.model = nil

            local hasBag = Bag:hasBagItem()
            if hasBag and not cache.vehicle then
                Bag.itemName = hasBag
                Bag:wear()
            else
                Bag.itemName = nil
            end
        end
    end
end)

function Bag:reset(temp)
    if self.entityId then
        if DoesEntityExist(self.entityId) then
            DetachEntity(self.entityId, true, true)
            DeleteEntity(self.entityId)
            SetEntityAsNoLongerNeeded(self.entityId)
        end
        self.entityId = nil
        self.model = nil
        if not temp then
            self.itemName = nil
        end
    end
end

function Bag:hasBagItem()
    if not Bags or type(Bags) ~= 'table' then return nil end
    
    local bagsNames = {}
    for bagName, _ in pairs(Bags) do
        bagsNames[#bagsNames + 1] = bagName
    end

    if #bagsNames == 0 then return nil end

    local slots = exports.ox_inventory:Search('slots', bagsNames)
    if not slots then return nil end
    
    local lowestSlot = math.huge
    local itemName = nil

    for _, items in pairs(slots) do
        if type(items) == 'table' then
            for i = 1, #items do
                if items[i] and items[i].slot and items[i].slot < lowestSlot then
                    lowestSlot = items[i].slot
                    itemName = items[i].name
                end
            end
        end
    end

    return itemName
end


AddEventHandler('esx:onPlayerDeath', function()
    Bag:reset()
end)

function Bag:wear()
    
    if cache.vehicle then return end
    
    if not self.entityId and self.itemName then
        if not Bags or not Bags[self.itemName] then return end
        
        self.model = Bags[self.itemName].model
        if not self.model or not IsModelInCdimage(GetHashKey(self.model)) then return end

        lib.requestModel(self.model, 5000)
        self.entityId = CreateObject(self.model, 1.0, 1.0, 1.0, true, true, false)
        
        if not DoesEntityExist(self.entityId) then
            self.entityId = nil
            return
        end
        
        local position = Bags[self.itemName].positioning
        if not position then
            DeleteEntity(self.entityId)
            self.entityId = nil
            return
        end
        
        AttachEntityToEntity(self.entityId, ped, GetPedBoneIndex(ped, position.bone), position.location, position.rotation, true, false, false, false, 1, true)
    end
end

AddEventHandler('ox_inventory:updateInventory', function()
    
    if cache.vehicle then return end
    
    local hasBag = Bag:hasBagItem()

    
    if not hasBag and Bag.entityId then
        Bag:reset()
    
    elseif hasBag and hasBag ~= Bag.itemName then
        if Bag.entityId then
            Bag:reset()
        end
        Bag.itemName = hasBag
        Bag:wear()
    end
end)

RegisterCommand('resetbags', function()
    Bag:reset()
end)

-- RegisterNetEvent('esx:playerLoaded', function()
--     SetTimeout(30000, function()
--         local hasBag = Bag:hasBagItem()

--         if hasBag then
--             Bag.itemName = hasBag
--             Bag:wear()
--         end
--     end)
-- end)