Config = {}

-- Set true to print job lifecycle steps to the server console (and F8 client
-- console) — useful for confirming the unlock/delivery handshake.
Config.Debug = false

-- ─────────────────────────────────────────────────────────────────────────────
--  GENERAL
-- ─────────────────────────────────────────────────────────────────────────────

-- Where the reward item is added. Pick the inventory your server runs.
--   'ox'  -> exports.ox_inventory:AddItem(src, item, count)
--   'esx' -> xPlayer.addInventoryItem(item, count)
--   'qb'  -> exports['qb-inventory']:AddItem(src, item, count, ...)  (qb-core / qbx)
Config.Inventory = 'ox'

-- Cooldown between jobs, in minutes (enforced server-side, keyed by license).
Config.Cooldown = 2

-- If a player abandons a job (logs out / drops), the spawned vehicle and
-- drop-off ped are cleaned up automatically. You can also force-clean any
-- vehicle that is never delivered after this many minutes (0 = disabled).
Config.AbandonTimeout = 10

-- ─────────────────────────────────────────────────────────────────────────────
--  REWARD
-- ─────────────────────────────────────────────────────────────────────────────

Config.Reward = {
    -- How rewards are granted from the list below:
    --   'all'    -> give every entry in `items`
    --   'random' -> give one random entry from `items`
    mode = 'all',

    -- Each entry needs an `item`, plus either:
    --   amount = N            (fixed amount), or
    --   min = A, max = B      (random amount between A and B, inclusive)
    items = {
        { item = 'water', min = 1, max = 3 },
        -- { item = 'lockpick',   amount = 1 },
        -- { item = 'money',      min = 500, max = 1500 },
    },
}

-- ─────────────────────────────────────────────────────────────────────────────
--  JOB GIVER NPC  (the "shady dealer" you third-eye to start)
-- ─────────────────────────────────────────────────────────────────────────────

Config.JobPed = {
    model    = 's_m_y_dealer_01',
    coords   = vec4(-633.6, -1776.8, 24.0, 129.2), -- x, y, z, heading
    scenario = 'WORLD_HUMAN_AA_SMOKE',           -- set to nil for none
    blip = {
        enabled = true,
        sprite  = 280,
        colour  = 1,
        scale   = 0.8,
        label   = 'Shady Dealer',
    },
}

-- ─────────────────────────────────────────────────────────────────────────────
--  STOLEN VEHICLE
-- ─────────────────────────────────────────────────────────────────────────────

-- One model is picked at random per job.
Config.VehicleModels = {
    'sultan',
    'kuruma',
    'sentinel',
    'buffalo',
    'jackal',
    'schafter2',
}

-- Where the locked vehicle can spawn. One is picked at random per job.
Config.SpawnLocations = {
    vec4(-595.3024, -1126.6559, 21.7971, 271.0779),
    vec4(392.8042, -641.6422, 28.1193, 269.3746),
    vec4(-723.6995, -916.2974, 18.6333, 89.0469),
    vec4(-448.5719, -458.0433, 32.5639, 349.2416),
    vec4(-329.2240, 277.7857, 85.9390, 95.7060),
    vec4(-487.7432, -615.2190, 30.7936, 180.0574),
    vec4(316.6294, -206.5838, 53.7053, 248.7293),
    vec4(242.8714, -777.3882, 30.2737, 67.9374),
    vec4(285.1087, -1241.5062, 28.8430, 181.8642),
    vec4(967.3300, -1025.6534, 40.4730, 270.4009),
    vec4(899.3120, -70.8444, 78.3840, 57.3686),
    vec4(644.1652, 281.7041, 102.8048, 150.8886),
}

-- ─────────────────────────────────────────────────────────────────────────────
--  DROP-OFF
-- ─────────────────────────────────────────────────────────────────────────────

-- One drop-off is picked at random per job. A receiver ped is spawned here
-- once the vehicle is unlocked.
Config.DropOffLocations = {
    vec4(-420.3979, -1676.6428, 19.1291, 164.2104),
    vec4(-282.9086, -2657.7493, 6.2596, 49.2653),
    vec4(1242.2770, -3113.7341, 6.1284, 275.1954),
}

Config.DropOff = {
    pedModel = 's_m_m_highsec_01', -- receiver NPC model
    radius   = 8.0,                -- vehicle must be parked within this many metres
    blip = {
        sprite = 524,
        colour = 5,
        scale  = 0.9,
        label  = 'Vehicle Drop-Off',
    },
}

-- ─────────────────────────────────────────────────────────────────────────────
--  GPS ROUTE BLIPS  (drawn to the spawn point, then to the drop-off)
-- ─────────────────────────────────────────────────────────────────────────────

Config.Route = {
    sprite      = 225,
    findColour  = 5,  -- colour while searching for the vehicle (yellow)
    dropColour  = 2,  -- colour while delivering (green)
    radiusAlpha = 96, -- transparency of the search radius circle (0-255)
    searchRadius = 60.0, -- size of the search-area circle drawn at the spawn point
}

