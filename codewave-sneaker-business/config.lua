--- ######################### ---
--- ## DISCORD.GG/CODEWAVE ## ---
--- ######################### ---


--- ### SNEAKER BUSINESSES ### ---

Config = {}
Config.Framework = 'ESX' -- 'ESX' or 'QBCore' (case sensitive)
Config.InteractionType = 'ox_target' -- ox_target | 3dtext
Config.UseOxTargetForNpc = true -- Set to true to enable ox_target, false to use key press interaction
Config.TimeToCraft = 8000
Config.DebugMode = false  -- Set to true to enable debug messages

Config.ShoeBoxPropName = "v_ind_cs_box02" -- Some people may need to change this

-- ONLY FOR NPC SALES.
Config.MinItemsToSell = 1 
Config.MaxItemsToSell = 3
-- Change the commands if you wish
Config.StopSellingCommand = 'stopsellingshoes'
Config.StartSellingCommand = 'sellshoes'


Config.OnlyMales = true  -- Enable or disable the restriction to only allow male peds
Config.MalePedModels = {
    GetHashKey("mp_m_freemode_01"),  -- Male freemode character
    GetHashKey("some_other_male_ped_model")  -- Add other male ped models here
}

Config.NPC = {
    Model = "a_m_m_soucent_03", -- Change to your desired NPC model
    Coords = vector3(-708.3807, -152.8190, 36.4151), -- Change to your desired NPC spawn location
    Heading = 53.8844, -- Adjust the heading as needed
    BlipEnabled = true,  -- New option to enable/disable blip
    BlipSprite = 58,        -- Example blip icon, see https://wiki.rage.mp/index.php?title=Blips for blip IDs
    BlipScale = 0.6,
    BlipColour = 67,
    BlipName = "Sole Street"
}

-- Add anything you want here (For example if you want a new required item you can add it here for them to purchase!)
Config.Items = {
    { name = "Assortment Of leather materials", id = "leather_materials", img = "image/leather_materials.png", price = 100 }, -- You don't really need too touch anything apart from PRICE
    { name = "Shoe foam", id = "shoe_foam", img = "image/shoe_foam.png", price = 100 },
    { name = "Cloth Materials", id = "clothe_materials", img = "image/cloth_materials.png", price = 100 },
    { name = "Work Station", id = "work_station", img = "image/work_station.png", price = 1000 },
    { name = "Work Phone", id = "shoe_phone", img = "image/shoe_phone.png", price = 3000 }
}



