Config = Config or {}

Config.BLACK_MARKET_LOCATION = vector4(-48.394432, -1240.303955, 28.429165,	1.99)

-- Every spot Viper stands at. One dialog ped is created per entry and they all
-- open the same store. BLACK_MARKET_LOCATION above stays as the legacy single
-- location and is used as a fallback when this list is empty.
Config.BLACK_MARKET_LOCATIONS = {
    vector4(-48.394432, -1240.303955, 28.429165, 1.99),
    vector4(1971.6279, 3829.2190, 31.5107, 174.8069),
}

Config.server = "tlla"
Config.gender = "male"

Config.logChannelID = 1410233474559905892

-- Shared expiry for the Summer 2026 content (products + bundle). In the past
-- on purpose: the summer drop has ended and stays expired.
-- 1785542400 = 2026-08-01 00:00:00 UTC. This must stay a LITERAL number:
-- config.lua is a shared script and os.time()/os.date() do not exist on the
-- FiveM client. The NUI converts to ms client-side (expiresAt * 1000) and the
-- server enforces it with os.time() on purchase attempts.
Config.SUMMER_EXPIRES_AT = 1785542400

-- Shared expiry for the Retro 80s drop (weapons, cases, Electric Dream, bundle).
-- Live through Aug 13: 1786665600 = 2026-08-14 00:00:00 UTC (Aug 13, 5:00 PM
-- Los Angeles). Same literal-number rule as above. (Extended +3 days from Aug 10.)
Config.RETRO_EXPIRES_AT = 1786665600

-- Shared expiry for the Ice Cream drop (weapons, Sandy Flakes, cargo crowbars).
-- One month of runway from 2026-08-16: 1789516800 = 2026-09-16 00:00:00 UTC
-- (Sep 15, 5:00 PM Los Angeles). Same literal-number rule as above.
Config.ICECREAM_EXPIRES_AT = 1789516800

-- Data-driven promo badges, computed in the NUI from the REAL purchased-today
-- stats. Hard-setting hot/bestSeller/popular = true on an item still forces
-- that badge on permanently; these rules just ADD badges from live sales data:
--   BEST SELLER -> today's top seller of each category (needs >= minimumCount)
--   HOT         -> any product at/above hotThreshold sales today
--   POPULAR     -> any product at/above popularThreshold sales today
Config.DYNAMIC_BADGES = {
    enabled = true,
    minimumCount = 5,
    hotThreshold = 25,
    popularThreshold = 5,
}

--[[
    Optional promo fields — every field below can be added to any MARKET_ITEMS
    entry (and most to Config.BUNDLE). Anything omitted is simply hidden in the UI.

    id             = 'neon_crate'       -- stable product id for daily stats (defaults to spawn_code)
    rarity         = 'legendary'        -- common / uncommon / rare / epic / legendary / mythic; colors the
                                        -- card's tier strip, label and artwork glow. Unset = derived from
                                        -- price (>=1400 legendary, >=1000 epic, >=600 rare, >=200 uncommon)
    badge          = 'NEW'              -- pill on the card: NEW / LIMITED / EXCLUSIVE / HOT / BEST SELLER / POPULAR (or any custom text)
    hot            = true               -- adds a HOT badge
    exclusive      = true               -- adds an EXCLUSIVE badge
    bestSeller     = true               -- adds a BEST SELLER badge
    popular        = true               -- adds a POPULAR badge
    featured       = true               -- shows in the big FEATURED spotlight at the top of its category
    expiresAt      = Config.SUMMER_EXPIRES_AT -- unix seconds; NUI counts down locally, server blocks expired purchases
    originalPrice  = 1600               -- shows Was/Now pricing + "You Save X" on the card
    cta            = 'Open Case'        -- custom Buy button text
    cartable       = true               -- clicks queue into a cart; delivered in stacks when the store closes
    description    = 'Short sell text'  -- one-liner under the item name
    metadata       = { 'Animated Skin', 'Seasonal' }  -- small descriptor tags
    rewardPreview  = { 'Rare Skins' }   -- reward chips (great for cases)
    sections       = { 'best_sellers' } -- keys of Config.SECTIONS rows this item appears in

    -- real purchased-today counter (SQL-backed, never invented):
    showDailyPurchases    = true              -- opt in to showing the counter
    purchaseCountLabel    = 'opened today'    -- "purchased today" / "opened today" / "claimed today"
    minimumCountToDisplay = 5                 -- hide the label below this real count (default 5)
]]

