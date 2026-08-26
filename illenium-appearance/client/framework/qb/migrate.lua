if not Framework.QBCore() then
    return
end

local client = client

local skinData = {
    ["face2"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,
    },
    ["facemix"] = {
        skinMix = 0,
        shapeMix = 0,
        defaultSkinMix = 0.0,
        defaultShapeMix = 0.0,
    },
}

RegisterNetEvent("illenium-appearance:client:migration:load-qb-clothing-skin", function(playerSkin)
    local model = playerSkin.model
    model = model ~= nil and tonumber(model) or false
    Citizen.CreateThread(function()
        lib.requestModel(model, 1000)
        SetPlayerModel(cache.playerId, model)
        Wait(150)
        SetPedComponentVariation(cache.ped, 0, 0, 0, 2)
        TriggerEvent("illenium-appearance:client:migration:load-qb-clothing-clothes", playerSkin, cache.ped)
        SetModelAsNoLongerNeeded(model)
    end)
end)

RegisterNetEvent("illenium-appearance:client:migration:load-qb-clothing-clothes", function(playerSkin, ped)
    local data = json.decode(playerSkin.skin)
    if ped == nil then
        ped = cache.ped
    end

    -- Reset components and props
    for i = 0, 11 do
        SetPedComponentVariation(ped, i, 0, 0, 0)
    end
    for i = 0, 7 do
        ClearPedProp(ped, i)
    end

    -- Set face data
    if not data["facemix"] or not data["face2"] then
        data["facemix"] = skinData["facemix"]
        data["facemix"].shapeMix = data["facemix"].defaultShapeMix
        data["facemix"].skinMix = data["facemix"].defaultSkinMix
        data["face2"] = skinData["face2"]
    end
    SetPedHeadBlendData(ped, data["face"].item, data["face2"].item, nil, data["face"].texture, data["face2"].texture, nil,
        data["facemix"].shapeMix, data["facemix"].skinMix, nil, true)

    -- Set clothing components
    local components = {
        { name = "pants", componentId = 4 },
        { name = "hair", componentId = 2 },
        { name = "arms", componentId = 3 },
        { name = "t-shirt", componentId = 8 },
        { name = "vest", componentId = 9 },
        { name = "torso2", componentId = 11 },
        { name = "shoes", componentId = 6 },
        { name = "mask", componentId = 1 },
        { name = "decals", componentId = 10 },
        { name = "accessory", componentId = 7 },
        { name = "bag", componentId = 5 },
    }
    for _, component in ipairs(components) do
        SetPedComponentVariation(ped, component.componentId, data[component.name].item, 0, 0)
        SetPedComponentVariation(ped, component.componentId, data[component.name].item, data[component.name].texture, 0)
    end

    -- Set head overlays
    local overlays = {
        { name = "eyebrows", overlayId = 2 },
        { name = "beard", overlayId = 1 },
        { name = "blush", overlayId = 5 },
        { name = "lipstick", overlayId = 8 },
        { name = "makeup", overlayId = 4 },
        { name = "ageing", overlayId = 3 },
    }
    for _, overlay in ipairs(overlays) do
        SetPedHeadOverlay(ped, overlay.overlayId, data[overlay.name].item, 1.0)
        SetPedHeadOverlayColor(ped, overlay.overlayId, 1, data[overlay.name].texture, 0)
    end

    -- Set props
    local props = {
        { name = "hat", propId = 0 },
        { name = "glass", propId = 1 },
        { name = "ear", propId = 2 },
        { name = "watch", propId = 6 },
        { name = "bracelet", propId = 7 },
    }
    for _, prop in ipairs(props) do
        if data[prop.name].item ~= -1 and data[prop.name].item ~= 0 then
            SetPedPropIndex(ped, prop.propId, data[prop.name].item, data[prop.name].texture, true)
        else
            ClearPedProp(ped, prop.propId)
        end
    end

    -- Set eye color and moles
    if data["eye_color"].item ~= -1 and data["eye_color"].item ~= 0 then
        SetPedEyeColor(ped, data["eye_color"].item)
    end
    if data["moles"].item ~= -1 and data["moles"].item ~= 0 then
        SetPedHeadOverlay(ped, 9, data["moles"].item, (data["moles"].texture / 10))
    end

    -- Set face features
    local faceFeatures = {
        { name = "nose_0", featureId = 0 },
        { name = "nose_1", featureId = 1 },
        { name = "nose_2", featureId = 2 },
        { name = "nose_3", featureId = 3 },
        { name = "nose_4", featureId = 4 },
        { name = "nose_5", featureId = 5 },
        { name = "eyebrown_high", featureId = 6 },
        { name = "eyebrown_forward", featureId = 7 },
        { name = "cheek_1", featureId = 8 },
        { name = "cheek_2", featureId = 9 },
        { name = "cheek_3", featureId = 10 },
        { name = "eye_opening", featureId = 11 },
        { name = "lips_thickness", featureId = 12 },
        { name = "jaw_bone_width", featureId = 13 },
        { name = "jaw_bone_back_lenght", featureId = 14 },
        { name = "chimp_bone_lowering", featureId = 15 },
        { name = "chimp_bone_lenght", featureId = 16 },
        { name = "chimp_bone_width", featureId = 17 },
        { name = "chimp_hole", featureId = 18 },
        { name = "neck_thikness", featureId = 19 },
    }
    for _, feature in ipairs(faceFeatures) do
        SetPedFaceFeature(ped, feature.featureId, (data[feature.name].item / 10))
    end

    local appearance = client.getPedAppearance(ped)
    TriggerServerEvent("illenium-appearance:server:migrate-qb-clothing-skin", playerSkin.citizenid, appearance)
end)