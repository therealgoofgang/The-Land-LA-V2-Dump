Config.chinaTownMarket = {
    -- ===== NON-PBM STORES (indexes 1-16) =====
    {
        interactionDistance = 2.0,
        name = 'DeAndre',
        coords = vector4(5013.6309, -5754.8584, 28.9352, 63.6496),
        storeItems = {
            { name = 'WEAPON_M9', price = 400000, currency = 'black_money' },
            { name = 'WEAPON_FNX45', price = 450000, currency = 'black_money' },
            { name = 'WEAPON_DE', price = 550000, currency = 'black_money' },
            { name = 'WEAPON_UZI', price = 550000, currency = 'black_money' },
            { name = 'WEAPON_MAC10', price = 550000, currency = 'black_money' },
            { name = 'WEAPON_MP9', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_M70', price = 750000, currency = 'black_money' },
            { name = 'WEAPON_AK47', price = 800000, currency = 'black_money' },
            { name = 'WEAPON_M4', price = 850000, currency = 'black_money' },
            { name = 'WEAPON_AR15', price = 850000, currency = 'black_money' },
            { name = 'WEAPON_SCARH', price = 900000, currency = 'black_money' },
            { name = 'WEAPON_HK416', price = 900000, currency = 'black_money' },
            { name = 'WEAPON_SWP2BELT', price = 700000, currency = 'black_money' },

            { name = 'ammo-rifle2', price = 1200, currency = 'black_money' },
            { name = 'ammo-rifle', price = 1700, currency = 'black_money' },
            { name = 'bobby_pin', price = 50000, currency = 'black_money' },
            { name = 'fullhealkit', price = 30000, currency = 'black_money' },
            { name = 'torture_kit', price = 50000, currency = 'black_money' },
            { name = 'pimping_phone', price = 50000, currency = 'black_money' },
            { name = 'gsr_cloth', price = 50000, currency = 'black_money' },
            { name = 'wipe_cloth', price = 50000, currency = 'black_money' },
        },
        pedData = {
            coords = vector4(5013.6309, -5754.8584, 27.9352, 63.6496),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'DeAndre',
            description = 'Would you like to buy some illegal products?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Mary',
        coords = vector4(514.6693, 167.6886, 99.3685, 297.7260),
        storeItems = {
            -- ===== PISTOLS (ammo-9) =====
            { name = 'WEAPON_K100DHEXRED', price = 1600, currency = 'gun_parts' },    -- G17 HexRed
            { name = 'WEAPON_KSBLOSS19S', price = 1700, currency = 'gun_parts' },     -- Blossom 19s Wing
            { name = 'WEAPON_KSJAPRENETTI', price = 1600, currency = 'gun_parts' },   -- Art of War Renetti
            { name = 'WEAPON_KSDEAGLE', price = 1700, currency = 'gun_parts' },       -- Deagle
            { name = 'WEAPON_KS313TITANS', price = 1700, currency = 'gun_parts' },    -- 313 Titan
            { name = 'WEAPON_KSVVSTITAN', price = 1700, currency = 'gun_parts' },     -- VVS Titan
            { name = 'WEAPON_K100DG19S', price = 1900, currency = 'gun_parts' },      -- G19s-SkyView
            -- ===== SMGs (ammo-45) =====
            { name = 'WEAPON_KSRUSTYTOMMY', price = 1800, currency = 'gun_parts' },   -- Rusty Tommy
            { name = 'WEAPON_KSZAPBASP', price = 1800, currency = 'gun_parts' },      -- ZAP BAS-P
            { name = 'WEAPON_KSCAMOG553', price = 1800, currency = 'gun_parts' },     -- Camo G-553
            { name = 'WEAPON_KSLAVASWEEPER', price = 1800, currency = 'gun_parts' },  -- Lava Sweeper
            { name = 'WEAPON_KSSAKURA', price = 1800, currency = 'gun_parts' },       -- Sakura SMG
            { name = 'WEAPON_KSKOGOT7', price = 1800, currency = 'gun_parts' },       -- Kogot-7
            -- ===== RIFLES (ammo-rifle) =====
            { name = 'WEAPON_K100DSUPERI', price = 1600, currency = 'gun_parts' },    -- Superi Water
            { name = 'WEAPON_K100GREDFAL', price = 1600, currency = 'gun_parts' },    -- GRed Fal
            { name = 'WEAPON_K100DSCAR', price = 2000, currency = 'gun_parts' },      -- SAK SCAR
            { name = 'WEAPON_K100DGRAU', price = 1900, currency = 'gun_parts' },      -- HEX-G GRAU
            { name = 'WEAPON_K100DAK74', price = 1900, currency = 'gun_parts' },      -- Bloody AK74u
            { name = 'WEAPON_K100DM16', price = 1900, currency = 'gun_parts' },       -- All Over M16
            { name = 'WEAPON_K100DKAC', price = 1800, currency = 'gun_parts' },       -- Galaxy PDW
            { name = 'WEAPON_K100DAMEX', price = 2000, currency = 'gun_parts' },      -- Yell AMEX
            { name = 'WEAPON_K100DMG2', price = 2000, currency = 'gun_parts' },       -- MG2-B
            { name = 'WEAPON_K100GDDCYAN', price = 1800, currency = 'gun_parts' },    -- DDSMG-Cyan
            { name = 'WEAPON_RIVETERICR', price = 1900, currency = 'gun_parts' },     -- Riverter ICR
            { name = 'WEAPON_GREENHOUSE', price = 1900, currency = 'gun_parts' },     -- Greenouse
            { name = 'WEAPON_BONG', price = 1900, currency = 'gun_parts' },           -- SmokeSmokeSmoke
            { name = 'WEAPON_SNAKE', price = 1900, currency = 'gun_parts' },          -- SnakeAR
            { name = 'WEAPON_M4GATT', price = 2000, currency = 'gun_parts' },         -- M4-GATT
            { name = 'WEAPON_WIZARD', price = 1900, currency = 'gun_parts' },         -- Wizard
            { name = 'WEAPON_LC10ASPEN', price = 1800, currency = 'gun_parts' },      -- LC10 Aspen
            { name = 'WEAPON_LADRA', price = 1900, currency = 'gun_parts' },          -- LADRA
            { name = 'WEAPON_KSMODELL', price = 1900, currency = 'gun_parts' },       -- Model-L
            { name = 'WEAPON_KSGUITAR', price = 1900, currency = 'gun_parts' },       -- Guitar
            { name = 'WEAPON_KSDIGIMK47', price = 1900, currency = 'gun_parts' },     -- Digital MK47
            { name = 'WEAPON_KSJRENTLESS', price = 1900, currency = 'gun_parts' },    -- Rentless
            { name = 'WEAPON_KSWINGEDG36', price = 1900, currency = 'gun_parts' },    -- Winged G36
            { name = 'WEAPON_KSAR13', price = 1900, currency = 'gun_parts' },         -- AR13
            { name = 'WEAPON_KSLR300', price = 1900, currency = 'gun_parts' },        -- LR300
            { name = 'WEAPON_KSDIGISCAR', price = 2000, currency = 'gun_parts' },     -- Red Digital Scar
            { name = 'WEAPON_KSHAZARDXM4', price = 2000, currency = 'gun_parts' },    -- Hazard XM4

        },
        statebagLock = 'isGunPlug',
        blipData = {
            coords = vector3(514.6693, 167.6886, 99.36),
            sprite = 110,
            color = 42,
            name = 'Gun Plug',
            scale = 0.7,
            shortRange = true,
        },
        pedData = {
            coords = vector4(514.6693, 167.6886, 98.3685, 297.7260),
            pedModel = 'g_f_y_vagos_01',
            animation = 'idle_a',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Mary',
            description = 'Would you like to buy some "arms"?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Luna',
        coords = vector4(514.9032, 169.8391, 99.3702, 253.0829),
        storeItems = {
            { name = 'ammo-rifle', price = 700, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 700, currency = 'black_money' },
            { name = 'ammo-shotgun', price = 950, currency = 'black_money' },
            { name = 'ammo-44', price = 800, currency = 'black_money' },
            { name = 'ammo-50', price = 800, currency = 'black_money' },
        },
        statebagLock = {'isGunPlugT2', 'isGunPlugT3'},
        pedData = {
            coords = vector4(514.9032, 169.8391, 98.3702, 253.0829),
            pedModel = 'IG_Natalia',
            animation = 'idle_a',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Luna',
            description = 'Would you like to buy some ammo?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Sally',
        coords = vector4(-601.4979, -1037.6047, 22.5449, 82.4733),
        storeItems = {
            { name = 'basil', price = 1 },
            { name = 'corncob', price = 1 },
            { name = 'lettuce', price = 1 },
            { name = 'onion', price = 1 },
            { name = 'pmushrooms', price = 1 },
            { name = 'slicedonion', price = 1 },
            { name = 'tomato', price = 1 },
        },
        blipData = {
            coords = vector3(-601.4979, -1037.6047, 22.5449),
            sprite = 478,
            color = 2,
            name = 'Vegetable Market',
            scale = 0.4,
            shortRange = true,
        },
        pedData = {
            coords = vector4(-601.4979, -1037.6047, 21.5449, 82.4733),
            pedModel = 'a_f_y_femaleagent',
            animation = 'WORLD_HUMAN_CLIPBOARD',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Vegetable Market',
            description = 'Would you like to buy some vegetables?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Mark',
        coords = vector4(-620.1443, -1155.0115, 22.0990 - 1, 82.1778),
        storeItems = {
            { name = 'bacon_pieces', price = 1 },
            { name = 'burgerpatty', price = 1 },
            { name = 'grilled_patty', price = 1 },
            { name = 'chicken_strips_raw', price = 1 },
            { name = 'chicken_wings_raw', price = 1 },
            { name = 'ham', price = 1 },
            { name = 'meat', price = 1 },
            { name = 'diced_meat', price = 1 },
            { name = 'chopped_meat', price = 1 },
            { name = 'pepperoni', price = 1 },
            { name = 'pepperoni_stick', price = 1 },
            { name = 'salami', price = 1 },
            { name = 'sirloin_steak', price = 1 },
        },
        blipData = {
            coords = vector3(-620.1443, -1155.0115, 22.0990),
            sprite = 478,
            color = 2,
            name = 'Meat Market',
            scale = 0.4,
            shortRange = true,
        },
        pedData = {
            coords = vector4(-620.1443, -1155.0115, 22.0990, 82.1778),
            pedModel = 'a_m_m_farmer_01',
            animation = 'WORLD_HUMAN_CLIPBOARD',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Meat Market',
            description = 'Would you like to buy meat?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Nancy',
        coords = vector4(146.2800, -1522.8143, 29.1418, 308.3785),
        storeItems = {
            { name = 'apple_green', price = 1 },
            { name = 'apple_red', price = 1 },
            { name = 'blueberry', price = 1 },
            { name = 'grape', price = 1 },
            { name = 'lemon', price = 1 },
            { name = 'lime', price = 1 },
            { name = 'orange', price = 1 },
            { name = 'strawberry', price = 1 },
        },
        blipData = {
            coords = vector3(146.2800, -1522.8143, 29.1418),
            sprite = 478,
            color = 2,
            name = 'Fruit Market',
            scale = 0.4,
            shortRange = true,
        },
        pedData = {
            coords = vector4(146.2800, -1522.8143, 28.1418, 308.3785),
            pedModel = 'a_m_m_farmer_01',
            animation = 'WORLD_HUMAN_CLIPBOARD',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Fruit Market',
            description = 'Would you like to buy some fruits?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Peter',
        coords = vector4(379.4948, -1781.5216, 29.4723, 55.2988),
        storeItems = {
            { name = 'butter', price = 1 },
            { name = 'cheddar', price = 1 },
            { name = 'cream', price = 1 },
            { name = 'eggs', price = 1 },
            { name = 'grated_cheese', price = 1 },
            { name = 'milk', price = 1 },
        },
        blipData = {
            coords = vector3(379.4948, -1781.5216, 29.4723),
            sprite = 478,
            color = 2,
            name = 'Dairy Market',
            scale = 0.4,
            shortRange = true,
        },
        pedData = {
            coords = vector4(379.4948, -1781.5216, 28.4723, 55.2988),
            pedModel = 'a_m_m_farmer_01',
            animation = 'WORLD_HUMAN_CLIPBOARD',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Dairy Market',
            description = 'Would you like to buy some dairy products?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Scott',
        coords = vector4(410.4882, -1910.7986, 25.4528, 94.9852),
        storeItems = {
            { name = 'burgerbun', price = 1 },
            { name = 'coffee_bean', price = 1 },
            { name = 'flour', price = 1 },
            { name = 'potatoes', price = 1 },
            { name = 'salt', price = 1 },
            { name = 'sodasyrup', price = 1 },
            { name = 'honey', price = 1 },

        },
        blipData = {
            coords = vector3(410.4882, -1910.7986, 25.4528),
            sprite = 478,
            color = 2,
            name = 'General Market',
            scale = 0.4,
            shortRange = true,
        },
        pedData = {
            coords = vector4(410.4882, -1910.7986, 24.4528, 94.9852),
            pedModel = 'a_m_m_farmer_01',
            animation = 'WORLD_HUMAN_CLIPBOARD',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'General Market',
            description = 'Would you like to buy some general products?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Mel',
        coords = vector4(892.2596, -2171.7898, 31.2862, 170.2459),
        storeItems = {
            { name = 'iron', price = 6 },
            { name = 'steel', price = 10 },
            { name = 'plastic', price = 300 },
            { name = 'silk_mat', price = 20 },
        },
        blipData = {
            coords = vector3(892.2596, -2171.7898, 32.2862),
            sprite = 478,
            color = 2,
            name = 'Material Market',
            scale = 0.4,
            shortRange = true,
        },
        pedData = {
            coords = vector4(892.2596, -2171.7898, 31.2862, 170.2459),
            pedModel = 'IG_Money',
            animation = 'WORLD_HUMAN_CLIPBOARD',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Metal Market',
            description = 'Would you like to buy some metals?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Lucia',
        coords = vector4(1130.7354, -477.4134, 66.6134, 344.0579),
        storeItems = {
            { name = 'phone', price = 1000 },
            { name = 'laptop', price = 5000 },
            { name = 'radio', price = 1000 },
        },
        pedData = {
            coords = vector4(1130.7354, -477.4134, 65.6134, 344.0579),
            pedModel = 'U_F_M_CasinoShop_01',
            animation = 'WORLD_HUMAN_CLIPBOARD',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Digital Den',
            description = 'Would you like to buy some digital products?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Jayce',
        coords = vector4(1131.7498, -463.2455, 66.8405, 253.9521),
        storeItems = {
            { name = 'backpack', price = 50000 },
        },
        pedData = {
            coords = vector4(1131.7498, -463.2455, 65.8405, 253.9521),
            pedModel = 'a_m_m_soucent_02',
            animation = 'WORLD_HUMAN_GUARD_STAND',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Jayce',
            description = 'Would you like to buy some backpacks?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Mark',
        coords = vector4(1569.8187, -2129.5854, 77.3302, 157.2029),
        storeItems = {
            { name = 'scam_laptop', price = 2500 },
            { name = 'blank_cards', price = 200 },
            { name = 'blank_checks', price = 100 },
        },
        pedData = {
            coords = vector4(1569.8187, -2129.5854, 77.3302, 157.2029),
            pedModel = 'a_m_m_soucent_02',
            animation = 'WORLD_HUMAN_GUARD_STAND',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Mark',
            description = 'Would you like to buy some fraudster shit?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Maruc',
        coords = vector4(-1222.4993, -1495.7006, 4.3477, 118.5771),
        storeItems = {
            { name = 'skateboard', price = 50000 },
        },
        pedData = {
            coords = vector4(-1222.4993, -1495.7006, 3.3477, 118.5771),
            pedModel = 'A_M_Y_Skater_02',
            animation = 'WORLD_HUMAN_AA_COFFEE',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Maruc',
            description = 'Are you interested in purchasing a quality skateboard?',
        },
        blipData = {
            coords = vector3(-1222.4993, -1495.7006, 3.3477),
            sprite = 515,
            color = 2,
            name = 'Skating',
            scale = 0.4,
            shortRange = true,
        },
    },
    {
        interactionDistance = 2.0,
        name = 'Elias',
        coords = vector4(359.0791, -1287.2091, 32.5234, 233.5195),
        storeItems = {
            { name = 'cocaleaves', price = 14 },
            { name = 'bakingsoda', price = 14 },
            { name = 'sulfuricacid', price = 14 },
            { name = 'kerosene', price = 14 },
            { name = 'ammonia', price = 14 },
            { name = 'crystalbinder', price = 14 },
            { name = 'synthrolbase', price = 14 },
            { name = 'veltrine', price = 14 }
        },
        pedData = {
            coords = vector4(359.0791, -1287.2091, 31.5234, 233.5195),
            pedModel = 'S_M_M_Doctor_01',
            animation = 'WORLD_HUMAN_AA_COFFEE',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Elias Mercer',
            description = 'Are you in the market for bulk pharmaceutical grade chemicals? All licenses verified, and everything ships with documentation.',
        },
        blipData = {
            coords = vector3(110.3391, -220.0914, 54.7),
            sprite = 515,
            color = 2,
            name = 'Skating',
            scale = 0.4,
            shortRange = true,
        },
    },
    {
        interactionDistance = 2.0,
        name = 'Rico',
        coords = vector4(510.7880, 2605.3225, 44.3690, 73.8631),
        storeItems = {
            { name = 'cocaleaves', price = 10, currency = 'black_money' },
            { name = 'bakingsoda', price = 10, currency = 'black_money' },
            { name = 'sulfuricacid', price = 10, currency = 'black_money' },
            { name = 'kerosene', price = 10, currency = 'black_money' },
            { name = 'ammonia', price = 10, currency = 'black_money' },
            { name = 'crystalbinder', price = 10, currency = 'black_money' },
            { name = 'synthrolbase', price = 10, currency = 'black_money' },
            { name = 'veltrine', price = 10, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(510.7880, 2605.3225, 42.9690, 73.8631),
            pedModel = 'S_M_M_DrugProcess_01',
            animation = 'WORLD_HUMAN_GUARD_STAND_ARMY',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Rico Valen',
            description = 'You lookin to cook or move weight? I got bulk chems no paper trail, no questions.',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Maria',
        coords = vector4(-1303.3379, -1369.7103, 4.5092, 88.9021),
        storeItems = {
            { name = 'bananaactivity', price = 10},
            { name = 'inflatable', price = 10},
            { name = 'parasailing', price = 10},
            { name = 'ski', price = 10},
            { name = 'circle', price = 10},
            { name = 'bed1', price = 10},
            { name = 'bed2', price = 10},
            { name = 'bed3', price = 10},
            { name = 'bed4', price = 10},
        },
        pedData = {
            coords = vector4(-1303.3379, -1369.7103, 3.5092, 88.9021),
            pedModel = 'a_f_m_beach_01',
            animation = 'WORLD_HUMAN_GUARD_STAND_ARMY',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Maria De Santa',
            description = 'You lookin for some Water activity equipments?',
        }
    },

    -- ===== PROTECTED STORES (indexes 17-18) =====
    {
        interactionDistance = 2.0,
        name = 'Regina',
        coords = vector4(-1497.7625, 839.3167, 187.1852, 76.6181),
        storeItems = {

            { name = 'WEAPON_SM17PINK', price = 400, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_SM17PURPLE', price = 400, currency = 'tbx_pink_diamonds' },

            { name = 'WEAPON_VVS57BLUE', price = 500, currency = 'tbx_pink_diamonds' },

            { name = 'WEAPON_VVS57PEACH', price = 500, currency = 'tbx_pink_diamonds' },

            { name = 'WEAPON_VVS57YELLOW', price = 500, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_PINKGLOCK17', price = 600, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_ROSEGOLDRAC', price = 850, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_MP5K_DEADLYCUDDLE', price = 1000, currency = 'tbx_pink_diamonds' },

            -- { name = 'WEAPON_SEDUCTRESSSICA', price = 1000, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_SEDUCTRESSEVO', price = 1000, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_SEDUCTRESSASVALV2', price = 1000, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_SEDUCTRESSGLOCK', price = 700, currency = 'tbx_pink_diamonds' },

            { name = 'seductress_set', price = 3000, currency = 'tbx_pink_diamonds' },
            { name = 'case_seductress_switch', price = 35, currency = 'tbx_pink_diamonds' },

            { name = 'WEAPON_GLOWINGTAR', price = 1000, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_HEARTPDW', price = 800, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_PINKUMP', price = 900, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_ZEBRAFFAR', price = 1100, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_FWP2AR15', price = 800, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_FWP2BARP', price = 1500, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_FWP2BCARP', price = 1100, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_FWP2BUBARP', price = 1100, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_FWP2KTEC', price = 850, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_FWP2MP7', price = 900, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_FWP2FN509', price = 250, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_BANKSONGP2ASVAL', price = 1150, currency = 'tbx_pink_diamonds' },
            { name = 'WEAPON_BANKSONGP2EVO', price = 950, currency = 'tbx_pink_diamonds' },

        },
        statebagLock = {'isFemale', 'isLGBTQ'},
        pedData = {
            coords = vector4(-1497.7625, 839.3167, 186.1852, 76.6181),
            pedModel = 'g_f_y_vagos_01',
            animation = 'idle_a',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Regina',
            description = 'Would you like to buy some "arms"?',
        }
    },
       {
        interactionDistance = 2.0,
        name = 'Latoya',
        coords = vector4(-1508.4641, 834.6860, 187.1852, 341.4174),
        storeItems = {

            { name = 'baddie_tablet', price = 50000, currency = 'money' },

        },
        statebagLock = {'isFemale', 'isLGBTQ'},
        pedData = {
            coords = vector4(-1508.4641, 834.6860, 186.1852, 341.4174),
            pedModel = 'g_f_y_vagos_01',
            animation = 'idle_a',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Regina',
            description = 'Would you like to buy a "Baddies Tablet"?',
        }
    },
    {
        interactionDistance = 2.0,
        name = 'Officer Roberts',
        coords = vector4(-1034.8727, -822.4575, 10.9516, 49.4095),
        storeItems = {
            { name = 'radio', price = 0, },
            { name = 'tablet', price = 0 },
			{ name = 'bodycam', price = 0, },
			{ name = 'repair_kit', price = 5, },
			{ name = 'ammo-police', price = 2, },
			{ name = 'armourpd', price = 50 },
			{ name = 'handcuffs', price = 0 },
			{ name = 'WEAPON_AURIX_NIGHTFALL_PD', price = 5 },
			{ name = 'WEAPON_CAV5_TALOS_PD', price = 5 },
			{ name = 'WEAPON_COBALT11_PD', price = 5 },
			{ name = 'WEAPON_COLD_CBN', price = 5 },
			{ name = 'WEAPON_COMBAT_REVOLVER', price = 5 },
			{ name = 'WEAPON_COMBAT_V7X', price = 5 },
			{ name = 'WEAPON_CONN_PISTOL', price = 5 },
			{ name = 'WEAPON_GHOSTHAWK7_PD', price = 5 },
			{ name = 'WEAPON_GRD6_BLACKSPIRE_PD', price = 5 },
			{ name = 'WEAPON_HARKEN4_RAVEN_PD', price = 5 },
			{ name = 'WEAPON_JNP_COMBAT_PISTOL', price = 5 },
			{ name = 'WEAPON_KSR9_REVENGER_PD', price = 5 },
			{ name = 'WEAPON_LMT3_BONEBREAKER_PD', price = 5 },
			{ name = 'WEAPON_M12X_SHOOTLINE_PD', price = 5 },
			{ name = 'WEAPON_MC_ARBINE', price = 5 },
			{ name = 'WEAPON_MTD66_RAVEN_PD', price = 5 },
			{ name = 'WEAPON_NIGHTGALE9_PD', price = 5 },
			{ name = 'WEAPON_NSP21_VANTAGE_PD', price = 5 },
			{ name = 'WEAPON_R8V3R_SHADOW_PD', price = 5 },
			{ name = 'WEAPON_ROM22', price = 5 },
			{ name = 'WEAPON_SGL120_NIGHTVEIL_PD', price = 5 },
			{ name = 'WEAPON_SHYP_SG', price = 5 },
			{ name = 'WEAPON_SIL3_CINDERBOLT_PD', price = 5 },
			{ name = 'WEAPON_SKORN_V3_PDW', price = 5 },
			{ name = 'WEAPON_SP_PISTOL', price = 5 },
			{ name = 'WEAPON_SYN67', price = 5 },
			{ name = 'WEAPON_V7X_BLACKTIDE_PD', price = 5 },
			{ name = 'WEAPON_VEX25', price = 5 },
			{ name = 'WEAPON_XEN7_WARDEN_PD', price = 5 },
			{ name = 'WEAPON_XOR_PISTOL', price = 5 },
			{ name = 'WEAPON_BEANBAG', price = 5 },
			{ name = 'WEAPON_STUNGUN', price = 5 },
			{ name = 'weapon_flashlight', price = 5},
			{ name = 'binoculars', price = 1 },
			{ name = 'ankle_monitor', price = 50 },
			{ name = 'power_saw', price = 5 },
			{ name = 'evidence_bag', price = 5 },
			{ name = 'gloves', price = 5 },
			{ name = 'fingerprint_scanner', price = 5 },
			{ name = 'pd_donut', price = 300 },
            { name = 'gascard', price = 5 }
        },
        jobLock = { ['police'] = 0},
        pedData = {
            coords = vector4(-1034.8727, -822.4575, 10.9516, 49.4095),
            pedModel = 'ig_trafficwarden',
            animation = 'WORLD_HUMAN_GUARD_STAND_ARMY',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Officer Roberts',
            description = 'You need some fire power? I got you.',
        }
    },
    -- Personal BM Discord ID (912981484388880414) ceejay
    {
        interactionDistance = 2.0,
        name = 'Ceejay',
        coords = vector4(-659.5668, -2448.5037, 13.9444, 242.7680),
       storeItems = {

            { name = 'WEAPON_G22TANSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17AGENCY', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(-659.5668, -2448.5037, 13.9444 - 1, 242.7680),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Ceejay',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '912981484388880414',
    },

    -- Personal BM Discord ID (592620057759318022) boss_kailou
    {
        interactionDistance = 2.0,
        name = 'Kailou',
        coords = vector4(-880.6777, -1503.2778, 5.2438, 286.3573),
       storeItems = {

            { name = 'WEAPON_G22TANSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(-880.6777, -1503.2778, 5.2438 - 1, 286.3573),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Kailou',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '592620057759318022',
    },

    -- Personal BM Discord ID (773589380333043712) Mike Dash
    {
        interactionDistance = 2.0,
        name = 'Mike',
        coords = vector4(-1091.9850, -1037.5918, 2.1504, 119.7275),
       storeItems = {

            { name = 'WEAPON_TANG19', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17AGENCY', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(-1091.9850, -1037.5918, 2.1504 - 1, 119.7275),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Mike',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '773589380333043712',
    },

    -- Personal BM Discord ID (429730080529317899) Sossboy
    {
        interactionDistance = 2.0,
        name = 'Sossboy',
        coords = vector4(728.3379, 132.2121, 80.9564, 57.6120),
       storeItems = {

            { name = 'WEAPON_DRACOCUSTOM', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CAMOG17', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_GOLDG45', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(728.3379, 132.2121, 80.9564 - 1, 57.6120),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Sossboy',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '429730080529317899',
    },

    -- Personal BM Discord ID (1139466589662625862) gmoney
    {
        interactionDistance = 2.0,
        name = 'Gmoney',
        coords = vector4(914.0607, -1690.7966, 43.1473, 261.4165),
       storeItems = {

            { name = 'WEAPON_SPECIALGLOCK17', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(914.0607, -1690.7966, 43.1473 - 1, 261.4165),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Gmoney',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1139466589662625862',
    },
    -- Personal BM Discord ID (300581083806826506) glock
    {
        interactionDistance = 2.0,
        name = 'Glock',
        coords = vector4(889.5867, -1046.0563, 35.1709, 168.5907),
       storeItems = {

            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 1000, currency = 'black_money' },
            { name = 'ammo-45', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(889.5867, -1046.0563, 35.1709 - 1, 168.5907),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Glock',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '300581083806826506',
    },
    -- Personal BM Discord ID (781079614403117076) menndozaa
    {
        interactionDistance = 2.0,
        name = 'Menndozaa',
        coords = vector4(3825.6174, 4445.6685, 2.8078, 178.1466),
       storeItems = {

            { name = 'WEAPON_FN509', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_SPECIALGLOCK17', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19XTAN', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(3825.6174, 4445.6685, 2.8078 - 1, 178.1466),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Menndozaa',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '781079614403117076',
    },
    -- Personal BM Discord ID (857383423361155093) ntodemon
    {
        interactionDistance = 2.0,
        name = 'NTO Demon',
        coords = vector4(801.8246, -971.6882, 26.0893, 271.6277),
       storeItems = {

            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(801.8246, -971.6882, 26.0893 - 1, 271.6277),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'NTO Demon',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '857383423361155093',
    },
    -- Personal BM Discord ID (958904818611671080) trace
    {
        interactionDistance = 2.0,
        name = 'Trace',
        coords = vector4(360.7454, -697.8741, 2003.7529, 275.8243),
       storeItems = {

            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(360.7454, -697.8741, 2003.7529 - 1, 275.8243),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Trace',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '958904818611671080',
    },
    -- Personal BM Discord ID (1121585118386077718) mack
    {
        interactionDistance = 2.0,
        name = 'Mack',
        coords = vector4(1232.6790, -455.3994, 67.0779, 244.2556),
       storeItems = {

            { name = 'WEAPON_G22TANSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_FN509', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(1232.6790, -455.3994, 67.0779 - 1, 244.2556),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Mack',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1121585118386077718',
    },
    -- Personal BM Discord ID (986126904539111454) kyynggjones
    {
        interactionDistance = 2.0,
        name = 'Kyyngg Jones',
        coords = vector4(1153.7626, -1304.1516, 34.8251, 97.4967),
       storeItems = {

            { name = 'WEAPON_G22TANSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(1153.7626, -1304.1516, 34.8251 - 1, 97.4967),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Kyyngg Jones',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '986126904539111454',
    },
    -- Personal BM Discord ID (527271178348265472) bouieloco
    {
        interactionDistance = 2.0,
        name = 'Bouie Loco',
        coords = vector4(-1150.7762, -1513.4684, 10.6327, 251.9159),
       storeItems = {

            { name = 'WEAPON_FN509', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17AGENCY', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 1000, currency = 'black_money' },
            { name = 'ammo-9', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(-1150.7762, -1513.4684, 10.6327 - 1, 251.9159),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Bouie Loco',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '527271178348265472',
    },
    -- Personal BM Discord ID (300581083806826506) bouieloco
    {
        interactionDistance = 2.0,
        name = 'Glockee',
        coords = vector4(-1322.9775, -1251.3181, 4.6035, 202.9537),
       storeItems = {

            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'ammo-45', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(-1322.9775, -1251.3181, 4.6035 - 1, 202.9537),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Glockee',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '300581083806826506',
    },
    -- Personal BM Discord ID (827364590806892554) ben10
    {
        interactionDistance = 2.0,
        name = 'Ben 10',
        coords = vector4(1546.8158, 2182.4202, 78.8176, 91.0630),
       storeItems = {

            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19XTAN', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 1000, currency = 'black_money' },
            { name = 'ammo-9', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(1546.8158, 2182.4202, 78.8176 - 1, 91.0630),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Ben 10',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '827364590806892554',
    },
    -- Personal BM Discord ID (1016440579925749760) zigonyawigtv
    {
        interactionDistance = 2.0,
        name = 'ZigOnYaWigTV',
        coords = vector4(3.0030, -1215.0199, 26.7035, 266.2995),
       storeItems = {

            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 1000, currency = 'black_money' },
            { name = 'ammo-9', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(3.0030, -1215.0199, 26.7035 - 1, 266.2995),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'ZigOnYaWigTV',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1016440579925749760',
    },
    -- Personal BM Discord ID (728470397862805595) chynaa
    {
        interactionDistance = 2.0,
        name = 'Chynaa',
        coords = vector4(65.9634, -1617.1807, 1998.5051, 223.4574),
       storeItems = {

            { name = 'WEAPON_G22TANSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CAMOG17', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'ammo-50', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(65.9634, -1617.1807, 1998.5051 - 1, 223.4574),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Chynaa',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '728470397862805595',
    },
    -- Personal BM Discord ID (1208204404424052796) queen
    {
        interactionDistance = 2.0,
        name = 'Queen',
        coords = vector4(-7.9261, -1004.8747, 33.5079, 162.1445),
       storeItems = {

            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(-7.9261, -1004.8747, 33.5079 - 1, 162.1445),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Queen',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1208204404424052796',
    },
    -- Personal BM Discord ID (1460703223974199417) sleazy
    {
        interactionDistance = 2.0,
        name = 'Sleazy',
        coords = vector4(1147.4314, -1640.2699, 36.3742, 215.6961),
       storeItems = {

            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17AGENCY', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_FN509', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_GOLDG45', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_SPECIALGLOCK17', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 700, currency = 'black_money' },
            { name = 'ammo-45', price = 700, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' },
            { name = 'ammo-rifle2', price = 1000, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(1147.4314, -1640.2699, 36.3742 - 1, 215.6961),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Sleazy',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1460703223974199417',
    },
    -- Personal BM Discord ID (1429225980094054573) cs
    {
        interactionDistance = 2.0,
        name = 'CS',
        coords = vector4(1129.0713, -987.6866, 46.0142, 152.8670),
       storeItems = {

            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17AGENCY', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_GOLDG45', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CAMOG17', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(1129.0713, -987.6866, 46.0142 - 1, 152.8670),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'CS',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1429225980094054573',
    },
    -- Personal BM Discord ID (1122432023399776256) Constantin Antonio
    {
        interactionDistance = 2.0,
        name = 'Constantin Antonio',
        coords = vector4(260.2603, 2589.5376, 44.9541, 119.4323),
       storeItems = {

            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17AGENCY', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(260.2603, 2589.5376, 44.9541 - 1, 119.4323),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Constantin Antonio',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1122432023399776256',
    },
    -- Personal BM Discord ID (990120691850412043) giah
    {
        interactionDistance = 2.0,
        name = 'Giah',
        coords = vector4(-365.6369, 43.5515, 50.9257, 174.4756),
       storeItems = {

            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17AGENCY', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_FN509', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(-365.6369, 43.5515, 50.9257 - 1, 174.4756),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Giah',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '990120691850412043',
    },
    -- Personal BM Discord ID (1265535866399363174) Tre'Zel St. Patrick
    {
        interactionDistance = 2.0,
        name = 'Tre\'Zel St. Patrick',
        coords = vector4(698.5783, 583.1729, 130.2612, 168.6620),
       storeItems = {

            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(698.5783, 583.1729, 130.2612 - 1, 168.6620),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Tre\'Zel St. Patrick',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1265535866399363174',
    },
    -- Personal BM Discord ID (1183625884956106768) Nelly Grillz
    {
        interactionDistance = 2.0,
        name = 'Nelly Grillz',
        coords = vector4(-521.2892, 165.4281, 70.8847, 1.6850),
       storeItems = {

            { name = 'WEAPON_G17AGENCY', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(-521.2892, 165.4281, 70.8847 - 1, 1.6850),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Nelly Grillz',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1183625884956106768',
    },
    -- Personal BM Discord ID (1404177847530291281) Sean Dior
    {
        interactionDistance = 2.0,
        name = 'Sean Dior',
        coords = vector4(345.9187, -1887.8141, 25.0030, 50.0063),
       storeItems = {

            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_FN509', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CAMOG17', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(345.9187, -1887.8141, 25.0030 - 1, 50.0063),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Sean Dior',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1404177847530291281',
    },
    -- Personal BM Discord ID (1411425942425047120) ItzJRose
    {
        interactionDistance = 2.0,
        name = 'ItzJRose',
        coords = vector4(1015.6450, -114.8033, 73.8903, 124.0055),
       storeItems = {

            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_FN509', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(1015.6450, -114.8033, 73.8903 - 1, 124.0055),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'ItzJRose',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1411425942425047120',
    },
        -- Personal BM Discord ID (800879184045146173) ev1lgrim
    {
        interactionDistance = 2.0,
        name = 'Ev1lGrim',
        coords = vector4(973.6581, -1722.2681, 30.7155, 0.7413),
       storeItems = {

            { name = 'WEAPON_G22TANSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(973.6581, -1722.2681, 30.7155 - 1, 0.7413),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Ev1lGrim',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '800879184045146173',
    },
    -- Personal BM Discord ID (1271626149713150024) Blue
    {
        interactionDistance = 2.0,
        name = 'Blue',
        coords = vector4(67.7109, -1626.2600, 1998.5072, 358.4187),
       storeItems = {

            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_GOLDG45', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G17BAPESWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(67.7109, -1626.2600, 1998.5072 - 1, 358.4187),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Blue',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1271626149713150024',
    },
    -- Personal BM Discord ID (1341517553004056627) Dante
    {
        interactionDistance = 2.0,
        name = 'Dante',
        coords = vector4(67.1065, -937.7155, 2000.0015, 206.3317),
       storeItems = {

            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_CUSTOMDRACO', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G22TANSWITCH', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 1000, currency = 'black_money' },
            { name = 'ammo-rifle', price = 800, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(67.1065, -937.7155, 2000.0015 - 1, 206.3317),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Dante',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1341517553004056627',
    },
    -- Personal BM Discord ID (1390120996299866203) leelucci
    {
        interactionDistance = 2.0,
        name = 'Lee Lucci',
        coords = vector4(1248.6200, -2902.1587, 17.3265, 351.1290),
       storeItems = {

            { name = 'WEAPON_DRACOSHELLCATCHER', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_G19BLUEBEAMSWITCH', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_TANG19', price = 600000, currency = 'black_money' },
            { name = 'WEAPON_REDARP', price = 600000, currency = 'black_money' },
            { name = 'ammo-9', price = 800, currency = 'black_money' },
            { name = 'ammo-rifle', price = 1000, currency = 'black_money' }
        },
        pedData = {
            coords = vector4(1248.6200, -2902.1587, 17.3265 - 1, 351.1290),
            pedModel = 'G_M_Y_StrPunk_02',
            animation = 'WORLD_HUMAN_SMOKING',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        dialogData = {
            icon = 'fa fa-user',
            title = 'Lee Lucci',
            description = 'Would you like to buy some illegal guns?',
        },
        discordId = '1390120996299866203',
    },
}

local function fetchItemsByIndex(index)
    if not Config.chinaTownMarket[index] then
        return {}
    end


    return Config.chinaTownMarket[index].storeItems or {}
end

exports('fetchItemsByIndex', fetchItemsByIndex)

local weaponsInChinaTownMarket = {}

CreateThread(function()
    for _, shopData in pairs(Config.chinaTownMarket) do
        for _, item in pairs(shopData.storeItems) do
            if item and item.name:lower():find('weapon_') then
                weaponsInChinaTownMarket[item.name] = true
            end
        end
    end
end)

exports('getAllWeaponsInChinaTownMarket', function()
    return weaponsInChinaTownMarket
end)
