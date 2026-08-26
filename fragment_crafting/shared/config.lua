Config = {}

-----------------------------------------------------------
-- Crafting bench locations
-----------------------------------------------------------
Config.CraftingLocations = {
    {
        coords = vector4(-51.9029, -2760.7881, 6.0820, 182.6086),
        spawnDistance = 30.0,
        model = 'gr_prop_gr_bench_02b',
    },
}

-----------------------------------------------------------
-- ox_inventory image resolver
-- NUI loads images from:  nui://<resource>/web/images/<image>.png
-- Change to whatever resource holds your item images (usually 'ox_inventory').
-----------------------------------------------------------
Config.InventoryImagePath = 'ox_inventory'

-----------------------------------------------------------
-- Weapon recipes
--
-- Crafting model (server-enforced):
--   * Player needs the matching blueprint item (NOT consumed on craft)
--   * Player needs `fragmentCost` of `tbx_fragments` to craft (see field below)
--   * No other items required
--
-- Fields:
--   label         - display name
--   spawnName     - WEAPON_* hash name handed to the player on success.
--                   Also used as the ox_inventory image name (lowercased)
--                   for the UI thumbnail and big preview.
--   category      - shown under the weapon name (RIFLE / SMG / etc)
--   subtitle      - short description in the center pane
--   blueprintItem - item that unlocks the recipe in ox_inventory
--   fragmentCost  - fragments charged when this recipe is crafted. The server
--                   reads its own copy of this config so the value cannot be
--                   forged by a tampered client. Any positive integer.
-----------------------------------------------------------

