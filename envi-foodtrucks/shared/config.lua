Config = {}

Config.Debug = true

-- New Failsafe Command to clear all props attached to the nearest food truck (locked behind job check)
Config.ClearGrillCommand = 'clearGrill'

-- New Export to clear all props attached to the nearby food truck (no job check)
-- example: exports['envi-foodtrucks']:ClearNearbyGrill()

Config.RealisticMode = false -- If false, the ingredients storage will be a shop where you can buy all needed ingredients
    -- If true, the ingredients storage will only be a storage and ingredients would come from elsewhere in your server!

Config.TargetDistance = 1.5   -- NOTE: QB-TARGET USERS: - set this to 1.5 to avoid conflicts with other interactions

Config.FoodTrucks = {
    [`voodoofoodtruck`] = {
        [0] = {  -- NEW -- ADDED SUPPORT FOR DIFFERENT LIVERIES PER FOOD TRUCK - LIVERY NUMBER GOES HERE
            ['label'] = 'Wig Wam Truck',
            ---
            ['society'] = {        ---------------- NEWLY ADDED IN 1.0.5 !!!!
                name = 'wigwam',
                payToSociety = true, -- if true, money from the order will go to the society account, if false, money will be given to the cashier who made the order
            },
            ---
            ['fridgeShop'] = {
                ['label'] = 'Wig Wam Truck Fridge',
                ['items'] = {
                    {
                        name = 'cup_cola',
                        price = 5,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'cutted_potato',
                        price = 2,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'cutted_tomato',
                        price = 2,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'cutted_onion',
                        price = 2,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'cheddar',
                        price = 2,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'cutted_lettuce',
                        price = 2,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'burgerbun',
                        price = 1,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'raw_bacon',
                        price = 3,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'raw_burgerpatty',
                        price = 3,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'burgerpatty',
                        price = 5,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'bacon',
                        price = 4,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'cup_cola',
                        price = 6,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'raw_wings',
                        price = 4,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'raw_sausages',
                        price = 3,
                        count = 999999999,
                        metadata = {},
                    },
                    {
                        name = 'raw_beef_brisket',
                        price = 5,
                        count = 999999999,
                        metadata = {},
                    },
                },
                ['groups'] = { -- Job / Gang Compatibility
                    wigwam = 0,
                    --ambulance = 0
                },
            },
            ['storage'] = {
                ['label'] = 'Storage',
                ['groups'] = { -- Job / Gang Compatibility
                    wigwam = 0,
                    --ambulance = 0
                },
            },
            ['cashRegister'] = {
                ['label'] = 'Cash Register',
                ['groups'] = { -- Job / Gang Compatibility
                    wigwam = 0,
                    --ambulance = 0
                },
            },
            ['cooking'] = {
                ['groups'] = { -- Job / Gang Compatibility
                    wigwam = 0,
                    --ambulance = 0
                },
                ['dishes'] = {  -- NEW IN 1.2.0 -- ADD ALL DISHES HERE (CRAFTABLES AND COOKABLES)
                    'fries',
                    'wam_glizzy_dog',
                    'ultimate_wings',
                    'buffalo_wing_combo',
                    'wam_burger_combo',
                    'italian_beef_combo',
                    'cooked_bbq_wings',
                    'cooked_bbq_sausages',
                    'ultra_wam',
                    'wam_blast',
                }
            },
            ['shop'] = {  -- disabled when RealisticMode is true
                ['label'] = 'Ingredients Shop',
                ['items'] = {
                    {
                        name = 'cutted_potato',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_burgerpatty',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_bacon',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'burgerbun',
                        price = 1,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_lettuce',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cheddar',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_tomato',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_onion',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_wings',
                        price = 4,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_sausages',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_beef_brisket',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                },
                ['groups'] = { -- Job / Gang Compatibility
                    wigwam = 0,
                    --ambulance = 0
                },
            },
        },
        [1] = {  -- NEW -- ADDED SUPPORT FOR DIFFERENT LIVERIES PER FOOD TRUCK - LIVERY NUMBER GOES HERE
            ['label'] = 'Skillet and Soul Truck',
            ---
            ['society'] = {        ---------------- NEWLY ADDED IN 1.0.5 !!!!
                name = 'skilletsoul',
                payToSociety = true, -- if true, money from the order will go to the society account, if false, money will be given to the cashier who made the order
            },
            ---
            ['fridgeShop'] = {
                ['label'] = 'Skillet and Soul Truck Fridge',
                ['items'] = {
                    {
                        name = 'cutted_potato',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_tomato',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_onion',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cheddar',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_lettuce',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'burgerbun',
                        price = 1,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_bacon',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_burgerpatty',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'burgerpatty',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'bacon',
                        price = 4,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cup_cola',
                        price = 6,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_sausages',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_beef_brisket',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_wings',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                },
                ['groups'] = { -- Job / Gang Compatibility
                    skilletsoul = 0,
                    --ambulance = 0
                },
            },
            ['storage'] = {
                ['label'] = 'Storage',
                ['groups'] = { -- Job / Gang Compatibility
                    skilletsoul = 0,
                    --ambulance = 0
                },
            },
            ['cashRegister'] = {
                ['label'] = 'Cash Register',
                ['groups'] = { -- Job / Gang Compatibility
                    skilletsoul = 0,
                    --ambulance = 0
                },
            },
            ['cooking'] = {
                ['groups'] = { -- Job / Gang Compatibility
                    skilletsoul = 0,
                    --ambulance = 0
                },
                ['dishes'] = {  -- NEW IN 1.2.0 -- ADD ALL DISHES HERE (CRAFTABLES AND COOKABLES)
                    'aunties_combo_meal',
                    'catfish_andsoul_plate',
                    'golden_pineapple_punch',
                    'grand_heritage_oxtailplate',
                    'grandmas_friedchicken_plate',
                    'grandmas_peachcobbler_shake',
                    'homemade_banana_pudding',
                    'madukes_chocolatebrownie_shake',
                    'mamas_ovenbakedchicken_plate',
                    'pops_barbecueribs_plate',
                    'southern_peach_cobbler',
                    'southern_peach_lemonade',
                    'southern_sunset_punch',
                    'southernsothered_porkchop_plate',
                    'strawberry_crunch_cheesecke',
                    'strawberry_soul_lemonade',
                    'sweet_potato_piebites',
                    'uncs_combo_meal',
                    'watermelon_breeze',
                    'southern_crunchchicken_sandwich',
                    'soyhern_bambam_burger',
                }
            },
            ['shop'] = {  -- disabled when RealisticMode is true
                ['label'] = 'Ingredients Shop',
                ['items'] = {
                    {
                        name = 'cutted_potato',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_tomato',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_onion',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cheddar',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cutted_lettuce',
                        price = 2,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'burgerbun',
                        price = 1,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_bacon',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_burgerpatty',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'burgerpatty',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'bacon',
                        price = 4,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cup_cola',
                        price = 6,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_sausages',
                        price = 3,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_beef_brisket',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'raw_wings',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                },
                ['groups'] = { -- Job / Gang Compatibility
                    skilletsoul = 0,
                    --ambulance = 0
                },
            },
        },
        -- [3] = {  -- NEW -- ADDED SUPPORT FOR DIFFERENT LIVERIES PER FOOD TRUCK - LIVERY NUMBER GOES HERE
        --     ['label'] = 'Skillet and Soul Truck',
        --     ---
        --     ['society'] = {        ---------------- NEWLY ADDED IN 1.0.5 !!!!
        --         name = 'burgershot',
        --         payToSociety = true, -- if true, money from the order will go to the society account, if false, money will be given to the cashier who made the order
        --     },
        --     ---
        --     ['fridgeShop'] = {
        --         ['label'] = 'Skillet and Soul Truck Fridge',
        --         ['items'] = {
        --             {
        --                 name = 'cutted_potato',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cutted_tomato',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cutted_onion',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cheddar',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cutted_lettuce',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'burgerbun',
        --                 price = 1,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_bacon',
        --                 price = 3,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_burgerpatty',
        --                 price = 3,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'burgerpatty',
        --                 price = 5,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'bacon',
        --                 price = 4,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cup_cola',
        --                 price = 6,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_sausages',
        --                 price = 3,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_beef_brisket',
        --                 price = 5,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --         },
        --         ['groups'] = { -- Job / Gang Compatibility
        --             skilletsoul = 0,
        --             --ambulance = 0
        --         },
        --     },
        --     ['storage'] = {
        --         ['label'] = 'Storage',
        --         ['groups'] = { -- Job / Gang Compatibility
        --             skilletsoul = 0,
        --             --ambulance = 0
        --         },
        --     },
        --     ['cashRegister'] = {
        --         ['label'] = 'Cash Register',
        --         ['groups'] = { -- Job / Gang Compatibility
        --             skilletsoul = 0,
        --             --ambulance = 0
        --         },
        --     },
        --     ['cooking'] = {
        --         ['groups'] = { -- Job / Gang Compatibility
        --             skilletsoul = 0,
        --             --ambulance = 0
        --         },
        --         ['dishes'] = {  -- NEW IN 1.2.0 -- ADD ALL DISHES HERE (CRAFTABLES AND COOKABLES)
        --             'aunties_combo_meal',
        --             'catfish_andsoul_plate',
        --             'golden_pineapple_punch',
        --             'grand_heritage_oxtailplate',
        --             'grandmas_friedchicken_plate',
        --             'grandmas_peachcobbler_shake',
        --             'homemade_banana_pudding',
        --             'madukes_chocolatebrownie_shake',
        --             'mamas_ovenbakedchicken_plate',
        --             'pops_barbecueribs_plate',
        --             'southern_peach_cobbler',
        --             'southern_peach_lemonade',
        --             'southern_sunset_punch',
        --             'southernsothered_porkchop_plate',
        --             'strawberry_crunch_cheesecke',
        --             'strawberry_soul_lemonade',
        --             'sweet_potato_piebites',
        --             'uncs_combo_meal',
        --             'watermelon_breeze',
        --         }
        --     },
        --     ['shop'] = {  -- disabled when RealisticMode is true
        --         ['label'] = 'Ingredients Shop',
        --         ['items'] = {
        --             {
        --                 name = 'cutted_potato',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cutted_tomato',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cutted_onion',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cheddar',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cutted_lettuce',
        --                 price = 2,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'burgerbun',
        --                 price = 1,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_bacon',
        --                 price = 3,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_burgerpatty',
        --                 price = 3,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'burgerpatty',
        --                 price = 5,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'bacon',
        --                 price = 4,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'cup_cola',
        --                 price = 6,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_sausages',
        --                 price = 3,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_beef_brisket',
        --                 price = 5,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --             {
        --                 name = 'raw_wings',
        --                 price = 5,
        --                 count = 500,
        --                 metadata = {},
        --             },
        --         },
        --         ['groups'] = { -- Job / Gang Compatibility
        --             skilletsoul = 0,
        --             --ambulance = 0
        --         },
        --     },
        -- },
        
    },

    [`voodootacotruck`] = {

        [1] = {  -- NEW -- ADDED SUPPORT FOR DIFFERENT LIVERIES PER FOOD TRUCK - LIVERY NUMBER GOES HERE
            ['label'] = 'Attack-A-Taco Truck',
                ---
                ['society'] = {        ---------------- NEWLY ADDED IN 1.0.5 !!!!
                name = 'attackataco',
                payToSociety = false, -- if true, money from the order will go to the society account, if false, money will be given to the cashier who made the order
            },
            ---
            ['fridgeShop'] = {
                ['label'] = 'Attack-A-Taco Truck Fridge',
                ['items'] = {
                    {
                        name = 'palace_corona',
                        price = 9,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'water',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'cup_cola',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'lemonlime_margarita',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                    {
                        name = 'blueraspberry_margarita',
                        price = 5,
                        count = 500,
                        metadata = {},
                    },
                },
                ['groups'] = { -- Job / Gang Compatibility
                    attackataco = 0,
                    --ambulance = 0
                },
            },
            ['storage'] = {
                ['label'] = 'Storage',
                ['groups'] = { -- Job / Gang Compatibility
                    attackataco = 0,
                    --ambulance = 0
                },
            },
            ['cashRegister'] = {
                ['label'] = 'Cash Register',
                ['groups'] = { -- Job / Gang Compatibility
                    attackataco = 0,
                    --ambulance = 0
                },
            },
            ['cooking'] = {
                ['groups'] = { -- Job / Gang Compatibility
                    attackataco = 0,
                    --ambulance = 0
                },
                ['dishes'] = {  -- NEW IN 1.2.0 -- ADD ALL DISHES HERE (CRAFTABLES AND COOKABLES)
                    'taco_meat',
                    'taco',
                    'fries',
                    'attack_quesadilla',
                    'attack_birria_tacos',
                    'attack_nachos',
                    'attack_oxtailtaco',
                    'attack_burrito',
                    'fajita_nachos',
                }
            },
            ['shop'] = {  -- disabled when RealisticMode is true
                ['label'] = 'Ingredients Shop',
                ['items'] = {
                    {
                        name = 'cutted_potato',
                        price = 2,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'raw_taco',
                        price = 3,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'raw_bacon',
                        price = 3,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'taco_shell',
                        price = 1,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'cutted_lettuce',
                        price = 2,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'taco_sauce',
                        price = 2,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'cutted_tomato',
                        price = 2,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'cutted_onion',
                        price = 2,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'birria_beef',
                        price = 4,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'tortilla_chip',
                        price = 2,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'grated_cheese',
                        price = 2,
                        count = 9999,
                        metadata = {},
                    },
                    {
                        name = 'cheddar',
                        price = 2,
                        count = 9999,
                        metadata = {},
                    }
                },
                ['groups'] = { -- Job / Gang Compatibility
                    attackataco = 0,
                    --ambulance = 0
                },
            },
        },
    },

}

Config.Grades = {
    quality = {
        [0] = "Poor",
        [25] = "Bad",
        [50] = "Good",
        [75] = "Great",
        [100] = "Perfect"
    },
}

Config.Stations = {
    ['fryer'] = {
        name = "Fryer",
        grill = true,
        recipes = {
            ['fries'] = {
                amount = 1,
                ingredients = {
                    ['cutted_potato'] = 1
                },
                icon = 'french-fries',
                time = 18000
            }
        },
        max = 3
    },
    ['grill-1'] = {
        name = "Grill",
        grill = true,
        recipes = {
            ['burgerpatty'] = {
                amount = 1,
                ingredients = {
                    ['raw_burgerpatty'] = 1
                },
                icon = 'burger',
                time = 40000,
                propsName = '_burger', -- DONT TOUCH (or set to nil for no prop)
            },
            ['bacon'] = {
                amount = 1,
                ingredients = {
                    ['raw_bacon'] = 1
                },
                icon = 'bacon',
                time = 25000,
                propsName = '_bacon', -- DONT TOUCH (or set to nil for no prop)
            },
            ['taco_meat'] = {
                amount = 1,
                ingredients = {
                    ['raw_taco'] = 1
                },
                icon = 'burger',
                time = 25000,
                propsName = '_mince', -- DONT TOUCH (or set to nil for no prop)
            },
            ['cooked_bbq_wings'] = {
                amount = 1,
                ingredients = {
                    ['raw_wings'] = 1
                },
                icon = 'burger',
                time = 30000,
                propsName = '_mince',
            },
            ['cooked_bbq_sausages'] = {
                amount = 1,
                ingredients = {
                    ['raw_sausages'] = 1
                },
                icon = 'burger',
                time = 25000,
                propsName = '_bacon',
            },

        },
        max = 6
    },
    ['assembly'] = {
        name = "Assembly",
        recipes = {
            ['bleeder'] = {
                amount = 1,
                description = "A Classic Burger with a little bit of everything!",
                ingredients = {
                    ['burgerbun'] = 1,
                    ['cutted_lettuce'] = 2,
                    ['cheddar'] = 1,
                    ['cutted_tomato'] = 1,
                    ['cutted_onion'] = 1,
                    ['burgerpatty'] = 2,
                },
                time = 5000,
            },
            ['heartstopper'] = {
                description = "Clogged FULL of Goodness!",
                amount = 1,
                ingredients = {
                    ['burgerbun'] = 1,
                    ['cutted_lettuce'] = 1,
                    ['cheddar'] = 4,
                    ['cutted_tomato'] = 1,
                    ['burgerpatty'] = 3
                },
                time = 5000,
            },
            ['bacon_burger']= {
                description = "A Classic Burger with extra bacon!",
                amount = 1,
                ingredients = {
                    ['burgerbun'] = 1,
                    ['cutted_onion'] = 1,
                    ['cheddar'] = 1,
                    ['burgerpatty'] = 1,
                    ['bacon'] = 2,
                }
            },
            ['taco'] = {
                amount = 1,
                ingredients = {
                    ['taco_meat'] = 1,
                    ['taco_shell'] = 1,
                    ['taco_sauce'] = 1,
                    ['cutted_onion'] = 1,
                }
            },
            ['attack_quesadilla'] = {
                amount = 1,
                ingredients = {
                    ['taco_shell'] = 1,
                    ['cutted_onion'] = 1,
                    ['cheddar'] = 1,
                }
            },
            ['attack_birria_tacos'] = {
                amount = 1,
                ingredients = {
                    ['taco_shell'] = 1,
                    ['cutted_onion'] = 1,
                    ['taco_meat'] = 1,
                    ['birria_beef'] = 1,
                    ['tortilla_chip'] = 2,
                }
            },
            ['attack_nachos'] = {
                amount = 1,
                ingredients = {
                    ['tortilla_chip'] = 2,
                    ['grated_cheese'] = 1,
                }
            },
            ['wam_glizzy_dog'] = {
                amount = 1,
                description = "A Wig Wam classic glizzy with all the fixins!",
                ingredients = {
                    ['burgerbun'] = 1,
                    ['cooked_bbq_sausages'] = 1,
                    ['cutted_onion'] = 1,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
            ['ultimate_wings'] = {
                amount = 1,
                description = "Crispy wings loaded with flavor!",
                ingredients = {
                    ['cooked_bbq_wings'] = 3,
                    ['cheddar'] = 1,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
            ['buffalo_wing_combo'] = {
                amount = 1,
                description = "Buffalo wings with a side of fries!",
                ingredients = {
                    ['cooked_bbq_wings'] = 2,
                    ['cutted_onion'] = 1,
                    ['fries'] = 1,
                },
                time = 5000,
            },
            ['wam_burger_combo'] = {
                amount = 1,
                description = "A Wig Wam burger with fries — the full combo!",
                ingredients = {
                    ['burgerbun'] = 1,
                    ['burgerpatty'] = 1,
                    ['cutted_lettuce'] = 1,
                    ['cutted_tomato'] = 1,
                    ['fries'] = 1,
                },
                time = 5000,
            },
            ['italian_beef_combo'] = {
                amount = 1,
                description = "Stacked Italian beef with all the toppings!",
                ingredients = {
                    ['burgerbun'] = 1,
                    ['raw_beef_brisket'] = 2,
                    ['cutted_onion'] = 1,
                    ['cutted_tomato'] = 1,
                    ['cheddar'] = 1,
                },
                time = 5000,
            },
            ['ultra_wam'] = {
                amount = 1,
                description = "The ultimate Wig Wam creation — not for the faint of heart!",
                ingredients = {
                    ['burgerbun'] = 1,
                    ['burgerpatty'] = 3,
                    ['bacon'] = 1,
                    ['cheddar'] = 2,
                    ['cutted_lettuce'] = 1,
                    ['cutted_onion'] = 1,
                },
                time = 5000,
            },
            ['wam_blast'] = {
                amount = 1,
                description = "A mega combo that'll blow you away!",
                ingredients = {
                    ['burgerbun'] = 1,
                    ['burgerpatty'] = 2,
                    ['bacon'] = 1,
                    ['cooked_bbq_wings'] = 1,
                    ['cheddar'] = 1,
                    ['cutted_lettuce'] = 1,
                    ['fries'] = 1,
                },
                time = 5000,
            },
            ['attack_burrito'] = {
                amount = 1,
                description = "A Burrito that'll blow you away!",
                ingredients = {
                    ['taco_shell'] = 1,
                    ['taco_meat'] = 2,
                    ['cheddar'] = 1,
                },
                time = 5000,
            },
            ['fajita_nachos'] = {
                amount = 1,
                description = "supreme nachos that'll blow you away!",
                ingredients = {
                    ['taco_meat'] = 2,
                    ['cheddar'] = 1,
                    ['tortilla_chip'] = 2,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
            ['attack_oxtailtaco'] = {
                amount = 1,
                description = "oxtail taco that'll blow you away!",
                ingredients = {
                    ['birria_beef'] = 1,
                    ['cheddar'] = 1,
                    ['taco_shell'] = 1,
                    ['cutted_tomato'] = 1,
                    ['fries'] = 1,
                },
                time = 5000,
            },
            ['aunties_combo_meal'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_wings'] = 1,
                    ['cutted_potato'] = 1,
                    ['cup_cola'] = 1,
                    ['bacon'] = 1,
                    ['burgerbun'] = 1,
                },
                time = 5000,
            },
            ['catfish_andsoul_plate'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_beef_brisket'] = 1,
                    ['cheddar'] = 1,
                    ['cutted_tomato'] = 1,
                    ['cutted_potato'] = 1,
                    ['cutted_lettuce'] = 1,
                },
                time = 5000,
            },
            ['golden_pineapple_punch'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['cutted_potato'] = 1,
                    ['cheddar'] = 1,
                },
                time = 5000,
            },
            ['grand_heritage_oxtailplate'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_beef_brisket'] = 1,
                    ['cutted_onion'] = 1,
                    ['bacon'] = 1,
                    ['raw_sausages'] = 1,
                    ['burgerbun'] = 1,
                },
                time = 5000,
            },
            ['soyhern_bambam_burger'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_beef_brisket'] = 1,
                    ['cutted_onion'] = 1,
                    ['bacon'] = 1,
                    ['raw_sausages'] = 1,
                    ['burgerbun'] = 1,
                },
                time = 5000,
            },
            ['southern_crunchchicken_sandwich'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_beef_brisket'] = 1,
                    ['cutted_onion'] = 1,
                    ['bacon'] = 1,
                    ['raw_sausages'] = 1,
                    ['burgerbun'] = 1,
                },
                time = 5000,
            },
            ['southernsothered_porkchop_plate'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_beef_brisket'] = 1,
                    ['cutted_onion'] = 1,
                    ['bacon'] = 1,
                    ['raw_sausages'] = 1,
                    ['burgerbun'] = 1,
                },
                time = 5000,
            },
            ['grandmas_friedchicken_plate'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_wings'] = 1,
                    ['cheddar'] = 1,
                    ['cutted_lettuce'] = 1,
                    ['burgerbun'] = 1,
                    ['cup_cola'] = 1,
                },
                time = 5000,
            },
            ['grandmas_peachcobbler_shake'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['cutted_potato'] = 1,
                    ['burgerbun'] = 1,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
            ['homemade_banana_pudding'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['burgerbun'] = 1,
                    ['cutted_lettuce'] = 1
                },
                time = 5000,
            },
            ['madukes_chocolatebrownie_shake'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['burgerbun'] = 1,
                    ['cutted_potato'] = 1,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
            ['mamas_ovenbakedchicken_plate'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_wings'] = 1,
                    ['cutted_onion'] = 1,
                    ['burgerbun'] = 1,
                    ['cutted_tomato'] = 1,
                    ['bacon'] = 1,
                },
                time = 5000,
            },
            ['pops_barbecueribs_plate'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_beef_brisket'] = 1,
                    ['raw_bacon'] = 1,
                    ['bacon'] = 1,
                    ['cutted_tomato'] = 1,
                    ['burgerbun'] = 1,
                },
                time = 5000,
            },
            ['southern_peach_cobbler'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['cutted_potato'] = 1,
                    ['burgerbun'] = 1,
                },
                time = 5000,
            },
            ['southern_peach_lemonade'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['cutted_potato'] = 1,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
            ['southern_sunset_punch'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['cutted_lettuce'] = 1,
                    ['cutted_onion'] = 1,
                },
                time = 5000,
            },
            -- ['southernsothered_porkchop_plate'] = {
            --     amount = 1,
            --     description = "",
            --     ingredients = {
            --         ['birria_beef'] = 1,
            --         ['cheddar'] = 1,
            --         ['taco_shell'] = 1,
            --         ['cutted_tomato'] = 1,
            --         ['fries'] = 1,
            --     },
            --     time = 5000,
            -- },
            ['strawberry_crunch_cheesecke'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['burgerbun'] = 1,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
            ['strawberry_soul_lemonade'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['cutted_lettuce'] = 1,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
            ['sweet_potato_piebites'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['burgerbun'] = 1,
                    ['cup_cola'] = 1,
                    ['cutted_onion'] = 1,
                },
                time = 5000,
            },
            ['uncs_combo_meal'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['raw_wings'] = 1,
                    ['cutted_potato'] = 1,
                    ['cup_cola'] = 1,
                    ['bacon'] = 1,
                    ['burgerbun'] = 1,
                },
                time = 5000,
            },
            ['watermelon_breeze'] = {
                amount = 1,
                description = "",
                ingredients = {
                    ['cup_cola'] = 1,
                    ['cutted_onion'] = 1,
                    ['cutted_tomato'] = 1,
                },
                time = 5000,
            },
        }
    }
}

Config.MaxActiveOrders = 25
Config.CashRegisterItems = {
    {
        name = 'Bleeder',
        defaultPrice = 5000,
    },
    {
        name = 'Bacon Burger',
        defaultPrice = 3000,
    },
    {
        name = 'Fries',
        defaultPrice = 2000,
    },
    {
        name = 'Heartstopper',
        defaultPrice = 2000,
    },
    {
        name = 'Cup Cola',
        defaultPrice = 2000,
    },
    {
        name = 'Taco',
        defaultPrice = 4000,
    },
    {
        name = 'Attack Quesadilla',
        defaultPrice = 3500,
    },
    {
        name = 'Attack Birria Tacos',
        defaultPrice = 6000,
    },
    {
        name = 'Attack Nachos',
        defaultPrice = 2500,
    },
    {
        name = 'Attack Burrito',
        defaultPrice = 2500,
    },
    {
        name = 'Attack Supreme Fajita',
        defaultPrice = 2500,
    },
    {
        name = 'Attack Oxtail Taco',
        defaultPrice = 3000,
    },
    {
        name = 'Attack Nachos',
        defaultPrice = 2500,
    },
    {
        name = 'Ultimate Wings',
        defaultPrice = 4000,
    },
    {
        name = 'Buffalo Wing Combo',
        defaultPrice = 5000,
    },
    {
        name = 'Wam Burger Combo',
        defaultPrice = 4500,
    },
    {
        name = 'Italian Beef Combo',
        defaultPrice = 4500,
    },
    {
        name = 'Ultra Wam',
        defaultPrice = 7000,
    },
    {
        name = 'Wam Blast',
        defaultPrice = 6000,
    },
}




--------------------------------------------------
Config.Lang = {
    ['PendingPayment'] = '[PENDING PAYMENT]',
    ['Paid'] = '[PAID]',
    ['PlacedOnGrill'] = 'Placed on grill',
    ['MissingIngredients'] = 'Your missing the correct ingredients',
    ['Cooked'] = 'Cooked',
    ['NotEnoughSpace'] = "You didn't have enough space!",
    ['HandsGrimey'] = 'Your hands start to get grimey',
    ['HandsClean'] = 'All washed up - Your hands are clean!',
    ['NoStorageAccess'] = 'You do not have access to this storage',
    ['IngredientsRequired'] = '🥩 Ingredients Required 🌿',
    ['IngredientsRequiredGrill'] = '🥩 Ingredients Required 🥔',
    ['SelectFood'] = 'Select Food',
    ['Empty'] = 'Empty',
    ['FlipFood'] = 'Flip Food',
    ['UseFryer'] = 'Use Fryer',
    ['UseGrill'] = 'Use Grill',
    ['UseSink'] = 'Use Sink',
    ['FoodTray1'] = 'Food Tray #1',
    ['FoodTray2'] = 'Food Tray #2', 
    ['FoodTray3'] = 'Food Tray #3',
    ['UsePrepArea'] = 'Use Prep Area',
    ['BuyIngredients'] = 'Buy Ingredients',
    ['OpenStorage'] = 'Open Storage',
    ['OpenFridge'] = 'Open Fridge',
    ['ItemAddedToOrder'] = 'Item added to order',
    ['FailedToAddItem'] = 'Failed to add item to order',
    ['RemovedFromOrder'] = 'Removed item from order',
    ['FailedToRemoveItem'] = 'Failed to remove item from order',
    ['OrderDeleted'] = 'Order #%d Deleted',
    ['FailedToDeleteOrder'] = 'Failed to Delete Order %d',
    ['OrderCreated'] = 'Order #%d Created!',
    ['FailedToCreateOrder'] = 'Failed to create order',
    ['NoOrders'] = 'No orders',
    ['NoActiveOrders'] = 'There are currently no active orders',
    ['BackToMainMenu'] = 'Back to Main Menu',
    ['BackToOrders'] = 'Back to Orders',
    ['BackToOrderDetails'] = 'Back to Order Details',
    ['BackToAllOrders'] = 'Back to All Orders',
    ['ActiveOrders'] = 'Active Orders',
    ['OrderDetails'] = 'Order #%d Details',
    ['OrderItemDetails'] = 'Order #%d Item Details',
    ['AddItem'] = 'Add Item',
    ['DeleteOrder'] = 'Delete Order',
    ['PayOrder'] = 'Pay Order',
    ['PayForOrder'] = 'Pay for this Order',
    ['CoverOrderCost'] = 'Cover the cost of the order yourself',
    ['ViewActiveOrders'] = 'View Active Orders',
    ['OrderUp'] = 'Order Up!',
    ['CreateNewOrder'] = 'Create New Order',
    ['CreateOrder'] = 'Create a new order',
    ['CashRegister'] = 'Cash Register',
    ['Checkout'] = 'Checkout',
    ['PaymentMethod'] = 'Payment Method',
    ['PaymentMethodDesc'] = 'Cash or Card',
    ['TipPercentage'] = 'Enter Tip %',
    ['TipPercentageDesc'] = '0 - 100%',
    ['MissingItem'] = 'Missing %d %s',
    ['OrderPaidWithTip'] = 'Order #%d has been paid - $%d (Tip: $%d)',
    ['OrderPaymentFailed'] = 'Order #%d Failed to Pay! - $%d',
}