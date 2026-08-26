Config = {}

-- Single source of truth. The NUI renders itself from this, and the apply logic in
-- client.lua reads the same ids. Add a setting here and both sides pick it up.
--
-- Sliders are percentages of the game default where 100 means "untouched"; lodScale and
-- shadowDistance go above 100, which is the quality direction. viewDistance is meters,
-- where the max value means "off".
--
-- `bench` is the value a setting is isolated at during a benchmark sweep — always its
-- performance direction, so the sweep answers "what would turning this on gain me".
--
-- `visualCost` is how much a setting hurts the look of the game at its bench value:
-- 0 = invisible/cosmetic, 1 = subtle, 2 = noticeable, 3 = drastic. The benchmark's
-- custom-preset builder trades measured FPS gains against this.
--
-- Ambient ped/vehicle density is deliberately absent (this server disables OneSync
-- population) and so are trains (this server has none).
Config.Categories = {
    {
        id = "distance",
        label = "Distance",
        icon = "◱",
        items = {
            {
                id = "lodScale",
                label = "Render distance",
                hint = "How far the world is drawn in full detail. Below 100% is the biggest FPS win here; above 100% is the biggest quality win.",
                type = "slider",
                default = 100,
                bench = 55, visualCost = 2, min = 10, max = 200, step = 5, unit = "%",
            },
            {
                id = "viewDistance",
                label = "View distance dome",
                hint = "Cuts the far clip: nothing past this range is rendered at all, horizon included. Big GPU saving, looks like the world ends. 3000m = off. Players still appear at normal sync range.",
                type = "slider",
                default = 3000,
                bench = 500, visualCost = 3, min = 300, max = 3000, step = 100, unit = "m",
            },
        },
    },
    {
        id = "world",
        label = "World",
        icon = "◔",
        items = {
            {
                id = "populationBudget",
                label = "Population memory budget",
                hint = "Caps how much memory the streamer gives ped and vehicle models. 3 is the default.",
                type = "slider",
                default = 3,
                bench = 1, visualCost = 1, min = 0, max = 3, step = 1, unit = "",
            },
            {
                id = "reduceModelBudget",
                label = "Reduce model budgets",
                hint = "Forces the streamer to keep fewer ped and vehicle models resident.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 1,
            },
            {
                id = "noDistantCars",
                label = "Disable distant traffic",
                hint = "The fake cars on far-away freeways. Imposters, not real vehicles.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 1,
            },
            {
                id = "noClouds",
                label = "Hide clouds",
                hint = "Sets cloud opacity to zero. Small gain, clear sky.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 1,
            },
        },
    },
    {
        id = "effects",
        label = "Effects",
        icon = "✦",
        items = {
            {
                id = "disableDecals",
                label = "Disable decals",
                hint = "Bullet holes, blood splatter, tyre marks, scuffs.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 1,
            },
            {
                id = "clearParticles",
                label = "Clear particle effects",
                hint = "Continuously removes smoke, sparks and fire within 20m of you.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 2,
            },
            {
                id = "disablePostFx",
                label = "Stop screen effects",
                hint = "Continuously stops full-screen effects (damage flashes, drug trips). Other scripts may re-trigger theirs.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 2,
            },
            {
                id = "clearGlass",
                label = "Clear broken glass",
                hint = "Shattered glass persists as real geometry until cleared.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 0,
            },
            {
                id = "noVehicleDistantLights",
                label = "Disable distant vehicle lights",
                type = "toggle",
                default = false,
                bench = true, visualCost = 1,
            },
            {
                id = "flatOcean",
                label = "Flatten ocean waves",
                hint = "Only affects water within ~200m. Looks wrong on a boat.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 2,
            },
            {
                id = "disableScreenBlur",
                label = "Disable screen blur",
                type = "toggle",
                default = false,
                bench = true, visualCost = 0,
            },
            {
                id = "cleanPed",
                label = "Keep your ped clean",
                hint = "Strips blood, dirt and wetness from your character. Cosmetic, very cheap.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 0,
            },
        },
    },
    {
        id = "lighting",
        label = "Lighting",
        icon = "◐",
        items = {
            {
                id = "shadowDistance",
                label = "Shadow distance",
                hint = "Scales how far shadow cascades reach. Below 100% is cheaper, above is prettier. Experimental: the native is undocumented.",
                type = "slider",
                default = 100,
                bench = 60, visualCost = 2, min = 50, max = 150, step = 10, unit = "%",
            },
            {
                id = "suppressFarShadows",
                label = "Suppress far shadows",
                hint = "Shadows only draw as you get closer, instead of from a distance.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 1,
            },
            {
                id = "blackout",
                label = "Blackout",
                hint = "Kills street and building lights. Large gain, but nights go pitch black. Vehicle lights stay on.",
                type = "toggle",
                default = false,
                bench = true, visualCost = 3,
                warn = true,
            },
        },
    },
}

