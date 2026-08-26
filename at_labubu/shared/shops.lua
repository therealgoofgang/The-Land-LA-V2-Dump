Config.Stores = {
    {
        label = "BuBu Supply Store",
        enabled = true,
        blip = {
            enabled = true,
            sprite = 106,
            color = 8,
            scale = 0.6,
            display = 4
        },
        ped = {
            coords = vec4(-1520.7458, 841.2020, 180.6988, 202.0118),
            model = 'A_F_Y_SouCent_02',
            scenario = 'WORLD_HUMAN_CLIPBOARD'
        },
        categories = {
            ["Basic Materials"] = {
                { item = 'table', label = 'Bubu Craft Table', price = 50 },
                { item = 'wood', label = 'Wood', price = 25 },
                { item = 'cloth', label = 'Cloth', price = 15 },
                { item = 'string', label = 'String', price = 5 },
                { item = 'leather', label = 'Leather', price = 35 },
            },
            ["Metal Materials"] = {
                { item = 'copper_bar', label = 'Copper Bar', price = 45 },
                { item = 'iron_bar', label = 'Iron Bar', price = 60 },
                { item = 'steel_bar', label = 'Steel Bar', price = 80 },
                { item = 'steel_plate', label = 'Steel Plate', price = 120 },
                { item = 'gold_bar', label = 'Gold Bar', price = 200 },
            },
            ["Magical Essences"] = {
                { item = 'basic_essence', label = 'Basic Essence', price = 30 },
                { item = 'warrior_essence', label = 'Warrior Essence', price = 75 },
                { item = 'sentinel_essence', label = 'Sentinel Essence', price = 75 },
                { item = 'fire_essence', label = 'Fire Essence', price = 100 },
                { item = 'monster_essence', label = 'Monster Essence', price = 150 },
                { item = 'legend_essence', label = 'Legend Essence', price = 200 },
            },
            ["Special Materials"] = {
                { item = 'destroyer_core', label = 'Destroyer Core', price = 300 },
                { item = 'legendary_core', label = 'Legendary Core', price = 500 },
                { item = 'divine_core', label = 'Divine Core', price = 500 },
                { item = 'diamond', label = 'Diamond', price = 400 },
                { item = 'mythic_crystal', label = 'Mythic Crystal', price = 350 },
                { item = 'celestial_dust', label = 'Celestial Dust', price = 250 },
                { item = 'shield_fragment', label = 'Shield Fragment', price = 100 },
                { item = 'glass_lens', label = 'Glass Lens', price = 50 },
            },
        }
    },
}