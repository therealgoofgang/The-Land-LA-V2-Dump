if not Framework.Ox() then
    return
end

local Ox = require("@ox_core.lib.init")
local player = Ox.GetPlayer()

-- Initialize character on setActiveCharacter event
RegisterNetEvent("ox:setActiveCharacter", function(character)
    if character.isNew then
        -- Initialize new character with default gender
        return InitializeCharacter(Framework.GetGender(true))
    end

    -- Initialize appearance
    InitAppearance()
end)

-- TODO: implement group handling
-- RegisterNetEvent("ox:setGroup", function(group, grade)
-- end)

-- Get player gender
function Framework.GetPlayerGender()
    return player.get("gender") == "female" and "Female" or "Male"
end

-- Update player data (not implemented)
function Framework.UpdatePlayerData() end

-- Check if player has tracker (always returns false)
function Framework.HasTracker()
    return false
end

-- Check player meta (dead or cuffed)
function Framework.CheckPlayerMeta()
    return LocalPlayer.state.isDead or IsPedCuffed(cache.ped)
end

-- Check if player is allowed to access character
function Framework.IsPlayerAllowed(charId)
    return charId == player.charId
end

-- Get rank input values (not implemented)
function Framework.GetRankInputValues() end

-- Get job grade (not implemented)
function Framework.GetJobGrade() end

-- Get gang grade (not implemented)
function Framework.GetGangGrade() end

-- Cache ped (not implemented)
function Framework.CachePed() end

-- Restore player armor (not implemented)
function Framework.RestorePlayerArmour() end