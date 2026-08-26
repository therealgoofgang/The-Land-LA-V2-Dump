Config = {}

---------------------------------------------------------------
-- WHEEL LOCATIONS
-- Add as many as you want; each one spawns its own prop + DUI
-- and has its own independent spin lock.
---------------------------------------------------------------
Config.Wheels = {
    { coords = vector3(812.9185, -263.5673, 64.8730), heading = 11.9249 },  -- Diamond Casino
    { coords = vector3(1464.7078, 3684.8965, 33.4672), heading = 104.6172 }, -- Sandy Shores
}

-- Back-compat aliases (first wheel)
Config.WheelLocation = Config.Wheels[1].coords
Config.WheelHeading  = Config.Wheels[1].heading

---------------------------------------------------------------
-- PROP SETTINGS
-- The actual casino wheel prop from GTA Casino DLC.
-- We try multiple known names in case one isn't available.
---------------------------------------------------------------
Config.WheelProps = {
    'vw_prop_vw_luckywheel_01a',   -- Casino DLC lucky wheel (blank face)
}

---------------------------------------------------------------
-- DISTANCES
---------------------------------------------------------------
Config.InteractionDistance = 3.0
Config.RenderDistance      = 7.0

---------------------------------------------------------------
-- DUI
---------------------------------------------------------------
Config.DuiWidth  = 512
Config.DuiHeight = 512
Config.WheelSize   = 1.75  -- Match the prop wheel face diameter
Config.WheelHeight = 1.05  -- Center of the prop wheel face
Config.WheelForwardOffset = 0.05 -- Small offset in front of prop face

---------------------------------------------------------------
-- DUI FACE PLACEMENT (per wheel)
-- Where the wheel face texture sits relative to its prop.
-- localX/Y/Z  = offset from the prop origin
-- dRotX/Y/Z   = rotation added on top of the prop's rotation
-- size        = diameter of the drawn face
--
-- Use /wheeleditor in game to adjust the nearest wheel live.
-- Saved values are written to data/offsets.json and override
-- everything below, so you don't have to edit this by hand.
---------------------------------------------------------------
Config.DefaultOffset = {
    localX = 0.0035, localY = -0.1470, localZ = 1.5100,
    dRotX  = 102.0,  dRotY  = -90.5,   dRotZ  = -102.3,
    size   = 2.8540,
}

-- Per-wheel overrides. Anything not listed falls back to Config.DefaultOffset.
-- These mirror the values currently saved in data/offsets.json, so alignment
-- survives even if that file is lost.
Config.Wheels[1].offset = {
    size = 2.3740,
}

Config.Wheels[2].offset = {
    localY = -0.1420,
    dRotX  = -164.4000,
    dRotY  = -89.5500,
    dRotZ  = -195.8000,
    size   = 2.3340,
}

Config.OffsetFields = {
    { key = 'localX', label = 'Offset X',   step = 0.0050 },
    { key = 'localY', label = 'Offset Y',   step = 0.0050 },
    { key = 'localZ', label = 'Offset Z',   step = 0.0050 },
    { key = 'dRotX',  label = 'Rotation X', step = 0.5000 },
    { key = 'dRotY',  label = 'Rotation Y', step = 0.5000 },
    { key = 'dRotZ',  label = 'Rotation Z', step = 0.5000 },
    { key = 'size',   label = 'Face size',  step = 0.0100 },
}

---------------------------------------------------------------
-- SPIN
---------------------------------------------------------------
Config.SpinDuration = 8000

---------------------------------------------------------------
-- VISUAL SEGMENTS (server decides outcome, this is display only)
---------------------------------------------------------------
Config.Segments = {
    { label = "$100,000",           color = "#2bff00", textColor = "#ffffff" },
    { label = "Donor Drug",         color = "#0a7cff", textColor = "#ffffff" },
    { label = "Black Diamonds",     color = "#8e44ad", textColor = "#ffffff" },
    { label = "Nothing",            color = "#7f8c8d", textColor = "#ffffff" },
    { label = "$50,000",            color = "#f1c40f", textColor = "#000000" },
    { label = "$25,000",            color = "#27ae60", textColor = "#ffffff" },
    { label = "$10,000",            color = "#2980b9", textColor = "#ffffff" },
    { label = "$5,000",             color = "#e74c3c", textColor = "#ffffff" },
    { label = "$2,500",             color = "#1abc9c", textColor = "#ffffff" },
    { label = "$1,000",             color = "#d35400", textColor = "#ffffff" },
    { label = "$500",               color = "#34495e", textColor = "#ffffff" },
    { label = "$75,000",            color = "#f39c12", textColor = "#ffffff" },
}