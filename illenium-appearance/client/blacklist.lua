--[[
    Applies the global blacklist registry (see server/blacklist.lua) to the local
    Config.Blacklist, and exposes a local AddBlacklist export for client scripts.

    Config.Blacklist is read by the menu (game/bridge.lua getAppearanceSettings)
    each time the clothing menu is opened, so entries applied here take effect the
    next time the player opens the menu.

    Local usage (this client only):
        exports['illenium-appearance']:AddBlacklist('upperBody', { 4, 12, 30 })

    For a server-wide blacklist that applies to everyone, use the server export
    of the same name (see server/blacklist.lua).
]]

local COMPONENT_CATEGORIES = {
    masks = true, upperBody = true, lowerBody = true, bags = true, shoes = true,
    scarfAndChains = true, shirts = true, bodyArmor = true, decals = true, jackets = true,
}

local PROP_CATEGORIES = {
    hats = true, glasses = true, ear = true, watches = true, bracelets = true,
}

---Resolves the blacklist bucket (array of items) for a gender + category.
---@param gender string "male" | "female"
---@param category string
---@return table|nil bucket
local function bucketFor(gender, category)
    local genderTbl = Config.Blacklist[gender]
    if not genderTbl then
        return nil
    end

    if category == "hair" then
        return genderTbl.hair
    elseif COMPONENT_CATEGORIES[category] then
        return genderTbl.components[category]
    elseif PROP_CATEGORIES[category] then
        return genderTbl.props[category]
    end

    return nil
end

---Adds a normalized entry to the local Config.Blacklist. Entries carry no
---job/gang/ace/citizenid allowance, so they are blacklisted for everyone.
---@param entry table { gender = "male"|"female"|nil, category = string, drawables = number[], textures = number[]|nil }
---@return boolean applied
local function applyEntry(entry)
    if type(entry) ~= "table" or not entry.category or type(entry.drawables) ~= "table" then
        return false
    end

    local genders = entry.gender and { entry.gender } or { "male", "female" }
    local applied = false

    for i = 1, #genders do
        local bucket = bucketFor(genders[i], entry.category)
        if bucket then
            bucket[#bucket + 1] = {
                drawables = entry.drawables,
                textures = entry.textures,
            }
            applied = true
        end
    end

    return applied
end

---Local AddBlacklist export. Validates input then applies on this client only.
---@param category string
---@param drawables number|number[]
---@param opts table|nil { gender = "male"|"female"|nil, textures = number[]|nil }
---@return boolean success
local function addBlacklist(category, drawables, opts)
    opts = opts or {}

    if type(drawables) == "number" then
        drawables = { drawables }
    end

    if type(drawables) ~= "table" or #drawables == 0 then
        print(("[illenium-appearance] AddBlacklist: invalid drawables for category '%s'"):format(tostring(category)))
        return false
    end

    return applyEntry({
        gender = opts.gender,
        category = category,
        drawables = drawables,
        textures = opts.textures,
    })
end

exports("AddBlacklist", addBlacklist)

-- Apply entries broadcast from the server as they are registered.
RegisterNetEvent("illenium-appearance:client:applyBlacklist", function(entry)
    applyEntry(entry)
end)

-- Pull the existing registry on (re)start so this client gets every prior entry.
CreateThread(function()
    local registry = lib.callback.await("illenium-appearance:server:getBlacklist", false)
    if type(registry) == "table" then
        for i = 1, #registry do
            applyEntry(registry[i])
        end
    end
end)
