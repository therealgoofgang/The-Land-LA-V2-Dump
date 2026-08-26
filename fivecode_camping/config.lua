Config = {}

--[[ Language ]]--
Config.Locale = 'en'   -- en, de, es, cs.

--[[ Framework ]]--
Config.Framework = {
    autoDetect = true,                  --  Automatically finds and sets supported framework on your server.
    type = 'esx',                       --  ESX = 'esx' / QBCore = 'qbcore'
    export = 'es_extended',             --  ESX = 'es_extended' / QBCore = 'qb-core'
}

--[[ Inventory ]]--
Config.Inventory = 'ox'        -- auto_detect   - Automatically finds and sets supported inventory on your server.
                                        -- ox            - https://github.com/overextended/ox_inventory.
                                        -- qb/qb-new     - https://github.com/qbcore-framework/qb-inventory.
                                        -- qs            - https://buy.quasar-store.com/package/4770732.
                                        -- ps            - https://github.com/Project-Sloth/ps-inventory.
                                        -- codem         - https://codem.tebex.io/package/5900973.
                                        -- core          - https://forum.cfx.re/t/core-inventory-qb-esx-advanced-grid-based-inventory/4859943.
                                        -- origen        - https://www.origennetwork.store/package/5881161.
                                        -- tgiann        - https://tgiann.tebex.io/package/6273000.

Config.Images = 'ox'           -- auto_detect   - Automatically finds and sets supported inventory images on your server.
                                        -- ox            - ox_inventory/web/images/.
                                        -- qb/qb-new     - qb-inventory/html/images/.
                                        -- qs            - qs-inventory/html/images/.
                                        -- ps            - ps-inventory/html/images/.
                                        -- codem         - codem-inventory/html/itemimages/.
                                        -- core          - core_inventory/html/img/.
                                        -- origen        - origen_inventory/html/images.
                                        -- tgiann        - tgiann-inventory/inventory_images/images/.

--[[ Menu ]]--
Config.Menu = 'ox'             -- auto_detect   - Automatically finds and sets supported menu on your server.
                                        -- ox            - https://overextended.github.io/docs.
                                        -- esx           - https://github.com/esx-framework/esx-legacy/tree/main/%5Besx%5D/esx_menu_default.
                                        -- qb            - https://github.com/qbcore-framework/qb-menu.

Config.DialogMenu = 'ox'       -- auto_detect   - Automatically finds and sets supported dialog menu on your server.
                                        -- ox            - https://overextended.github.io/docs.
                                        -- esx           - https://github.com/martintj22/esx_menu_dialog.
                                        -- qb            - https://github.com/qbcore-framework/qb-input.

--[[ Action Menu ]]--
Config.ActionMenu = 'ox'       -- auto_detect   - Automatically finds and sets supported action menu on your server.
                                        -- ox            - https://github.com/overextended/ox_target.
                                        -- qb            - https://github.com/qbcore-framework/qb-target.
                                        -- q             - https://github.com/thelindat/qtarget.
                                        -- helpox        - https://overextended.dev/ox_lib/Modules/Interface/Client/textui#libshowtextui.
                                        -- helpqb        - https://docs.qbcore.org/qbcore-documentation/qb-core/drawtext.
                                        -- helpesx       - https://esx-brasil.github.io/es_extended/client/functions/showhelpnotification.

--[[ ProgressBar ]]--
Config.ProgressBar = 'ox'      -- auto_detect   - Automatically finds and sets supported progressbar on your server. 
                                        -- none          - No ProgressBar.
                                        -- ox            - https://overextended.github.io/docs.
                                        -- qb            - https://github.com/qbcore-framework/progressbar.
                                        -- qs            - https://github.com/quasar-scripts/progressbar.
                                        -- progressBars  - https://forum.cfx.re/t/release-progress-bars-1-0-standalone/526287/4.

--[[ Notifications ]]--
Config.HelpNotify = 'ox'       -- auto_detect    - Automatically finds and sets supported help notify on your server. 
                                        -- esx            - https://esx-brasil.github.io/es_extended/client/functions/showhelpnotification/.
                                        -- ox             - https://overextended.dev/ox_lib/Modules/Interface/Client/textui#libshowtextui.
                                        -- qb             - https://docs.qbcore.org/qbcore-documentation/qb-core/drawtext.

Config.Notify = 'ox'           -- auto_detect, ox, esx, qb.
Config.NotifyType = {success = 'success', info = 'info', error = 'error'}
Config.Sounds = true

--[[ Logs ]]--
Config.TimeFormat = '%H:%M'   -- Time format used in discord logs - https://www.lua.org/pil/22.1.html.
Config.DiscordLogs = {
    Icon = 'https://imgur.com/OrnXItg.png',   -- Icon that will appear in discord logs.
    ServerName = 'Fivecode Scripts',          -- Name that will appear in discord logs.
    -- You can set discord webhooks in sv_utils.lua.
}