Config.WeaponRecipes = {
    -- {
    --     label = 'Christmas ARP',
    --     spawnName = 'WEAPON_KAALCHRISTARP',
    --     category = 'ASSAULT RIFLE',
    --     subtitle = 'A festive Christmas-themed assault rifle.',
    --     blueprintItem = 'blueprint_christmas_arp',
    --     bigImage = 'WEAPON_KAALCHRISTARP',
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = 'Christmas M13',
    --     spawnName = 'WEAPON_KAALCHRISTM13',
    --     category = 'ASSAULT RIFLE',
    --     subtitle = 'A festive Christmas-themed assault rifle.',
    --     blueprintItem = 'blueprint_christmas_m13',
    --     bigImage = 'WEAPON_KAALCHRISTM13',
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = 'Christmas AUG',
    --     spawnName = 'WEAPON_KAALCHRISTAUG',
    --     category = 'ASSAULT RIFLE',
    --     subtitle = 'A festive Christmas-themed assault rifle.',
    --     blueprintItem = 'blueprint_christmas_aug',
    --     bigImage = 'WEAPON_KAALCHRISTAUG',
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = 'Christmas R9',
    --     spawnName = 'WEAPON_KAALCHRISTR9',
    --     category = 'ASSAULT RIFLE',
    --     subtitle = 'A festive Christmas-themed assault rifle.',
    --     blueprintItem = 'blueprint_christmas_r9',
    --     bigImage = 'WEAPON_KAALCHRISTR9',
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = 'Christmas SMG',
    --     spawnName = 'WEAPON_KAALCHRISTPRESENTS',
    --     category = 'SMG',
    --     subtitle = 'A festive Christmas-themed submachine gun.',
    --     blueprintItem = 'blueprint_christmas_smg',
    --     bigImage = 'WEAPON_KAALCHRISTPRESENTS',
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = 'Christmas 9A91',
    --     spawnName = 'WEAPON_KAALCHRIST9A91',
    --     category = 'SMG',
    --     subtitle = 'A festive Christmas-themed submachine gun.',
    --     blueprintItem = 'blueprint_christmas_9a91',
    --     bigImage = 'WEAPON_KAALCHRIST9A91',
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = 'Christmas MP5',
    --     spawnName = 'WEAPON_KAALCHRISTMP5',
    --     category = 'SMG',
    --     subtitle = 'A festive Christmas-themed submachine gun.',
    --     blueprintItem = 'blueprint_christmas_mp5',
    --     bigImage = 'WEAPON_KAALCHRISTMP5',
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = 'Christmas AK12',
    --     spawnName = 'WEAPON_KAALCHRISTAK12',
    --     category = 'ASSAULT RIFLE',
    --     subtitle = 'A festive Christmas-themed assault rifle.',
    --     blueprintItem = 'blueprint_christmas_ak12',
    --     bigImage = 'WEAPON_KAALCHRISTAK12',
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = 'Christmas Stocking',
    --     spawnName = 'WEAPON_KAALCHRISTSTOCKING',
    --     category = 'PISTOL',
    --     subtitle = 'A festive Christmas-themed pistol.',
    --     blueprintItem = 'blueprint_christmas_stocking',
    --     bigImage = 'WEAPON_KAALCHRISTSTOCKING',
    --     fragmentCost = 60,
    -- },

    -- -- Valentine's Day
    -- {
    --     label = "V-Day Roses",
    --     spawnName = "WEAPON_VDAYROSES",
    --     category = "ASSAULT RIFLE",
    --     subtitle = "A rose-adorned Valentine's rifle for the hopeless romantic.",
    --     blueprintItem = "blueprint_vday_roses",
    --     bigImage = "WEAPON_VDAYROSES",
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = "V-Day LoveSpin",
    --     spawnName = "WEAPON_VDAYLOVESPIN",
    --     category = "ASSAULT RIFLE",
    --     subtitle = "A spinning Valentine's assault rifle with love in every shot.",
    --     blueprintItem = "blueprint_vday_lovespin",
    --     bigImage = "WEAPON_VDAYLOVESPIN",
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = "V-Day Choco",
    --     spawnName = "WEAPON_VDAYCHOCO",
    --     category = "ASSAULT RIFLE",
    --     subtitle = "A chocolate-themed Valentine's rifle, deadly and delicious.",
    --     blueprintItem = "blueprint_vday_choco",
    --     bigImage = "WEAPON_VDAYCHOCO",
    --     fragmentCost = 80,
    -- },

    -- -- St. Patrick's Day
    -- {
    --     label = "STPatrick M170",
    --     spawnName = "WEAPON_STPM170",
    --     category = "ASSAULT RIFLE",
    --     subtitle = "A lucky St. Patrick's themed M170 assault rifle.",
    --     blueprintItem = "blueprint_stp_m170",
    --     bigImage = "WEAPON_STPM170",
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = "STPatrick FSS",
    --     spawnName = "WEAPON_STPFSS",
    --     category = "ASSAULT RIFLE",
    --     subtitle = "A shamrock-adorned FSS rifle for the luckiest shooter.",
    --     blueprintItem = "blueprint_stp_fss",
    --     bigImage = "WEAPON_STPFSS",
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = "STPatrick Grau",
    --     spawnName = "WEAPON_STPGRAU",
    --     category = "ASSAULT RIFLE",
    --     subtitle = "A clover-covered Grau for those feeling lucky on St. Patrick's Day.",
    --     blueprintItem = "blueprint_stp_grau",
    --     bigImage = "WEAPON_STPGRAU",
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = "STPatrick X12",
    --     spawnName = "WEAPON_STPX12",
    --     category = "PISTOL",
    --     subtitle = "An Irish-themed X12 for the luckiest shooter in the pub.",
    --     blueprintItem = "blueprint_stp_x12",
    --     bigImage = "WEAPON_STPX12",
    --     fragmentCost = 60,
    -- },

    -- -- Mother's Day
    -- {
    --     label = "Mother's Grace",
    --     spawnName = "WEAPON_MOTHERSAR1",
    --     category = "ASSAULT RIFLE",
    --     subtitle = "A graceful Mother's Day rifle honoring those who gave us life.",
    --     blueprintItem = "blueprint_mothers_ar1",
    --     bigImage = "WEAPON_MOTHERSAR1",
    --     fragmentCost = 80,
    -- },
    -- {
    --     label = "Mother Knows Best",
    --     spawnName = "WEAPON_MOTHERSAR2",
    --     category = "ASSAULT RIFLE",
    --     subtitle = "A powerful rifle because mother always knows what's best.",
    --     blueprintItem = "blueprint_mothers_ar2",
    --     bigImage = "WEAPON_MOTHERSAR2",
    --     fragmentCost = 80,
    -- },

    -- -- 420
    {
        label = "Kush Canon",
        spawnName = "WEAPON_ANIM420AR",
        category = "ASSAULT RIFLE",
        subtitle = "A dank 420 assault rifle for the most elevated battles.",
        blueprintItem = "blueprint_anim420_ar",
        bigImage = "WEAPON_ANIM420AR",
        fragmentCost = 80,
    },
    {
        label = "Zaza Nine",
        spawnName = "WEAPON_ANIM420PISTOL",
        category = "PISTOL",
        subtitle = "A blazed 420 pistol for those riding the highest wave.",
        blueprintItem = "blueprint_anim420_pistol",
        bigImage = "WEAPON_ANIM420PISTOL",
        fragmentCost = 60,
    },
}