-- ─────────────────────────────────────────────────────────────────────────────
--  AUTEL TABLET MINIGAME
-- ─────────────────────────────────────────────────────────────────────────────
--
-- The player must tap the requested apps, in order, before each timer expires.
-- `steps`        = how many apps they must tap to succeed.
-- `timePerStep`  = milliseconds allowed per tap.
-- `failOnWrong`  = true -> tapping the wrong app fails instantly.
--                  false -> wrong taps are ignored, only the timer can fail you.
--
-- `apps` is the pool shown on the tablet. The `id`s must match the icon set in
-- web/script.js (diagnostics, service, data_manager, settings, battery_test,
-- vci_manager, remote_desktop, update).

Config.Minigame = {
    -- If set to an app id, the player only has to press that one app to unlock
    -- (a single tap). Set to false/nil to use the random multi-step sequence
    -- driven by `steps` below.
    targetApp   = 'diagnostics',

    steps       = 3,    -- only used when targetApp is false/nil
    timePerStep = 10000, -- ms per tap — FALLBACK only; the active value comes
                         -- from Config.Difficulty (see bottom of this file)
    failOnWrong = true, -- tapping the wrong app fails instantly
    apps = {
        { id = 'diagnostics',    label = 'Diagnostics'    },
        { id = 'service',        label = 'Service'        },
        { id = 'data_manager',   label = 'Data Manager'   },
        { id = 'settings',       label = 'Settings'       },
        { id = 'battery_test',   label = 'Battery Test'   },
        { id = 'vci_manager',    label = 'VCI Manager'    },
        { id = 'remote_desktop', label = 'Remote Desktop' },
        { id = 'update',         label = 'Update'         },
    },
}

-- ─────────────────────────────────────────────────────────────────────────────
--  WIRE MINIGAME  (second stage, runs after the tablet)
-- ─────────────────────────────────────────────────────────────────────────────
--
-- After the correct app is selected, the tablet boots into a wiring screen and
-- the player must connect each wire to its matching colour (Among Us style).
-- Completing THIS stage is what unlocks the vehicle.

Config.WireGame = {
    enabled = true, -- false = skip this stage and unlock right after the tablet
    wires   = 4,    -- number of wires to match (2-5; colours/symbols are predefined)
    time    = 20000, -- ms for the whole wire stage — FALLBACK only; the active
                     -- value comes from Config.Difficulty below (0 = no limit)
}

-- ─────────────────────────────────────────────────────────────────────────────
--  XP / PROGRESSION
-- ─────────────────────────────────────────────────────────────────────────────
--
-- Players earn XP for every completed delivery. A level on the dealer menu stays
-- LOCKED until the player's XP reaches that level's `xpRequired` (see below).
-- XP is stored server-side, keyed by license, and persists across restarts.

Config.XP = {
    enabled    = true, -- false -> ignore XP gating; every level is always available
    perMission = 5,    -- XP granted on each successful delivery
}

-- ─────────────────────────────────────────────────────────────────────────────
--  DIFFICULTY LEVELS
-- ─────────────────────────────────────────────────────────────────────────────
--
-- The player picks a level from the dealer menu when starting a job. Each level
-- sets two timers (values are in milliseconds):
--
--   tabletTime -> per-tap timer on the Autel tablet (stage 1)
--   wireTime   -> total time to finish the rewire (stage 2); 0 = no limit
--
-- These OVERRIDE Config.Minigame.timePerStep and Config.WireGame.time above.
-- You can optionally add `steps` or `wires` to a level and it will override the
-- global default for that level only (left out = use global).
--
-- Each level also has:
--   xpRequired -> XP the player must have before this level unlocks (0 = always
--                 available). The dealer menu shows locked levels greyed out with
--                 how much more XP is needed.
--   reward     -> the reward handed over on delivery for THIS level. Same shape
--                 as Config.Reward (mode + items). Left out -> use Config.Reward.

Config.Difficulty = {
    -- level used if a job ever starts without a valid choice
    default = 'easy',

    -- order the levels appear in the dealer menu
    order = { 'easy', 'medium', 'hard' },

    levels = {
        easy = {
            label      = 'Easy',
            xpRequired = 0,     -- always available
            tabletTime = 15000, -- 15s per tap
            wireTime   = 30000, -- 30s to rewire
            reward = {
                mode  = 'all',
                items = {
                    { item = 'black_money', min = 20000, max = 30000 },
                },
            },
        },
        medium = {
            label      = 'Medium',
            xpRequired = 150,   -- unlock at 150 XP
            tabletTime = 10000, -- 10s per tap
            wireTime   = 20000, -- 20s to rewire
            reward = {
                mode  = 'all',
                items = {
                    { item = 'black_money', min = 40000, max = 50000 },
                },
            },
        },
        hard = {
            label      = 'Hard',
            xpRequired = 250,   -- unlock at 250 XP
            tabletTime = 5000,  -- 5s per tap
            wireTime   = 15000, -- 15s to rewire
            reward = {
                mode  = 'all',
                items = {
                    { item = 'black_money', min = 60000, max = 70000 },
                },
            },
        },
    },
}