-- Ordered best-looking first: the benchmark recommends the highest entry in this list
-- that still holds a playable framerate on the player's machine.
Config.Presets = {
    {
        id = "ultra",
        label = "Ultra",
        hint = "Double draw distance, extended shadows. For strong PCs that want the game at its best.",
        quality = true,
        values = {
            lodScale = 200,
            shadowDistance = 150,
        },
    },
    {
        id = "quality",
        label = "Quality",
        hint = "Noticeably richer than vanilla without doubling the load.",
        quality = true,
        values = {
            lodScale = 140,
            shadowDistance = 120,
        },
    },
    {
        id = "default",
        label = "Default",
        hint = "Vanilla game, nothing overridden.",
        values = {},
    },
    {
        id = "balanced",
        label = "Balanced",
        hint = "Trims the cheap stuff. The world still looks right.",
        values = {
            lodScale = 80,
            noDistantCars = true,
            disableDecals = true,
            clearGlass = true,
            disableScreenBlur = true,
        },
    },
    {
        id = "performance",
        label = "Performance",
        hint = "Strips effects and shortens draw distance. Clearly different, still playable.",
        values = {
            lodScale = 55,
            viewDistance = 1200,
            populationBudget = 1,
            reduceModelBudget = true,
            noDistantCars = true,
            noClouds = true,
            disableDecals = true,
            clearParticles = true,
            disablePostFx = true,
            clearGlass = true,
            noVehicleDistantLights = true,
            flatOcean = true,
            disableScreenBlur = true,
            cleanPed = true,
            shadowDistance = 70,
            suppressFarShadows = true,
        },
    },
    {
        id = "potato",
        label = "Potato",
        hint = "Everything off, tiny view dome, no world lighting. Maximum FPS, ugly on purpose.",
        values = {
            lodScale = 20,
            viewDistance = 300,
            populationBudget = 0,
            reduceModelBudget = true,
            noDistantCars = true,
            noClouds = true,
            disableDecals = true,
            clearParticles = true,
            disablePostFx = true,
            clearGlass = true,
            noVehicleDistantLights = true,
            flatOcean = true,
            disableScreenBlur = true,
            cleanPed = true,
            shadowDistance = 50,
            suppressFarShadows = true,
            blackout = true,
        },
    },
}

function Config.Defaults()
    local defaults = {}

    for _, category in ipairs(Config.Categories) do
        for _, item in ipairs(category.items) do
            defaults[item.id] = item.default
        end
    end

    return defaults
end

function Config.PresetValues(id)
    for _, preset in ipairs(Config.Presets) do
        if preset.id == id then
            local values = Config.Defaults()

            for key, value in pairs(preset.values) do
                values[key] = value
            end

            return values
        end
    end
end

-- The benchmark sweep: vanilla, then each setting on its own at its `bench` value, then
-- each preset as a whole, then everything the player currently has staged. Isolating one
-- setting at a time attributes gains to the right knob; the preset phases measure the
-- combinations players will actually pick from.
function Config.BenchPhases(pending)
    local phases = {
        { id = "baseline", label = "Vanilla defaults", values = Config.Defaults() },
    }

    for _, category in ipairs(Config.Categories) do
        for _, item in ipairs(category.items) do
            local values = Config.Defaults()
            values[item.id] = item.bench

            phases[#phases + 1] = { id = item.id, label = item.label, values = values }
        end
    end

    for _, preset in ipairs(Config.Presets) do
        if preset.id ~= "default" then
            phases[#phases + 1] = {
                id = "preset:" .. preset.id,
                label = preset.label .. " preset",
                values = Config.PresetValues(preset.id),
            }
        end
    end

    phases[#phases + 1] = { id = "combined", label = "Your settings", values = pending }

    return phases
end
