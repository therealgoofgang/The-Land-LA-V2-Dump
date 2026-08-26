if not Framework.QBCore() then
    return
end

local client = client

-- Backwards Compatible Events
local function openClothingMenu()
    local config = GetDefaultConfig()
    config.ped = true
    config.headBlend = true
    config.faceFeatures = true
    config.headOverlays = true
    config.components = true
    config.props = true
    config.tattoos = true
    OpenShop(config, true, "all")
end

RegisterNetEvent("qb-clothing:client:openMenu", openClothingMenu)
RegisterNetEvent("qb-clothing:client:openOutfitMenu", function()
    OpenMenu(nil, "outfit")
end)
RegisterNetEvent("qb-clothing:client:loadOutfit", LoadJobOutfit)

RegisterNetEvent("qb-multicharacter:client:chooseChar", function()
    -- reset ped appearance
    client.setPedTattoos(cache.ped, {})
    ClearPedDecorations(cache.ped)
    TriggerServerEvent("illenium-appearance:server:resetOutfitCache")
end)