---@author Theo 
---@version 1.0.9
---@github https://github.com/xodashy

---@type table
Config = {}

---@type string Path to image folder for ox_inventory
Config.Images = "https://cdn2.nullnetwork.ca/2adc0505f31cd560/inventory"

---@type boolean Discord role restriction for shop access (if set to true set bot token etc in server/discord.lua)
Config.UseDiscordShopRestriction = true

---@type string Command name for starting bubu delivery
Config.DeliveryCommand = "bubudeliver"

---@type string Command name to stop bubu delivery
Config.DeliveryCancelCommand = "stopbubudeliver"

---@type table Amount of BuBu items to sell per delivery (range format)
Config.DeliveryAmount = { min = 1, max = 3 }

---@type string Command name to start bubu sales to NPCs
Config.SellCommand = "sellbubu"

---@type string Command name to stop bub sales to NPCs
Config.SellCancelCommand = "stopsellbubu"

---@type table Amount of Bubu items to sell per NPC sales
Config.SellAmount = { min = 1, max = 2 }

---@type boolean Enable XP gains (requires abstract_levelsystem)
Config.XPGain = false

---@type number XP amount granted on successful sales/deliveries
Config.XPGainAmount = 50


---@type table Delivery locations for the delivery system
Config.Delivery = {
    Locations = {
        vector3(224.11, 513.52, 140.92),
        vector3(57.51, 449.71, 147.03),
        vector3(-297.81, 379.83, 112.1),
        vector3(-595.78, 393.0, 101.88),
        vector3(-842.68, 466.85, 87.6),
        vector3(-1367.36, 610.73, 133.88),
        vector3(944.44, -463.19, 61.55),
        vector3(970.42, -502.5, 62.14),
        vector3(1099.5, -438.65, 67.79),
        vector3(1229.6, -725.41, 60.96),
        vector3(288.05, -1094.98, 29.42),
        vector3(-32.35, -1446.46, 31.89),
        vector3(-34.29, -1847.21, 26.19),
        vector3(130.59, -1853.27, 25.23),
        vector3(192.2, -1883.3, 25.06),
        vector3(348.64, -1820.87, 28.89),
        vector3(427.28, -1842.14, 28.46),
        vector3(291.48, -1980.15, 21.6),
        vector3(279.87, -2043.67, 19.77),
        vector3(1297.25, -1618.04, 54.58),
        vector3(1381.98, -1544.75, 57.11),
        vector3(1245.4, -1626.85, 53.28),
        vector3(315.09, -128.31, 69.98),
    }
}

---@type table BuBu figure configurations
Config.Bubu = {
    -- Legendary BuBu Monster
    theo_labu1 = {
        item = "bubu_monster",
        rarity = "legendary",
        name = "BuBu THE MONSTER",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 3600, max = 4400 },
        salesPrice = { min = 3000, max = 4000 },
        color = { r = 242, g = 204, b = 100, a = 0.5 },
        ringColor = { r = 242, g = 204, b = 100, a = 1.0 }
    },
    -- Epic BuBu Destroyer
    theo_labu2 = {
        item = "bubu_destroyer",
        rarity = "epic",
        name = "BuBu DESTROYER",
        chance = 0.04, -- 4% drop chance
        deliveryPrice = { min = 2600, max = 3400 },
        salesPrice = { min = 2000, max = 3000 },
        color = { r = 100, g = 150, b = 255, a = 0.5 },
        ringColor = { r = 100, g = 150, b = 255, a = 1.0 }
    },
    -- Rare BuBu Warrior
    theo_labu3 = {
        item = "bubu_warrior",
        rarity = "rare",
        name = "BuBu WARRIOR",
        chance = 0.10, -- 10% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 150, g = 100, b = 255,  a = 0.5 },
        ringColor = { r = 150, g = 100, b = 255, a = 1.0 }
    },
    -- Common BuBu Minion
    theo_labu4 = {
        item = "bubu_minion",
        rarity = "common",
        name = "BuBu MINION",
        chance = 0.60, -- 60% drop chance
        deliveryPrice = { min = 450, max = 750 },
        salesPrice = { min = 350, max = 600 },
        color = { r = 100, g = 255, b = 100, a = 0.5 },
        ringColor = { r = 100, g = 255, b = 100, a = 1.0 }
    },
    -- Uncommon BuBu Sentinel
    theo_labu5 = {
        item = "bubu_sentinel",
        rarity = "uncommon",
        name = "BuBu SENTINEL",
        chance = 0.20, -- 20% drop chance
        deliveryPrice = { min = 900, max = 1500 },
        salesPrice = { min = 700, max = 1200 },
        color = { r = 200, g = 200, b = 200, a = 0.5 },
        ringColor = { r = 200, g = 200, b = 200, a = 1.0 }
    },
    -- Mythic BuBu Legend
    theo_labu6 = {
        item = "bubu_legend",
        rarity = "mythic",
        name = "BuBu LEGEND",
        chance = 0.05, -- 5% drop chance
        deliveryPrice = { min = 5400, max = 6600 },
        salesPrice = { min = 4000, max = 5600 },
        color = { r = 255, g = 100, b = 255, a = 0.5 },
        ringColor = { r = 255, g = 100, b = 255, a = 1.0 }
    },
    -- Rare BuBu Valentines
    theo_remixlabu1 = {
        item = "bubu_valentines",
        rarity = "rare",
        name = "Valentines Bubu",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 255, g = 100, b = 100, a = 0.5 },
        ringColor = { r = 255, g = 100, b = 100, a = 1.0 }
    },
    -- Rare BuBu Baby Pink
    theo_remixlabu2 = {
        item = "bubu_baby_pink",
        rarity = "rare",
        name = "Baby Pink Bubu",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 255, g = 150, b = 200, a = 0.5 },
        ringColor = { r = 255, g = 150, b = 200, a = 1.0 }
    },
    -- Rare BuBu Red
    theo_remixlabu3 = {
        item = "bubu_red",
        rarity = "rare",
        name = "Red Bubu",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 255, g = 50, b = 50, a = 0.5 },
        ringColor = { r = 255, g = 50, b = 50, a = 1.0 }
    },
    -- Rare BuBu Baby Blue
    theo_remixlabu4 = {
        item = "bubu_baby_blue",
        rarity = "rare",
        name = "Baby Blue Bubu",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 100, g = 150, b = 255, a = 0.5 },
        ringColor = { r = 100, g = 150, b = 255, a = 1.0 }
    },
    -- Rare BuBu Yellow
    theo_remixlabu5 = {
        item = "bubu_yellow",
        rarity = "rare",
        name = "Yellow Bubu",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 255, g = 255, b = 100, a = 0.5 },
        ringColor = { r = 255, g = 255, b = 100, a = 1.0 }
    },
    -- Rare BuBu Lavender
    theo_remixlabu6 = {
        item = "bubu_lavender",
        rarity = "rare",
        name = "Lavender Bubu",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 180, g = 100, b = 255, a = 0.5 },
        ringColor = { r = 180, g = 100, b = 255, a = 1.0 }
    },
    -- Rare BuBu Lemonade
    theo_remixlabu7 = {
        item = "bubu_lemonade",
        rarity = "rare",
        name = "Lemonade Bubu",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 255, g = 255, b = 150, a = 0.5 },
        ringColor = { r = 255, g = 255, b = 150, a = 1.0 }
    },
    -- Rare BuBu Tie Dye
    theo_remixlabu8 = {
        item = "bubu_tie_dye",
        rarity = "rare",
        name = "Tie Dye Bubu",
        chance = 0.01, -- 1% drop chance
        deliveryPrice = { min = 1600, max = 2400 },
        salesPrice = { min = 1200, max = 2000 },
        color = { r = 150, g = 100, b = 255, a = 0.5 },
        ringColor = { r = 150, g = 100, b = 255, a = 1.0 }
    }
}

