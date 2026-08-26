local clientModule = client
local gameBridge = require("game.bridge")
local logger = require("modules.utility.shared.logger")

local interface = Interface

-- Callback for rotating character
interface.on(interface, "callback::function::character::rotate", function(data, callback)
    local playerPed = PlayerPedId()
    local deltaX = data.deltaX
    local currentHeading = GetEntityHeading(playerPed)
    local newHeading = currentHeading + (deltaX * 0.2)
    SetEntityHeading(playerPed, newHeading)
    callback(200)
end)

-- Callback for getting locales
interface.on(interface, "callback::function::locales::get", function(data, callback)
    local locale = GetConvar("illenium-appearance:locale", "en")
    local uiLocale = Locales[locale].UI
    callback(uiLocale)
end)

-- Callback for setting camera
interface.on(interface, "callback::function::camera::set", function(data, callback)
    callback(1)
    clientModule.setCamera(data)
end)

-- Callback for changing player model
interface.on(interface, "callback::function::model::change", function(data, callback)
    local newModel = clientModule.setPlayerModel(data)
    SetEntityHeading(cache.ped, clientModule.getHeading())
    SetEntityInvincible(newModel, true)
    TaskStandStill(newModel, -1)
    callback({
        new_character_appearance = clientModule.getPedAppearance(newModel),
        new_game_appearance_data = gameBridge.getAppearanceSettings(gameBridge)
    })
end)

-- Callback for changing ped component
interface.on(interface, "callback::function::component::change", function(data, callback)
    clientModule.setPedComponent(cache.ped, data)
    gameBridge.onComponentChange(gameBridge, data)
    callback(gameBridge.getComponentSettings(gameBridge, cache.ped, data.component_id))
end)

-- Callback for changing ped prop
interface.on(interface, "callback::function::prop::change", function(data, callback)
    clientModule.setPedProp(cache.ped, data)
    gameBridge.onPropChange(gameBridge, data)
    callback(gameBridge.getPropSettings(gameBridge, cache.ped, data.prop_id))
end)

-- Callback for changing head blend
interface.on(interface, "callback::function::head_blend::change", function(data, callback)
    callback(1)
    clientModule.setPedHeadBlend(cache.ped, data)
end)

-- Callback for changing face features
interface.on(interface, "callback::function::face_feature::change", function(data, callback)
    callback(1)
    clientModule.setPedFaceFeatures(cache.ped, data)
end)

-- Callback for changing head overlay
interface.on(interface, "callback::function::head_overlay::change", function(data, callback)
    callback(200)
    clientModule.setPedHeadOverlays(cache.ped, data)
end)

-- Callback for changing hair
interface.on(interface, "callback::function::hair::change", function(data, callback)
    clientModule.setPedHair(cache.ped, data)
    callback(gameBridge.getHairSettings(gameBridge, cache.ped))
end)

-- Callback for changing eye color
interface.on(interface, "callback::function::eye_color::change", function(data, callback)
    callback(1)
    clientModule.setPedEyeColor(cache.ped, data)
end)

-- Callback for applying tattoo
interface.on(interface, "callback::function::tattoo::apply", function(data, callback)
    local tattoo = data.tattoo
    local chargePerTattoo = Config.ChargePerTattoo
    local paymentSuccess = lib.callback.await("illenium-appearance:server:payForTattoo", false, tattoo) or false

    if not paymentSuccess then
        lib.print.verbose("(tattoo::apply) `payForTattoo` failed.")
        return callback(false)
    end

    clientModule.addPedTattoo(cache.ped, data.updatedTattoos or data)
    callback(paymentSuccess)
end)

-- Callback for previewing tattoo
interface.on(interface, "callback::function::tattoo::preview", function(data, callback)
    clientModule.setPreviewTattoo(cache.ped, data.data, data.tattoo)
    callback(200)
end)

-- Callback for setting tattoo opacity
interface.on(interface, "callback::function::tattoo::opacity::set", function(data, callback)
    callback(1)
    clientModule.addPedTattoo(cache.ped, data.updatedTattoos or data)
end)

-- Callback for deleting tattoo
interface.on(interface, "callback::function::tattoo::delete", function(data, callback)
    callback(1)
    clientModule.removePedTattoo(cache.ped, data)
end)

-- Callback for wearing clothes
interface.on(interface, "callback::function::wear_clothes", function(data, callback)
    callback(1)
    clientModule.wearClothes(data.data, data.key)
end)

-- Callback for removing clothes
interface.on(interface, "callback::function::remove_clothes", function(data, callback)
    callback(1)
    clientModule.removeClothes(data)
end)

-- Callback for saving customization
interface.on(interface, "callback::function::save", function(data, callback)
    callback(1)
    clientModule.wearClothes(data, "head")
    clientModule.wearClothes(data, "body")
    clientModule.wearClothes(data, "bottom")
    clientModule.exitPlayerCustomization(data)
end)

-- Callback for exiting customization
interface.on(interface, "callback::function::exit", function(data, callback)
    callback(1)
    clientModule.exitPlayerCustomization()
end)