Config.MARKET_ITEMS = {
    -- Ice Cream drop. Priced level with the summer/retro sets (rifle-class 1200
    -- legendary, semi 900 epic). `icon` points at art shipped in html/items/ -
    -- these guns are brand new and are not on the shared inventory CDN yet; drop
    -- the icon fields once they are uploaded there.
    -- WEAPON_ICECREAMSWITCH is deliberately NOT here: switches are never sold in
    -- the market, exactly as KSSUMSWITCH and RETRO80SSWITCH are excluded. It is
    -- crate/cargo-only.
    { limited = true, label = "Ice Cream MP5", spawn_code = "WEAPON_ICECREAMMP5", sections = { "sandy_shores_drop" }, quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.ICECREAM_EXPIRES_AT, showDailyPurchases = true },
    { limited = true, label = "Ice Cream RPD", spawn_code = "WEAPON_ICECREAMRPD", sections = { "sandy_shores_drop" }, quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.ICECREAM_EXPIRES_AT, showDailyPurchases = true },
    { limited = true, label = "Ice Cream SR-47", spawn_code = "WEAPON_SUMMERSR47", sections = { "sandy_shores_drop" }, quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.ICECREAM_EXPIRES_AT, showDailyPurchases = true },
    { limited = true, label = "Ice Cream Semi", spawn_code = "WEAPON_ICECREAMSEMI", sections = { "sandy_shores_drop" }, quantity = 1, price = 900, type = "weapon", rarity = "epic", expiresAt = Config.ICECREAM_EXPIRES_AT, showDailyPurchases = true },

    -- { limited = true, label = "Retro 80s AR", spawn_code = "WEAPON_RETRO80SAR", sections = { "retro_drop" }, quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.RETRO_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Retro 80s LMG", spawn_code = "WEAPON_RETRO80SLMG", sections = { "retro_drop" }, quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.RETRO_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Retro 80s MP40", spawn_code = "WEAPON_RETRO80SMP40", sections = { "retro_drop" }, quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.RETRO_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Retro 80s Striker", spawn_code = "WEAPON_RETRO80SSTRIKER", sections = { "retro_drop" }, quantity = 1, price = 1600, type = "weapon", rarity = "legendary", expiresAt = Config.RETRO_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Retro 80s Semi", spawn_code = "WEAPON_RETRO80SSEMI", sections = { "retro_drop" }, quantity = 1, price = 900, type = "weapon", rarity = "epic", expiresAt = Config.RETRO_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Retro 80s Mallet", spawn_code = "WEAPON_RETRO80SMALLET", sections = { "retro_drop" }, quantity = 1, price = 500, type = "weapon", rarity = "epic", expiresAt = Config.RETRO_EXPIRES_AT, showDailyPurchases = true },

    -- { limited = true, label = "Summer AR", spawn_code = "WEAPON_KSSUMAR", quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.SUMMER_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Summer Long-Rifle", spawn_code = "WEAPON_KSSUMAR2", quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.SUMMER_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Summer SMG", spawn_code = "WEAPON_KSSUMSMG", quantity = 1, price = 1200, type = "weapon", rarity = "legendary", expiresAt = Config.SUMMER_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Summer Semi", spawn_code = "WEAPON_KSSUMSEMI", quantity = 1, price = 900, type = "weapon", rarity = "epic", expiresAt = Config.SUMMER_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Summer Ice Cream", spawn_code = "WEAPON_TLLAICECREAM", quantity = 1, price = 500, type = "weapon", rarity = "epic", expiresAt = Config.SUMMER_EXPIRES_AT, showDailyPurchases = true },
    -- { limited = true, label = "Summer Karambit", spawn_code = "WEAPON_TLLASUMMERKARAMBIT", quantity = 1, price = 500, type = "weapon", rarity = "epic", expiresAt = Config.SUMMER_EXPIRES_AT, showDailyPurchases = true },


    -- { limited = true, label = "4TH AR", spawn_code = "WEAPON_FLAGAR", quantity = 1, price = 1200, type = "weapon" },
    -- { limited = true, label = "4TH ARP", spawn_code = "WEAPON_FLAGARP", quantity = 1, price = 1200, type = "weapon" },
    -- { limited = true, label = "4TH LMG", spawn_code = "WEAPON_FLAGLMG", quantity = 1, price = 1200, type = "weapon" },
    -- { limited = true, label = "4TH Semi", spawn_code = "WEAPON_FLAGSEMI", quantity = 1, price = 900, type = "weapon" },

    -- { limited = true, label = "Juneteenth Purp AR", spawn_code = "WEAPON_JUNETEENTHPURPAR", quantity = 1, price = 1200, type = "weapon" },
    -- { limited = true, label = "Juneteenth Semi", spawn_code = "WEAPON_JUNETEENTHSEMI", quantity = 1, price = 1200, type = "weapon" },
    -- { limited = true, label = "Juneteenth SMG", spawn_code = "WEAPON_JUNETEENTHSMG", quantity = 1, price = 1200, type = "weapon" },
    -- { limited = true, label = "Juneteenth AR", spawn_code = "WEAPON_JUNETEENTHAR", quantity = 1, price = 1200, type = "weapon" },
    -- { limited = true, label = "Juneteenth Case (Sw)", spawn_code = "case_juneteenth", quantity = 1, price = 50, type = "case" },

    -- WEAPONS
    { label = "Fire Shotty", spawn_code = "WEAPON_FIRESHOTTY", quantity = 1, price = 1500, type = "weapon" },
    { label = "Gold AK", spawn_code = "WEAPON_GOLDAK", quantity = 1, price = 1100, type = "weapon" },
    { label = "Halloween AUG", spawn_code = "WEAPON_HALLOWEENAUG", quantity = 1, price = 1200, type = "weapon" },
    { label = "Joker SCAR", spawn_code = "WEAPON_JOKERSCAR", quantity = 1, price = 1600, type = "weapon" },
    { label = "KTEC", spawn_code = "WEAPON_KTECPACK", quantity = 1, price = 1400, type = "weapon" },
    { label = "Mermaid Galil", spawn_code = "WEAPON_MERMAIDGALIL", quantity = 1, price = 1250, type = "weapon" },
    { label = "Money SIG", spawn_code = "WEAPON_MONEYSIG", quantity = 1, price = 1600, type = "weapon" },
    { label = "Powa CR", spawn_code = "WEAPON_POWACR", quantity = 1, price = 1350, type = "weapon" },
    { label = "Serpent Badger", spawn_code = "WEAPON_SERPENTBADGER", quantity = 1, price = 1200, type = "weapon" },
    { label = "Slimey Draco", spawn_code = "WEAPON_SLIMEYDRACO", quantity = 1, price = 1100, type = "weapon" },
    { label = "Streak MG", spawn_code = "WEAPON_STREAKMG", quantity = 1, price = 2400, type = "weapon" },
    { label = "Thunder ARP", spawn_code = "WEAPON_THUNDERARP", quantity = 1, price = 1500, type = "weapon" },
    { label = "Tiger G36", spawn_code = "WEAPON_TIGERG36", quantity = 1, price = 1200, type = "weapon" },
    { label = "Street Sweep", spawn_code = "WEAPON_STREETSWEEP", quantity = 1, price = 1600, type = "weapon" },
    { label = "SW 357", spawn_code = "WEAPON_SW357", quantity = 1, price = 600, type = "weapon" },
    --{ label = "FN 509 Hunt", spawn_code = "WEAPON_FN509HUNT", quantity = 1, price = 400, type = "weapon" },
    { label = "Desert Eagle", spawn_code = "WEAPON_DESERTEAGLE", quantity = 1, price = 1000, type = "weapon" },

    { label = "Bank Son GP2 AK47", spawn_code = "WEAPON_BANKSONGP2AK47", quantity = 1, price = 1150, type = "weapon" },
    { label = "Bank Son GP2 AKS", spawn_code = "WEAPON_BANKSONGP2AKS", quantity = 1, price = 1500, type = "weapon" },
    { label = "Bank Son GP2 AR15", spawn_code = "WEAPON_BANKSONGP2AR15", quantity = 1, price = 1600, type = "weapon" },
    { label = "Bank Son GP2 ARP", spawn_code = "WEAPON_BANKSONGP2ARP", quantity = 1, price = 1350, type = "weapon" },
    { label = "Bank Son GP2 Krig C", spawn_code = "WEAPON_BANKSONGP2KRIGC", quantity = 1, price = 1000, type = "weapon" },
    { label = "Bank Son GP2 M4A1", spawn_code = "WEAPON_BANKSONGP2M4A1", quantity = 1, price = 1500, type = "weapon" },
    { label = "Bank Son GP2 M4 CQC", spawn_code = "WEAPON_BANKSONGP2M4CQC", quantity = 1, price = 1250, type = "weapon" },
    { label = "Bank Son GP2 MK CQC", spawn_code = "WEAPON_BANKSONGP2MKCQC", quantity = 1, price = 1300, type = "weapon" },
    { label = "Bank Son GP2 SCAR-H", spawn_code = "WEAPON_BANKSONGP2SCARH", quantity = 1, price = 1300, type = "weapon" },
    { label = "Bank Son GP2 SIG 556", spawn_code = "WEAPON_BANKSONGP2SIG556", quantity = 1, price = 1000, type = "weapon" },
    { label = "Bank Son GP2 SIG MCX", spawn_code = "WEAPON_BANKSONGP2SIGMCX", quantity = 1, price = 1300, type = "weapon" },
    { label = "Bank Son GP2 SPAS-12", spawn_code = "WEAPON_BANKSONGP2SPAS12", quantity = 1, price = 1250, type = "weapon" },
    { label = "Bank Son GP2 UMP45", spawn_code = "WEAPON_BANKSONGP2UMP45", quantity = 1, price = 1000, type = "weapon" },
    { label = "Lighting SMG", spawn_code = "WEAPON_LIGHTNINGSMG", quantity = 1, price = 1500, type = "weapon" },

    { label = "SWP2 Blackout AK", spawn_code = "WEAPON_SWP2BLACKOUTAK", quantity = 1, price = 1000, type = "weapon" },
    { label = "SWP2 GR300 BO", spawn_code = "WEAPON_SWP2GR300BO", quantity = 1, price = 1250, type = "weapon" },
    { label = "SWP2 Sawnoff", spawn_code = "WEAPON_SWP2SAWNOFF", quantity = 1, price = 1200, type = "weapon" },
    { label = "SWP2 T SCAR", spawn_code = "WEAPON_SWP2TSCAR", quantity = 1, price = 900, type = "weapon" },
    { label = "SWP2 U Glock", spawn_code = "WEAPON_SWP2UGLOCK", quantity = 1, price = 250, type = "weapon" },
    { label = 'Blue Revision', type = 'weapon', quantity = 1, price = 1000, spawn_code = 'WEAPON_BLUEREVISION' },
    { label = 'Chrome Hearts G40', type = 'weapon', quantity = 1, price = 1000, spawn_code = 'WEAPON_CHROMEHEARTSG40' },
    { label = 'BGB G17', type = 'weapon', quantity = 1, price = 800, spawn_code = 'WEAPON_BGBG17' },
    { label = 'Bubble Gum', type = 'weapon', quantity = 1, price = 800, spawn_code = 'WEAPON_TPSWITCH' },
    { label = 'WG G17', type = 'weapon', quantity = 1, price = 800, spawn_code = 'WEAPON_WGG17' },
    { label = 'WB G17', type = 'weapon', quantity = 1, price = 800, spawn_code = 'WEAPON_WBG17' },
    { label = 'BW G19', type = 'weapon', quantity = 1, price = 800, spawn_code = 'WEAPON_BWG19' },
    { label = 'WB G19 G5', type = 'weapon', quantity = 1, price = 900, spawn_code = 'WEAPON_WBG19G5' },
    { label = 'BW M9A3', type = 'weapon', quantity = 1, price = 900, spawn_code = 'WEAPON_BWM9A3' },
    
    { label = 'Chrm Hrt ASVal', type = 'weapon', quantity = 1, price = 1200, spawn_code = 'WEAPON_CHRMHRTDRP1ASVAL' },
    { label = 'Chrm Hrt MP7', type = 'weapon', quantity = 1, price = 1200, spawn_code = 'WEAPON_CHRMHRTDRP1MP7' },
    { label = 'Chrm Hrt SMG', type = 'weapon', quantity = 1, price = 1200, spawn_code = 'WEAPON_CHRMHRTDRP1SMG' },
    { label = 'Chrm Hrt Glock', type = 'weapon', quantity = 1, price = 1200, spawn_code = 'WEAPON_CHRMHRTDRP1PISTOL' },
    -- AMMO
    { label = '9mm [100x]', type = 'ammo', quantity = 100, price = 75, spawn_code = 'ammo-9' },
    { label = 'Rifle Ammo [100x]', type = 'ammo', quantity = 100, price = 80, spawn_code = 'ammo-rifle' },
    { label = '45 ACP [100x]', type = 'ammo', quantity = 100, price = 75, spawn_code = 'ammo-45' },
    { label = '50 AE [100x]', type = 'ammo', quantity = 100, price = 75, spawn_code = 'ammo-50' },
    { label = '12-Gauge [50x]', type = 'ammo', quantity = 50, price = 150, spawn_code = 'ammo-shotgun' },

    -- CASES
    -- {
    --     limited = true, label = 'Ocean Crate', type = 'case', quantity = 1, price = 50, spawn_code = 'cooler_ocean', rarity = 'uncommon',
    --     expiresAt = Config.SUMMER_EXPIRES_AT, featured = true, featuredPriority = 9, cta = 'Open Case', cartable = true,
    --     description = 'Entry summer crate with a shot at exclusive summer weapons.',
    --     rewardPreview = { 'Summer Weapons', 'Cash' },
    --     showDailyPurchases = true, purchaseCountLabel = 'opened today',
    -- },
    -- {
    --     limited = true, label = 'Sunset Crate', type = 'case', quantity = 1, price = 100, spawn_code = 'cooler_sunset', rarity = 'rare',
    --     expiresAt = Config.SUMMER_EXPIRES_AT, featured = true, featuredPriority = 8, cta = 'Open Case', cartable = true,
    --     description = 'Mid-tier summer crate with doubled odds on every summer weapon.',
    --     rewardPreview = { 'Summer Weapons', 'Cash' },
    --     showDailyPurchases = true, purchaseCountLabel = 'opened today',
    -- },
    -- {
    --     -- featuredPriority = 1 -> the big hero case; 2 and 3 become the smaller supporting cards
    --     limited = true, label = 'Neon Crate', type = 'case', quantity = 1, price = 125, spawn_code = 'cooler_neon', rarity = 'epic',
    --     expiresAt = Config.SUMMER_EXPIRES_AT, featured = true, featuredPriority = 7, cta = 'Open Case', cartable = true,
    --     description = 'Premium summer crate - the best odds on exclusive summer weapons and rare rewards.',
    --     rewardPreview = { 'Summer Weapons', 'Rare Skins', 'Cash' },
    --     showDailyPurchases = true, purchaseCountLabel = 'opened today',
    -- },

    -- Retro 80s cases. Priced level with the cooler tier each one mirrors in
    -- nn_summer (retrowave=ocean, arcade=sunset, synthwave=neon). `icon` points at
    -- art shipped in html/ because these are new items and are not on the shared
    -- inventory CDN yet - drop the icon fields once they are uploaded there.
    -- These hold the Cases spotlight (featuredPriority 1-3 = the big hero card and
    -- its two supporting cards); the summer coolers sit at 4-6 and fall to the grid.
    -- {
    --     limited = true, label = 'Retrowave Case', type = 'case', quantity = 1, price = 50, spawn_code = 'retrowave_case', sections = { 'retro_drop' }, rarity = 'uncommon',
    --     icon = 'items/retrowave_case.png',
    --     expiresAt = Config.RETRO_EXPIRES_AT, featured = true, featuredPriority = 6, cta = 'Open Case', cartable = true,
    --     description = 'Entry retro case with a shot at the exclusive Retro 80s weapons.',
    --     rewardPreview = { 'Retro Weapons', 'Electric Dream', 'Cash' },
    --     showDailyPurchases = true, purchaseCountLabel = 'opened today',
    -- },
    -- {
    --     limited = true, label = 'Arcade Case', type = 'case', quantity = 1, price = 100, spawn_code = 'arcade_case', sections = { 'retro_drop' }, rarity = 'rare',
    --     icon = 'items/arcade_case.png',
    --     expiresAt = Config.RETRO_EXPIRES_AT, featured = true, featuredPriority = 5, cta = 'Open Case', cartable = true,
    --     description = 'Mid-tier retro case with doubled odds on every Retro 80s weapon.',
    --     rewardPreview = { 'Retro Weapons', 'Electric Dream', 'Cash' },
    --     showDailyPurchases = true, purchaseCountLabel = 'opened today',
    -- },
    -- {
    --     limited = true, label = 'Synthwave Case', type = 'case', quantity = 1, price = 125, spawn_code = 'synthwave_case', sections = { 'retro_drop' }, rarity = 'epic',
    --     icon = 'items/synthwave_case.png',
    --     expiresAt = Config.RETRO_EXPIRES_AT, featured = true, featuredPriority = 4, cta = 'Open Case', cartable = true,
    --     description = 'Premium retro case - the best odds on exclusive Retro 80s weapons and rare rewards.',
    --     rewardPreview = { 'Retro Weapons', 'Electric Dream', 'Rare Skins', 'Cash' },
    --     showDailyPurchases = true, purchaseCountLabel = 'opened today',
    -- },

    -- nn_cargo (Cargo Breach) crowbars. Not cases, but they are the gamble entry
    -- item that replaced the coolers, so they live in the same category and keep
    -- the same three-step pricing the cooler/retro tiers used (50 / 100 / 125).
    -- Which loot tier each one opens is set in nn_cargo/shared/config.lua; the
    -- tables themselves are server-only in nn_cargo/server/loot.lua.
    {
        limited = true, label = 'Steel Crowbar', type = 'case', quantity = 1, price = 50, spawn_code = 'steel_crowbar', sections = { 'sandy_shores_drop' }, rarity = 'uncommon',
        expiresAt = Config.ICECREAM_EXPIRES_AT, featured = true, featuredPriority = 3, cta = 'Buy Crowbar', cartable = true,
        description = 'Entry pry bar - a shot at the exclusive Ice Cream weapons out of a dockyard container.',
        rewardPreview = { 'Ice Cream Weapons', 'Cash' },
        showDailyPurchases = true,
    },
    {
        limited = true, label = 'Hardened Crowbar', type = 'case', quantity = 1, price = 100, spawn_code = 'hardened_crowbar', sections = { 'sandy_shores_drop' }, rarity = 'rare',
        expiresAt = Config.ICECREAM_EXPIRES_AT, featured = true, featuredPriority = 2, cta = 'Buy Crowbar', cartable = true,
        description = 'Reinforced pry bar - roughly doubled odds on every Ice Cream weapon.',
        rewardPreview = { 'Ice Cream Weapons', 'Cash' },
        showDailyPurchases = true,
    },
    {
        limited = true, label = 'Forged Crowbar', type = 'case', quantity = 1, price = 125, spawn_code = 'forged_crowbar', sections = { 'sandy_shores_drop' }, rarity = 'epic',
        expiresAt = Config.ICECREAM_EXPIRES_AT, featured = true, featuredPriority = 1, cta = 'Buy Crowbar', cartable = true,
        description = 'Heavy pry bar - the best odds on the exclusive Ice Cream weapons and the biggest hauls.',
        rewardPreview = { 'Ice Cream Weapons', 'Rare Skins', 'Cash' },
        showDailyPurchases = true,
    },

    {
        label = 'Switch Case [100% Switch]', type = 'case', quantity = 1, price = 4400, spawn_code = 'case_switchcase', rarity = 'mythic', cta = 'Open Case', cartable = true,
        description = 'Guaranteed switch in every single case.',
        rewardPreview = { '100% Switch' },
        showDailyPurchases = true, purchaseCountLabel = 'opened today',
    },
    { label = 'WM Glock Switch', type = 'case', quantity= 1, price = 40, spawn_code = 'case_switch_1', cta = 'Open Case', cartable = true, showDailyPurchases = true, purchaseCountLabel = 'opened today' },
    { label = 'Chrome Heart Switch', type = 'case', quantity= 1, price = 40, spawn_code = 'case_chrome_hearts_switch', cta = 'Open Case', cartable = true, showDailyPurchases = true, purchaseCountLabel = 'opened today' },

    -- DRUGS
    -- {
    --     limited = true, label = 'Brick of Island Haze', type = 'drugs', quantity = 1000, price = 550, spawn_code = 'drug_island_haze', rarity = 'legendary',
    --     expiresAt = Config.SUMMER_EXPIRES_AT, exclusive = true, metadata = { 'Seasonal', 'Exclusive 2026' },
    --     featured = true, featuredPriority = 2,
    --     description = '1,000 bags of the exclusive summer strain - gone when the season ends.',
    --     showDailyPurchases = true,
    -- },
    -- {
    --     -- Retro counterpart to Island Haze. Note: no `drug_` prefix on the spawn
    --     -- code (same as la_pressure below), so server.lua's canGiveDrugItem gate
    --     -- does not fire for it - that gate keys off the prefix.
    --     limited = true, label = 'Brick of Electric Dream', type = 'drugs', quantity = 1000, price = 550, spawn_code = 'electric_dream', sections = { 'retro_drop' }, rarity = 'legendary',
    --     icon = 'items/electric_dream.png',
    --     expiresAt = Config.RETRO_EXPIRES_AT, exclusive = true, metadata = { 'Seasonal', 'Retro 80s' },
    --     featured = true, featuredPriority = 3,
    --     description = '1,000 bags of the exclusive retro strain - gone when the drop ends.',
    --     showDailyPurchases = true,
    -- },
    {
        -- Ice Cream drop counterpart to Island Haze / Electric Dream. Keeps the
        -- `drug_` prefix so server.lua's canGiveDrugItem gate DOES fire for it.
        limited = true, label = 'Brick of Sandy Flakes', type = 'drugs', quantity = 1000, price = 550, spawn_code = 'drug_sandy_flakes', sections = { 'sandy_shores_drop' }, rarity = 'legendary',
        expiresAt = Config.ICECREAM_EXPIRES_AT, exclusive = true, metadata = { 'Seasonal', 'Ice Cream Drop' },
        featured = true, featuredPriority = 1,
        description = '1,000 bags of the exclusive beach strain - gone when the drop ends.',
        showDailyPurchases = true,
    },
    { label = 'Brick of LA Pressure', type = 'drugs', quantity = 1000, price = 500, spawn_code = 'la_pressure', showDailyPurchases = true },
    
    -- Blueprints weapons
    { label = "420 AR Blueprint",  spawn_code = "blueprint_anim420_ar", quantity = 1, price = 1000, type = "blueprints" },
    { label = "420 Pistol Blueprint",  spawn_code = "blueprint_anim420_pistol", quantity = 1, price = 1000, type = "blueprints" },
    
    -- Blueprints Attachments
    { label = "16x Sniper Scope Blueprint",  spawn_code = "blueprint_16x_snipe_scope", quantity = 1, price = 500, type = "blueprints" },
    { label = "X-Hamr Scope Blueprint",  spawn_code = "blueprint_xhamr_scope", quantity = 1, price = 500, type = "blueprints" },
    { label = "TAC ACOG Scope Blueprint",  spawn_code = "blueprint_tac_acog", quantity = 1, price = 500, type = "blueprints" },
    { label = "Short Barrel Blueprint",  spawn_code = "blueprint_short_barrel", quantity = 1, price = 500, type = "blueprints" },
    { label = "Side Grip Blueprint",  spawn_code = "blueprint_side_grip", quantity = 1, price = 500, type = "blueprints" },
    { label = "PMAX Angled Grip Blueprint",  spawn_code = "blueprint_pmax_angledgrip", quantity = 1, price = 500, type = "blueprints" },
    { label = "Pistol Laser MK2 Blueprint",  spawn_code = "blueprint_pstl_lazer", quantity = 1, price = 500, type = "blueprints" },
    { label = "Pistol Laser Blueprint",  spawn_code = "blueprint_pistol_lazer", quantity = 1, price = 500, type = "blueprints" },
    { label = "Long Barrel Blueprint",  spawn_code = "blueprint_long_barrel", quantity = 1, price = 500, type = "blueprints" },
    { label = "Laser Foregrip Blueprint",  spawn_code = "blueprint_laser_foregrip", quantity = 1, price = 500, type = "blueprints" },
    { label = "Lightbox Laser Blueprint",  spawn_code = "blueprint_lightbox_lazer", quantity = 1, price = 500, type = "blueprints" },
    { label = "Kobra Sight Blueprint",  spawn_code = "blueprint_kobra_scope", quantity = 1, price = 500, type = "blueprints" },
    { label = "Hybrid Scope Blueprint",  spawn_code = "blueprint_hybrid_scope", quantity = 1, price = 500, type = "blueprints" },
    { label = "KAC Grip Blueprint",  spawn_code = "blueprint_kac_grip", quantity = 1, price = 500, type = "blueprints" },
    { label = "Grip Pod Blueprint",  spawn_code = "blueprint_grippod_grip", quantity = 1, price = 500, type = "blueprints" },
    { label = "Holographic Sight Blueprint",  spawn_code = "blueprint_holo_scope", quantity = 1, price = 500, type = "blueprints" },

    -- UTILITY
    { label = 'T2 Armour', type = 'utility', quantity= 1, price = 100, spawn_code = 'armourt2' },
}

--[[
    FEATURED PACKAGES

    Every entry in Config.BUNDLES renders as an EQUAL panel in the store's bundle
    deck: same size, same treatment, side by side — adding a second bundle never
    visually demotes the first. Keep the list to 3 or fewer for the best layout;
    beyond that the deck scrolls horizontally with every panel at full size.

    Per-bundle fields:
      id            = 'summer_bundle'      -- stable id: daily "claimed today" stats + purchase routing.
                                           -- MUST be unique across bundles.
      label / description                  -- description doubles as the sell line
      price / normalPrice                  -- normalPrice drives the SAVE % flash + the value bar
      image         = 'summer_bundle.png'  -- product art, bare filename resolves inside html/
      background    = 'summer_background_banner.png'
                                           -- optional panel artwork behind every overlay.
                                           -- Source files live in web/public/ — a rebuild
                                           -- DELETES anything in html/ that isn't a build input.
      backgroundDim = 0.45                 -- 0-1 scrim strength over that artwork (default 0.45).
                                           -- Raise it for a bright banner, lower it for a dark one.
      accent        = '#FF7A1A'            -- optional; gives THIS panel its own identity color
                                           -- (omit to inherit the gender accent)
      titleTheme    = 'retro'              -- optional themed wordmark on a self-hosted display
                                           -- face, split over two lines with a gradient fill:
                                           --   'retro'  chrome Orbitron + hot pink Pacifico kicker
                                           --   'summer' molten Alfa Slab One, slight italic
                                           --   'neon'   Monoton tube lettering (cyan/pink)
                                           --   'bold'   heavy Bungee arcade block
                                           -- omit for the standard Rajdhani single line.
      titleTop      = 'Retro 80s'          -- optional; override the split. By default a trailing
      titleSub      = 'Bundle'             -- Bundle/Pack/Drop/Edition drops to the second line.
      badge         = 'LIMITED TIME'       -- pill above the name
      isNew         = true                 -- green BRAND NEW ribbon, top-left, AND floats this
                                           -- bundle to the front of the deck. Clear it off the
                                           -- old bundle when a newer drop takes over.
      newLabel      = 'JUST DROPPED'       -- optional override for the BRAND NEW text
      mostPopular   = true                 -- gold MOST POPULAR crown
      bestValue     = true                 -- cyan BEST VALUE crown
                                           -- give each bundle a DIFFERENT crown so no two
                                           -- panels wear the same one
      cta           = 'Claim Bundle'       -- button text
      expiresAt     = <unix seconds>       -- local countdown; server blocks expired claims
      perks         = { 'Instant Delivery' }
      showDailyPurchases / purchaseCountLabel / minimumCountToDisplay
      items         = { { label, shortLabel, spawn_code, quantity, icon }, ... }
                                           -- `icon` is optional and only needed for items whose
                                           -- artwork is not on the shared inventory CDN yet
                                           -- (e.g. 'items/retrowave_case.png', shipped in html/).
                                           -- Omit it and the tile uses the CDN icon for spawn_code.
]]
Config.BUNDLES = {
    {
        id = "sandy_shores_bundle", -- stable id for daily "claimed today" stats
        label = "Sandy Shores Bundle",
        description = "Everything the desert drop has to offer. Every crowbar tier, the exclusive strain, cash and diamonds - one package, one price.",
        price = 6800,
        normalPrice = 8950,
        image = "sandy_bundle.png",
        -- No `background` here on purpose: the product art is the only asset for
        -- this drop, so the panel keeps the plain treatment. Add a banner to
        -- web/public/ and set background + backgroundDim if one gets made.
        accent = "#F0A62A",
        titleTheme = "summer",
        badge = "LIMITED TIME",
        isNew = true, -- newest drop: BRAND NEW ribbon + shown first in the deck
        mostPopular = true,
        cta = "Claim Bundle",
        expiresAt = Config.ICECREAM_EXPIRES_AT,
        perks = { "Instant Delivery", "Exclusive Sandy Shores Items" },

        showDailyPurchases = true,
        purchaseCountLabel = "claimed today",

        -- shortLabel = what fits on the small reward tile; full label shows on hover
        -- No `icon` overrides: all four items are already on the shared inventory
        -- CDN, so the tiles resolve by spawn_code.
        items = {
            {
                label = "Steel Crowbar (5x)",
                shortLabel = "Steel Bar",
                spawn_code = "steel_crowbar",
                quantity = 5,
            },
            {
                label = "Hardened Crowbar (5x)",
                shortLabel = "Hardened Bar",
                spawn_code = "hardened_crowbar",
                quantity = 5,
            },
            {
                label = "Forged Crowbar (5x)",
                shortLabel = "Forged Bar",
                spawn_code = "forged_crowbar",
                quantity = 5,
            },
            {
                label = "Brick of Sandy Flakes",
                shortLabel = "Sandy Flakes",
                spawn_code = "drug_sandy_flakes",
                quantity = 1000,
            },
            {
                label = "$500,000 Cash",
                shortLabel = "$500K Cash",
                spawn_code = "money",
                quantity = 500000,
            },
            {
                label = "2,000 Diamonds",
                shortLabel = "2,000 Diamonds",
                spawn_code = "tbx_black_diamonds",
                quantity = 2000,
            },
        },
    },
}

-- Back-compat: anything still reading the old single-bundle field gets the first
-- entry. New code should read Config.BUNDLES.
Config.BUNDLE = Config.BUNDLES[1]

-- Optional featured rows shown above the grid on the All tab.
-- Tag items with sections = { '<key>' } to place them. Empty = feature off.
Config.SECTIONS = {
    -- The featured spotlight only renders INSIDE a category, so the All tab (the
    -- landing tab) would otherwise bury the new drop in the main grid. This row
    -- puts it above that grid. Items opt in via sections = { 'retro_drop' }.
    { key = "sandy_shores_drop", label = "🍦 Sandy Shores Drop" },
    { key = "retro_drop", label = "📼 Retro 80s Drop" },
    -- { key = "best_sellers", label = "🔥 Best Sellers" },
    -- { key = "new_arrivals", label = "🎉 New Arrivals" },
    -- { key = "limited_time", label = "⚡ Limited Time" },
}

-- Category options:
--   description         -> subtitle under "Browsing X"
--   promotionExpiresAt  -> compact countdown next to the heading (use the SHARED
--                          promo timestamp, e.g. Config.RETRO_EXPIRES_AT).
--                          Omit it and no timer renders at all.
--   featuredLabel/featuredSubtitle -> heading of the featured spotlight
--   hideFeaturedFromGrid -> featured items are removed from the grid below (default true)
Config.CATEGORIES = {
    {
        label = "All",
        icon = "bi bi-grid",
        type = "all",
        promotionExpiresAt = Config.ICECREAM_EXPIRES_AT,
    },
    {
        -- type = "bundles" renders ONLY the bundle deck (no product grid), with
        -- the panels given the full content area. Remove this entry and the deck
        -- still shows at the top of the All tab.
        label = "Bundles",
        icon = "bi bi-box-seam",
        type = "bundles",
        description = "Every package below is a full drop at a fraction of what the items cost on their own.",
        promotionExpiresAt = Config.ICECREAM_EXPIRES_AT,
    },
    {
        label = "Limited",
        icon = "bi bi-stars",
        type = "limited",
        promotionExpiresAt = Config.ICECREAM_EXPIRES_AT,
    },
    {
        label = "Weapons",
        icon = "fa-solid fa-gun",
        type = "weapon",
        promotionExpiresAt = Config.ICECREAM_EXPIRES_AT,
    },
    {
        label = "Drugs",
        icon = "fa-solid fa-cannabis",
        type = "drugs",
        description = "Bulk product, straight from the source. Move it before the season ends.",
        promotionExpiresAt = Config.ICECREAM_EXPIRES_AT,
        featuredLabel = "🍦 ICE CREAM DROP",
        featuredSubtitle = "Exclusive seasonal strains - gone when the drop ends.",
        hideFeaturedFromGrid = true,
    },
    -- {
    --     label = "Weapon Packs",
    --     icon = "bi bi-box-seam",
    --     type = "weapon_pack",
    -- },
    {
        label = "Cases",
        icon = "bi bi-briefcase",
        type = "case",
        description = "Crack one open - exclusive weapons, skins and rare rewards are waiting.",
        promotionExpiresAt = Config.ICECREAM_EXPIRES_AT,
        featuredLabel = "🔥 FEATURED CASES",
        featuredSubtitle = "Open a case for a chance to receive exclusive weapons, skins and rare rewards.",
        hideFeaturedFromGrid = true,
    },
    {
        label = "Ammo",
        icon = "mdi mdi-ammunition", -- NOT a Bootstrap icon: `bi-bullet` doesn't exist, MDI is loaded in index.html
        type = "ammo",
    },
    {
        label = "Blueprints",
        icon = "fa-solid fa-scroll",
        type = "blueprints",
    },
    {
        label = "Utility",
        icon = "bi bi-bag-fill",
        type = "utility",
    },
}

Config.DebugStorePurchases = false -- verbose purchase-flow logging with request ids

-- Cart / batch delivery for spammable items (mark items with cartable = true).
-- Clicks only build a client-side cart (zero server traffic); when the store
-- closes, ONE checkout validates the whole cart, removes the full gem total
-- once, then grants each product as a single stacked AddItem. No per-click
-- inventory spam.
Config.CART = {
    maxPerProduct = 50, -- per-product cap per session
    maxLines = 20,      -- distinct products per cart
}

Config.NOTIFICATIONS = {
    maxVisible = 3,   -- oldest dismisses first beyond this
    duration = 3000,  -- ms before auto-dismiss
}

local MARKET_ITEMS_NEW = {}

for idx, item in ipairs(Config.MARKET_ITEMS) do
    if not item.spawn_code or item.spawn_code == "" then
        print(("[donor_blackmarket] MARKET_ITEMS[%d] is missing spawn_code (label: %s)"):format(idx, tostring(item.label)))
    else
        MARKET_ITEMS_NEW[item.spawn_code] = true
    end
end

exports('fetchDonorItems', function()
    return MARKET_ITEMS_NEW
end)