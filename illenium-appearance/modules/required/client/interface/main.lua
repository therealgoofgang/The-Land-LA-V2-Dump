local logger = require("modules.utility.shared.logger")
logger.info("(modules/interface) _G.interface not found, creating first global instance")

Interface = {}
local store = {
    status = {
        app = {
            loaded = false,
            dataLoaded = false
        }
    },
    visibility = {
        app = false,
        loadingScreen = false,
        exportPanel = false
    },
    callbacks = {}
}

Interface.store = store
Interface.__index = Interface

function Interface.new()
    local self = setmetatable({}, Interface)
    self:registerInitialCallbacks()
    exports("getInterfaceVisibilityState", function()
        return self.store.visibility
    end)
    return self
end

function Interface:message(action, data)
    assert(action, "(interface:message) `action` parameter is nil.")
    SendNUIMessage({ action = action, data = data })
end

function Interface:toggle(newState, affectInputFocus)
    local currentState = not self.store.visibility.app
    if type(newState) == "boolean" then
        currentState = newState
    end

    logger.info("(interface:toggle) newState: ", currentState)

    if currentState and self.store.visibility.loadingScreen then
        logger.verbosef("[client] [interface/toggle] newState is true and loading screen is visible, toggling loading screen off")
        self:setLoadingState(false)
    end

    self:message("state::visibility::app::set", currentState)

    if type(affectInputFocus) == "boolean" and not affectInputFocus then
        return logger.info("(interface:toggle) not affecting affectInputFocus")
    end

    SetNuiFocus(currentState, currentState)
end

function Interface:registerInitialCallbacks()
    self:on("state::visibility::app::sync", function(newState, cb)
        self.store.visibility.app = newState
        SetNuiFocus(newState, newState)
        cb(200)
    end)

    self:on("state::visibility::loading_screen::sync", function(newState, cb)
        self.store.visibility.loadingScreen = newState
        cb(200)
    end)

    self:on("state::visibility::export_panel::sync", function(newState, cb)
        self.store.visibility.exportPanel = newState
        cb(200)
    end)

    self:on("APP_LOADED", function(_, cb)
        self.store.status.app.loaded = true
        cb(200)
    end)
end

function Interface:on(event, callback)
    assert(event, "[Interface] [On] `event` parameter is nil.")
    assert(callback, "[Interface] [On] `callback` parameter is nil.")

    if not self.store.callbacks[event] then
        self.store.callbacks[event] = {}
        RegisterNuiCallback(event, function(data, cb)
            for _, cbFunc in ipairs(self.store.callbacks[event]) do
                if cbFunc then
                    local success, err = pcall(cbFunc, data, cb)
                    if not success then
                        logger.warningf("[Interface] [On] Error (%s) encountered at: (%s)", err, event)
                    end
                else
                    logger.debugf("[Interface] [On] Skipping iteration of callback handle for event: %s", event)
                end
            end
        end)
    end

    table.insert(self.store.callbacks[event], callback)
    return #self.store.callbacks[event]
end

function Interface:removeCallback(event, callbackIndex)
    assert(event, "[Interface] [RemoveCallback] `event` parameter is nil.")
    assert(callbackIndex, "[Interface] [RemoveCallback] `callback` parameter is nil.")
    assert(self.store.callbacks[event], "[Interface] [RemoveCallback] Event not found: " .. event)
    assert(self.store.callbacks[event][callbackIndex], "[Interface] [RemoveCallback] Callback not found for event: " .. event .. " at index: " .. callbackIndex)

    logger.infof("[Interface] [RemoveCallback] Deleted callback for event: (%s), index: (%s)", event, callbackIndex)
    self.store.callbacks[event][callbackIndex] = false
end

function Interface:setLoadingState(newState)
    if type(newState) ~= "boolean" then
        newState = not self.store.visibility.loadingScreen
    end
    self:message("state::visibility::loading_screen::set", newState)
end

function Interface:syncCharacterAppearanceStateAndSettingsState(config)
    assert(config, "[Interface] [syncCharacterAppearanceStateAndSettingsState] param `config` is nil.")
    self:setLoadingState(true)

    local bridge = require("game.bridge")
    if not self.store.status.app.dataLoaded then
        local locale = Locales[GetConvar("illenium-appearance:locale", "en")] or Locales.en
        local theme = require("shared.theme")

        self:message("state::locales::set", locale.UI)
        self:message("state::visibility::frame::set", "5j15hmhm4-kk7dd--k1-86b5-36nb1d131efe76f829")
        self:message("state::theme::set", theme)

        self.store.status.app.dataLoaded = true
        logger.verbosef("[modules/interface/syncCharacterAppearanceStateAndSettingsState] Successfully loaded all the required data.")
    end

    local appearance = client.getAppearance()
    local appearanceSettings = bridge:getAppearanceSettings()

    self:message("state::script::config::set", config)
    self:message("state::game::store::appearance::data::set", appearanceSettings)
    self:message("state::character::appearance::set", appearance)

    if appearance.tattoos then
        client.setPedTattoos(cache.ped, appearance.tattoos)
    end
end

Interface = Interface.new()