-- ============================================================
--  Shared helpers for breed detection.
--  Loaded on both client and server because shared_scripts.
-- ============================================================

-- Initialise ESX once, globally. Loaded before any client/server
-- script in this resource (shared_scripts run first), so every other
-- file in this resource can just use `ESX` directly.
ESX = exports.es_extended:getSharedObject()

Kennels = Kennels or {}

--- Return the breed key ('pitbull', 'frenchie') for a given dog model,
--- or nil if the model isn't a recognised dog.
function Kennels.GetBreedFromModel(model)
    if not model then return nil end
    model = string.lower(model)
    for breedKey, breedData in pairs(Config.Breeds) do
        if breedData.models[model] then
            return breedKey
        end
    end
    return nil
end

--- Check whether a model is a valid dog of any breed.
function Kennels.IsDogModel(model)
    return Kennels.GetBreedFromModel(model) ~= nil
end

--- Pick the puppy item awarded for breeding, given the dog's breed and model.
function Kennels.GetBreedingReward(breedKey, model)
    local breed = Config.Breeds[breedKey]
    if not breed then return nil end

    local rewards = breed.breedingRewards
    -- Pitbulls use a model -> item map
    if type(rewards) == 'table' and rewards[model] then
        return rewards[model]
    end
    -- Frenchies use a flat list of items, pick a random one
    if type(rewards) == 'table' and #rewards > 0 then
        return rewards[math.random(#rewards)]
    end
    return nil
end

--- Normalize a TINYINT(1) field that oxmysql may return as either a
--- number (0/1) or a boolean (false/true). Returns true when "set".
function Kennels.IsTrue(v)
    return v == 1 or v == true
end