--[[ Main ]]--
Config.ObjectSpawnDistance = 85   -- The distance at which objects will spawn around each player.
Config.AdminMenuCommand = 'adminobjects'
Config.AdminGroups = {
    'gadmin',
    'sadmin',
    'ladmin',
    'developer',
    'management',
    'support',
    'moderator',
}
Config.BeerBarrelItems = {empty = 'emptybeercup', full = 'fullbeercup'}
Config.MaxPeopleInTent = 2
Config.MaxPeopleShowering = 1
Config.MaxPeopleCooking = 5
Config.Keys = {
    exit = 38,        -- [E] Exit chair and tent key.
    openStash = 58,   -- [G] Open stash.
    placingObject = {
        place = 38,      -- [E] Place object on the ground.
        exit = 348,      -- [SCROLLPRESS] Exit placing objects.
        rotateL = 181,   -- [SCROLLUP] Rotate position of the object to left side.
        rotateR = 180,   -- [SCROLLDOWN] Rotate position of the object to right side.
    }
}
Config.Stashes = {
    tent = {slots = 40, weight = 100000},
    cooler = {slots = 10, weight = 25000},
}
Config.Codelock = {
    use = true,          -- Enable this setting to allow locking and unlocking of tents and coolers.
    item = 'codelock',   -- The item required to lock or unlock, which will be added to or removed from the player's inventory.
}
Config.CampfireHealthRegeneration = {
    use = true,        -- Enable or disable the campfire health regeneration feature.
    maxHealth = 180,   -- The maximum health a player can regenerate to when using the campfire.
}
Config.UseBlacklistedZones = true
Config.BlacklistedZones = {
    {coords = vec3(446.92, -982.53, 30.68), radius = 50},   -- Mission Row Police Department.
    {coords = vec3(299.18, -584.84, 43.26), radius = 75},   -- Pillbox Hospital.
}
Config.UseLightItems = true       -- Enable this setting if you want players to use specific items to light the fire.
Config.LightItems = {
    {
        item = 'matches',        -- Item name.
        remove = true,           -- If true item will be removed from player inventory upon use.
        amount = 1,              -- Amount needed.
        changeOfBreaking = 10,   -- Chance your item will break - (100 = 100%).
    },
    {item = 'lighter', remove = false, amount = 1, changeOfBreaking = 0},
}
Config.DefaultObjects = {   -- Props for default objects.
	campfire = {on = 'fivecode_campfire', off = 'fivecode_campfire_onfire'},
	shower = {on = 'fivecode_showeron', off = 'fivecode_shower'},
	chair = 'prop_skid_chair_01',
	tent = 'prop_skid_tent_cloth',
	sleepingBag = 'prop_skid_sleepbag_1',
	cooler = 'v_ret_fh_coolbox',
	beerBarrel = 'fivecode_keg',
}

--[[ Campfire ]]--
Config.Campfire = {   -- Items displayed in the campfire cooking menu.
    {
        label = 'Raw Meat',   -- The name of the item as it appears in the menu.
        item = {
            rawIngredients = {   -- Items required to start cooking. These will be removed from the player's inventory.
                {item = 'rawmeat', label = 'Raw Meat', amount = 1},
            },
            cookedIngredients = {   -- Items received after cooking is complete. These will be added to the player's inventory.
                {item = 'cookedmeat', amount = 1},
            },
        },
        props = {raw = 'fivecode_rawmeat', cooked = 'fivecode_cookedmeat'},   -- Visual props displayed on the stick during cooking.
        cookTime = 25,                                                        -- Time it will take to cook this item [In seconds].
    },

    {
        label = 'Smores',
        item = {
            rawIngredients = {
                {item = 'smores', label = 'Packaged Smores', amount = 1},
            },
            cookedIngredients = {
                {item = 'cookedsmores', amount = 1},
            },
        },
        props = {raw = 'fivecode_smores', cooked = 'fivecode_cookedsmores'},
        cookTime = 5,
    },
}

--[[ Npc Shop ]]--
Config.NpcShop = {
    {
        use = true,   -- If false this npc will be disabled.
        payment = {cash = true, bank = true},
        coords = vec4(-679.33, 5834.14, 17.31, 133.22),   -- Position of the npc.
        npc = {
            ped = 'cs_hunter',                  -- Npc model - https://docs.fivem.net/docs/game-references/ped-models/.
            anim = 'WORLD_HUMAN_GUARD_STAND',   -- Npc animation - https://github.com/Santagain/gtav-scenarios.
        },
        blip = {
            use = true,   -- If false this blip for this npc wont be disabled.
            info = {id = 141, color = 56, size = 0.8},
            title = 'Camping Shop',
        },
        target = {
            label = 'Open Shop',
            icon = 'fas fa-hand',   -- Target icon - https://fontawesome.com/icons.
        },
    },
}

Config.ShopItems = {
    {item = 'campfire', label = 'Campfire', icon = 'campfire.png', price = 20},
    {item = 'campingchair', label = 'Camping Char', icon = 'campingchair.png', price = 50},
    {item = 'campingtent', label = 'Camping Tent', icon = 'campingtent.png', price = 125},
    {item = 'campingsleepingbag', label = 'Sleeping Bag', icon = 'campingsleepingbag.png', price = 75},
    {item = 'campingshower', label = 'Camping Shower', icon = 'campingshower.png', price = 250},
    {item = 'campingcooler', label = 'Camping Cooler', icon = 'campingcooler.png', price = 20},
    {item = 'campingbeerbarrel', label = 'Beer Barrel', icon = 'campingbeerbarrel.png', price = 50},
    {item = 'lighter', label = 'Lighter', icon = 'lighter.png', price = 10},
    {item = 'matches', label = 'Matches', icon = 'matches.png', price = 5},
    {item = 'emptybeercup', label = 'Beer Cup', icon = 'emptybeercup.png', price = 2},
    {item = 'codelock', label = 'Codelock', icon = 'codelock.png', price = 25},
    -- You can add any item in this shop.
}

--[[ Custom Objects ]]--
Config.CustomObjects = {
    {
        label = 'Example Item',
        item = 'exampleitem',
        prop = 'exampleprop',
        target = 'Interact with this example object',
        distance = 2.5,
        offset = 0.50,
        menu = {
            {
                title = 'Test Label',
                description = 'Test Text',
                icon = 'fas fa-circle-dot',
                event = 'fivecode_camping:testtest',
            },
            {
                title = 'Test Label 2',
                description = 'Test Text 2',
                icon = 'fas fa-circle-dot',
                event = 'fivecode_camping:testEvent2'
            },
        },
    },
}