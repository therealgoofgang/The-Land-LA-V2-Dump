--[[
    Shared recipe list for the custom crafting system.

    ORDER MATTERS. The client sends ONLY the 1-based index to the server.
    The server resolves items/counts/result from this table server-side, so
    a tampered client cannot forge recipes.

    To add a recipe: APPEND to the end. Never reorder existing entries.
]]

Recipes = {
    -- [1] Common
    {
        id      = 'bubu_minion',
        name    = 'BuBu Minion',
        rarity  = 'common',
        result  = { item = 'bubu_minion', count = 1 },
        ingredients = {
            { item = 'wood',          count = 2 },
            { item = 'cloth',         count = 2 },
            { item = 'string',        count = 2 },
            { item = 'basic_essence', count = 1 },
        },
    },
    -- [2] Uncommon
    {
        id      = 'bubu_sentinel',
        name    = 'BuBu Sentinel',
        rarity  = 'uncommon',
        result  = { item = 'bubu_sentinel', count = 1 },
        ingredients = {
            { item = 'steel_plate',      count = 2 },
            { item = 'sentinel_essence', count = 2 },
            { item = 'glass_lens',       count = 1 },
            { item = 'basic_essence',    count = 1 },
        },
    },
    -- [3] Rare
    {
        id      = 'bubu_warrior',
        name    = 'BuBu Warrior',
        rarity  = 'rare',
        result  = { item = 'bubu_warrior', count = 1 },
        ingredients = {
            { item = 'iron_bar',         count = 3 },
            { item = 'warrior_essence',  count = 2 },
            { item = 'leather',          count = 2 },
            { item = 'basic_essence',    count = 1 },
        },
    },
    -- [4] Epic
    {
        id      = 'bubu_destroyer',
        name    = 'BuBu Destroyer',
        rarity  = 'epic',
        result  = { item = 'bubu_destroyer', count = 1 },
        ingredients = {
            { item = 'steel_bar',       count = 3 },
            { item = 'destroyer_core',  count = 1 },
            { item = 'gold_bar',        count = 2 },
            { item = 'fire_essence',    count = 1 },
        },
    },
    -- [5] Legendary
    {
        id      = 'bubu_monster',
        name    = 'BuBu The Monster',
        rarity  = 'legendary',
        result  = { item = 'bubu_monster', count = 1 },
        ingredients = {
            { item = 'wood',             count = 5 },
            { item = 'monster_essence',  count = 1 },
            { item = 'diamond',          count = 1 },
            { item = 'shield_fragment',  count = 2 },
        },
    },
    -- [6] Mythic
    {
        id      = 'bubu_legend',
        name    = 'BuBu Legend',
        rarity  = 'mythic',
        result  = { item = 'bubu_legend', count = 1 },
        ingredients = {
            { item = 'legendary_core',   count = 1 },
            { item = 'mythic_crystal',   count = 1 },
            { item = 'celestial_dust',   count = 2 },
            { item = 'legend_essence',   count = 1 },
        },
    },
    -- [7-14] Remix Rares
    {
        id = 'bubu_valentines', name = 'Valentines BuBu', rarity = 'rare',
        result = { item = 'bubu_valentines', count = 1 },
        ingredients = {
            { item = 'wood', count = 2 }, { item = 'cloth', count = 2 }, { item = 'basic_essence', count = 1 },
        },
    },
    {
        id = 'bubu_baby_pink', name = 'Baby Pink BuBu', rarity = 'rare',
        result = { item = 'bubu_baby_pink', count = 1 },
        ingredients = {
            { item = 'wood', count = 2 }, { item = 'cloth', count = 2 }, { item = 'basic_essence', count = 1 },
        },
    },
    {
        id = 'bubu_red', name = 'Red BuBu', rarity = 'rare',
        result = { item = 'bubu_red', count = 1 },
        ingredients = {
            { item = 'wood', count = 2 }, { item = 'cloth', count = 2 }, { item = 'basic_essence', count = 1 },
        },
    },
    {
        id = 'bubu_baby_blue', name = 'Baby Blue BuBu', rarity = 'rare',
        result = { item = 'bubu_baby_blue', count = 1 },
        ingredients = {
            { item = 'wood', count = 2 }, { item = 'cloth', count = 2 }, { item = 'basic_essence', count = 1 },
        },
    },
    {
        id = 'bubu_yellow', name = 'Yellow BuBu', rarity = 'rare',
        result = { item = 'bubu_yellow', count = 1 },
        ingredients = {
            { item = 'wood', count = 2 }, { item = 'cloth', count = 2 }, { item = 'basic_essence', count = 1 },
        },
    },
    {
        id = 'bubu_lavender', name = 'Lavender BuBu', rarity = 'rare',
        result = { item = 'bubu_lavender', count = 1 },
        ingredients = {
            { item = 'iron_bar', count = 2 }, { item = 'basic_essence', count = 2 }, { item = 'string', count = 2 },
        },
    },
    {
        id = 'bubu_lemonade', name = 'Lemonade BuBu', rarity = 'rare',
        result = { item = 'bubu_lemonade', count = 1 },
        ingredients = {
            { item = 'wood', count = 2 }, { item = 'cloth', count = 2 }, { item = 'basic_essence', count = 1 },
        },
    },
    {
        id = 'bubu_tie_dye', name = 'Tie Dye BuBu', rarity = 'rare',
        result = { item = 'bubu_tie_dye', count = 1 },
        ingredients = {
            { item = 'iron_bar', count = 2 }, { item = 'basic_essence', count = 2 }, { item = 'string', count = 2 },
        },
    },
}

-- Max distance from the crafting table the server will accept a craft from
RECIPE_MAX_TABLE_DISTANCE = 3.5

-- Server-side cooldown per player between crafts (ms) — prevents packet spam
RECIPE_SERVER_COOLDOWN_MS = 4000