---@type string Default monster model for spawning
Config.DefaultMonster = "theo_labu1"

---@type string Table item and model configuration
Config.TableItem = "table"
---@type string Table model name dont change this
Config.TableModel = "theo_lubudesk"

---@type table Quantity range of labubus that can be crafted at a time 
Config.CraftQuantity = { min = 1, max = 3 }

---@type table Crafting recipes for BuBu figures
Config.BubuRecipes = {
    -- Recipe for crafting BuBu Monster
    bubu_monster = {
        result = "bubu_monster",
        ingredients = {
            { item = "wood", count = 5 },
            { item = "monster_essence", count = 1 },
            { item = "diamond", count = 1 },
            { item = "shield_fragment", count = 2 }
        }
    },
    -- Recipe for crafting BuBu Destroyer
    bubu_destroyer = {
        result = "bubu_destroyer",
        ingredients = {
            { item = "steel_bar", count = 3 },
            { item = "destroyer_core", count = 1 },
            { item = "gold_bar", count = 2 },
            { item = "fire_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Warrior
    bubu_warrior = {
        result = "bubu_warrior",
        ingredients = {
            { item = "iron_bar", count = 3 },
            { item = "warrior_essence", count = 2 },
            { item = "leather", count = 2 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Sentinel
    bubu_sentinel = {
        result = "bubu_sentinel",
        ingredients = {
            { item = "steel_plate", count = 2 },
            { item = "sentinel_essence", count = 2 },
            { item = "glass_lens", count = 1 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Minion
    bubu_minion = {
        result = "bubu_minion",
        ingredients = {
            { item = "wood", count = 2 },
            { item = "cloth", count = 2 },
            { item = "string", count = 2 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Legend
    bubu_legend = {
        result = "bubu_legend",
        ingredients = {
            { item = "legendary_core", count = 1 },
            { item = "mythic_crystal", count = 1 },
            { item = "celestial_dust", count = 2 },
            { item = "legend_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Valentines
    bubu_valentines = {
        result = "bubu_valentines",
        ingredients = {
            { item = "wood", count = 2 },
            { item = "cloth", count = 2 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Baby Pink
    bubu_baby_pink = {
        result = "bubu_baby_pink",
        ingredients = {
            { item = "wood", count = 2 },
            { item = "cloth", count = 2 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Red
    bubu_red = {
        result = "bubu_red",
        ingredients = {
            { item = "wood", count = 2 },
            { item = "cloth", count = 2 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Baby Blue
    bubu_baby_blue = {
        result = "bubu_baby_blue",
        ingredients = {
            { item = "wood", count = 2 },
            { item = "cloth", count = 2 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Yellow
    bubu_yellow = {
        result = "bubu_yellow",
        ingredients = {
            { item = "wood", count = 2 },
            { item = "cloth", count = 2 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Lavender
    bubu_lavender = {
        result = "bubu_lavender",
        ingredients = {
            { item = "iron_bar", count = 2 },
            { item = "basic_essence", count = 2 },
            { item = "string", count = 2 }
        }
    },
    -- Recipe for crafting BuBu Lemonade
    bubu_lemonade = {
        result = "bubu_lemonade",
        ingredients = {
            { item = "wood", count = 2 },
            { item = "cloth", count = 2 },
            { item = "basic_essence", count = 1 }
        }
    },
    -- Recipe for crafting BuBu Tie Dye
    bubu_tie_dye = {
        result = "bubu_tie_dye",
        ingredients = {
            { item = "iron_bar", count = 2 },
            { item = "basic_essence", count = 2 },
            { item = "string", count = 2 }
        }
    }
}