-----------------------------------------------------------
-- Attachment definitions
--
-- Fields:
--   label           - display name in the UI
--   type            - "model" spawns a prop, "barrel" uses a GTA component hash
--   category        - "SCOPE" | "SIGHT" | "BARREL" | "LASER" | "UNDERBARREL" | "GRIP" | "MAGAZINE"
--                     (server rejects any other category as un-craftable)
--   model           - prop model name (type=model only)
--   component       - GTA weapon component hash name (type=barrel only)
--   defaultOffset   - initial gizmo position from weapon origin (meters)
--   defaultRotation - initial gizmo rotation (degrees)
--   item            - ox_inventory item name. Used both for the UI image
--                     (https://cdn2.nullnetwork.ca/2adc0505f31cd560/inventory/<item>.png) and as the
--                     in-game item identifier the server references.
--   blueprintItem   - ox_inventory item required to INSTALL this attachment.
--                     NOT consumed on install. NOT required to remove (so a
--                     player can never get stuck with an attachment they
--                     can't take off). Server validates ownership on commit.
--   fragmentCost    - fragments charged on Save & Close when newly installed.
--                     The server reads its own copy of this same config file,
--                     so the value can't be forged by a tampered client.
--                     Set to any positive integer. Removed attachments are
--                     NOT refunded (no-refund policy is server-enforced).
-----------------------------------------------------------
Config.Attachments = {
{
        label     = "16x Sniper Scope",
        type      = "model",
        category  = "SCOPE",
        model     = "16xsnipe_scope",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "16x_snipe_scope",
        blueprintItem = "blueprint_16x_snipe_scope",
        fragmentCost = 10,
    },
    {
        label     = "Grip Pod",
        type      = "model",
        category  = "UNDERBARREL",
        model     = "grippod_grip",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "grippod_grip",
        blueprintItem = "blueprint_grippod_grip",
        fragmentCost = 5,
    },
    {
        label     = "Holographic Sight",
        type      = "model",
        category  = "SCOPE",
        model     = "holo_scope",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "holo_scope",
        blueprintItem = "blueprint_holo_scope",
        fragmentCost = 10,
    },
    {
        label     = "Hybrid Scope",
        type      = "model",
        category  = "SCOPE",
        model     = "hybrid_scope",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "hybrid_scope",
        blueprintItem = "blueprint_hybrid_scope",
        fragmentCost = 10,
    },
    {
        label     = "KAC Grip",
        type      = "model",
        category  = "UNDERBARREL",
        model     = "kac_grip",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "kac_grip",
        blueprintItem = "blueprint_kac_grip",
        fragmentCost = 5,
    },
    {
        label     = "Kobra Sight",
        type      = "model",
        category  = "SCOPE",
        model     = "kobra_scope",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "kobra_scope",
        blueprintItem = "blueprint_kobra_scope",
        fragmentCost = 10,
    },
    {
        label     = "Laser Foregrip",
        type      = "model",
        category  = "UNDERBARREL",
        model     = "laserforegrip",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "laser_foregrip",
        blueprintItem = "blueprint_laser_foregrip",
        fragmentCost = 5,
    },
    {
        label     = "Blue Laser",
        type      = "model",
        category  = "LASER",
        model     = "lazer_blue",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "lazer_blue",
        blueprintItem = "blueprint_lazer_blue",
        fragmentCost = 5,
    },
    {
        label     = "Green Laser",
        type      = "model",
        category  = "LASER",
        model     = "lazer_green",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "lazer_green",
        blueprintItem = "blueprint_lazer_green",
        fragmentCost = 5,
    },
    {
        label     = "Pink Laser",
        type      = "model",
        category  = "LASER",
        model     = "lazer_pink",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "lazer_pink",
        blueprintItem = "blueprint_lazer_pink",
        fragmentCost = 5,
    },
    {
        label     = "Red Laser",
        type      = "model",
        category  = "LASER",
        model     = "lazer_red",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "lazer_red",
        blueprintItem = "blueprint_lazer_red",
        fragmentCost = 5,
    },
    {
        label     = "Lightbox Laser",
        type      = "model",
        category  = "LASER",
        model     = "lightbox_lazer",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "lightbox_lazer",
        blueprintItem = "blueprint_lightbox_lazer",
        fragmentCost = 5,
    },
    {
        label     = "Long Barrel",
        type      = "model",
        category  = "BARREL",
        model     = "longbarrel",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "long_barrel",
        blueprintItem = "blueprint_long_barrel",
        fragmentCost = 10,
    },
    {
        label     = "Pistol Laser",
        type      = "model",
        category  = "LASER",
        model     = "pistol_lazer",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "pistol_lazer",
        blueprintItem = "blueprint_pistol_lazer",
        fragmentCost = 5,
    },
    {
        label     = "PMAX Angled Grip",
        type      = "model",
        category  = "UNDERBARREL",
        model     = "pmax_angledgrip",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "pmax_angledgrip",
        blueprintItem = "blueprint_pmax_angledgrip",
        fragmentCost = 5,
    },
    {
        label     = "Pistol Laser MK2",
        type      = "model",
        category  = "LASER",
        model     = "pstl_lazer",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "pstl_lazer",
        blueprintItem = "blueprint_pstl_lazer",
        fragmentCost = 5,
    },
    {
        label     = "Short Barrel",
        type      = "model",
        category  = "BARREL",
        model     = "shortbarrel",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "short_barrel",
        blueprintItem = "blueprint_short_barrel",
        fragmentCost = 10,
    },
    {
        label     = "Side Grip",
        type      = "model",
        category  = "UNDERBARREL",
        model     = "sidegrip",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "side_grip",
        blueprintItem = "blueprint_side_grip",
        fragmentCost = 5,
    },
    {
        label     = "TAC ACOG Scope",
        type      = "model",
        category  = "SCOPE",
        model     = "tacacog",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "tac_acog",
        blueprintItem = "blueprint_tac_acog",
        fragmentCost = 10,
    },
    {
        label     = "X-Hamr Scope",
        type      = "model",
        category  = "SCOPE",
        model     = "xhamr_scope",
        defaultOffset = { x = 0.0, y = 0.0, z = 0.0 },
        defaultRotation = { x = 0.0, y = 0.0, z = 0.0 },
        item      = "xhamr_scope",
        blueprintItem = "blueprint_xhamr_scope",
        fragmentCost = 10,
    },
}

-----------------------------------------------------------
-- Gizmo settings for free-placement
-----------------------------------------------------------
Config.Gizmo = {
    nudgeStep      = 0.002,
    nudgeFast      = 0.008,
    rotStep        = 1.0,
    rotFast        = 3.0,
    tickMs         = 16,
    -- Per-axis offset clamp from the weapon's origin (meters).
    -- Long rifles are ~1m, so 1.5 gives comfortable headroom past muzzle/stock.
    maxOffset      = 1.5,
}

exports('getAllFragmentBenchItems', function()
    local fragmentBenchItems = {}
    for _, attachment in ipairs(Config.Attachments) do
        if attachment.blueprintItem and attachment.fragmentCost then
            fragmentBenchItems[attachment.item] = true
            fragmentBenchItems[attachment.blueprintItem] = true
        end
    end
    return fragmentBenchItems
end)

local oldPrint = print

function print(...)
    -- oldPrint(...)    
end

return Config