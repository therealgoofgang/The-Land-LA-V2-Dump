-- ============================================================================
-- Exports so other resources (e.g. the ox_inventory category bar) can toggle
-- individual clothing categories. Each maps to the exact same Toggle* call the
-- in-game wheel uses (see Client/Config.lua).
--
--   exports['dpclothing']:toggle('shirt')
--   exports['dpclothing']:toggle('mask')   -- shirt | pants | shoes | gloves
--                                           -- mask | glasses | vest | bag | hat
--                                           -- top | hair | neck
--
-- Returns true if the category was recognised and toggled, false otherwise.
-- ============================================================================

local Categories = {
	shirt   = function() ToggleClothing('Shirt', true) end,
	pants   = function() ToggleClothing('Pants', true) end,
	shoes   = function() ToggleClothing('Shoes') end,
	gloves  = function() ToggleClothing('Gloves') end,
	mask    = function() ToggleClothing('Mask') end,
	vest    = function() ToggleClothing('Vest') end,
	bag     = function() ToggleClothing('Bag') end,
	top     = function() ToggleClothing('Top') end,
	hair    = function() ToggleClothing('Hair') end,
	neck    = function() ToggleClothing('Neck') end,
	glasses = function() ToggleProps('Glasses') end,
	hat     = function() ToggleProps('Hat') end,
}

exports('toggle', function(category)
	if type(category) ~= 'string' then return false end

	local fn = Categories[category:lower()]
	if not fn then return false end

	fn()
	return true
end)

-- Opens the full clothing wheel (same as the /clothing command / Y key).
exports('openWheel', function()
	ExecuteCommand('clothing')
end)