--- These are all fictional names of shoes to stay in line with FIVEM TOS, Change them to whatever you wish!
Config.CraftingRecipes = {
    { name = "Sky Gliders Plus", id = "sky_gliders_plus", img = "image/sky_gliders_plus.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 2 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Breeze Bangs", id = "breeze_bangs", img = "image/breeze_bangs.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Tiger Mediums", id = "tiger_mediums", img = "image/tiger_mediums.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Galaxy X", id = "galaxy_x", img = "image/galaxy_x.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 2 }, { id = "clothe_materials", quantity = 2 } } },
    { name = "Sky Walkers", id = "sky_walkers", img = "image/sky_walkers.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Sky Pilots", id = "sky_pilots", img = "image/sky_pilots.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Sky Flyers", id = "sky_flyers", img = "image/sky_flyers.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Sky Gliders", id = "sky_gliders", img = "image/sky_gliders.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Fast Runners", id = "fastrunner_2000", img = "image/fastrunner_2000.png", requiredItems = { { id = "shoe_foam", quantity = 2 }, { id = "shoe_foam", quantity = 2 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Speedster 300", id = "speedster_300", img = "image/speedster_300.png", requiredItems = { { id = "leather_materials", quantity = 2 }, { id = "shoe_foam", quantity = 1 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Runner Prime", id = "runner_prime", img = "image/runner_prime.png", requiredItems = { { id = "leather_materials", quantity = 2 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 2 } } },
    { name = "Breeze 95s", id = "breeze_95s", img = "image/breeze_95s.png", requiredItems = { { id = "leather_materials", quantity = 3 }, { id = "shoe_foam", quantity = 2 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Breeze 100s", id = "breeze_100s", img = "image/breeze_100s.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 2 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Breeze 90s", id = "breeze_90s", img = "image/breeze_90s.png", requiredItems = { { id = "leather_materials", quantity = 2 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 1 } } },
    { name = "Sky Walkers Red", id = "sky_walkers_red", img = "image/sky_walkers_red.png", requiredItems = { { id = "leather_materials", quantity = 1 }, { id = "shoe_foam", quantity = 3 }, { id = "clothe_materials", quantity = 2 } } },
    { name = "Shadow yellows", id = "shadow_yellows", img = "image/shadow_yellows.png", requiredItems = { { id = "leather_materials", quantity = 2 }, { id = "shoe_foam", quantity = 2 }, { id = "clothe_materials", quantity = 1 } } },
    -- Add more shoes if needed
}

Config.PlayMusicWhileUIIsOpen = false --- True = music plays, False = music doesn't. (YOU CAN CHANGE MUSIC IN SOUNDS FILE)
Config.MusicVolume = 0.05 --- Music volume in the menu, Only applies if above is set to True


Config.ShoeTableItem = 'work_station' --- The table item
Config.PropItemName = 'prop_table_03' -- You can change this if you want (to basically any prop, make it make sense though!)

Config.RequiredItems = {
    { item = 'sky_gliders_plus', priceMin = 580, priceMax = 720 },
    { item = 'breeze_bangs', priceMin = 580, priceMax = 720 },
    { item = 'tiger_mediums', priceMin = 580, priceMax = 720 },
    { item = 'galaxy_x', priceMin = 580, priceMax = 720 },
    { item = 'sky_walkers', priceMin = 580, priceMax = 720 },
    { item = 'sky_pilots', priceMin = 580, priceMax = 720 },
    { item = 'sky_flyers', priceMin = 580, priceMax = 720 },
    { item = 'sky_gliders', priceMin = 580, priceMax = 720 },
    { item = 'fastrunner_2000', priceMin = 580, priceMax = 720 },
    { item = 'speedster_300', priceMin = 580, priceMax = 720 },
    { item = 'runner_prime', priceMin = 580, priceMax = 720 },
    { item = 'breeze_95s', priceMin = 580, priceMax = 720 },
    { item = 'breeze_100s', priceMin = 580, priceMax = 720 },
    { item = 'breeze_90s', priceMin = 580, priceMax = 720 },
    { item = 'sky_walkers_red', priceMin = 580, priceMax = 720 },
    { item = 'shadow_yellows', priceMin = 580, priceMax = 720 }
}


--- ### DISCORD.GG/CODEWAVE ### ---

-- ### Remember to remove your shoe slots from your clothing menu (if you want too anyway)
-- ### first value for exmaple "breeze_bangs" is the item name, don't change COMPONENT ID (this is the shie)
-- ### drawableID is the slot of the shoe, texture id is the texture of the shoe
Config.SneakersSlots = {
    breeze_bangs = {componentId = 6, drawableId = 234, textureId = 0},
    sky_gliders_plus = {componentId = 6, drawableId = 254, textureId = 0},
    tiger_mediums = {componentId = 6, drawableId = 224, textureId = 0},
    galaxy_x = {componentId = 6, drawableId = 250, textureId = 0},
    sky_walkers = {componentId = 6, drawableId = 261, textureId = 0},
    sky_pilots = {componentId = 6, drawableId = 271, textureId = 0},
    sky_flyers = {componentId = 6, drawableId = 270, textureId = 0},
    sky_gliders = {componentId = 6, drawableId = 260, textureId = 0},
    fastrunner_2000 = {componentId = 6, drawableId = 50, textureId = 0},
    speedster_300 = {componentId = 6, drawableId = 35, textureId = 0},
    breeze_100s = {componentId = 6, drawableId = 100, textureId = 0},
    breeze_90s = {componentId = 6, drawableId = 200, textureId = 0},
    sky_walkers_red = {componentId = 6, drawableId = 211, textureId = 0},
    shadow_yellows = {componentId = 6, drawableId = 199, textureId = 0},

}

-- Default drawable ID when the shoe is removed, You may need to change this to your own slot number
Config.sneakerdrawableids = {
    [6] = 34, -- 34 is the slot that will be given to the player if they have NO shoes item
}
