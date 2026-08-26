FoodStatus = {
    -- Food
    ['cookedsmores'] = {
        food = {hunger = 50000, useTime = 2500},
        anim = {anim = 'mp_player_inteat@burger', disc = 'mp_player_int_eat_burger'},
        prop = {
            name = 'fivecode_cookedsmores',
            pos = {xPos = 0.13, yPos = 0.06, zPos = 0.0, xRot = -22.0, yRot = -16.0, zRot = 10.0},
        },
    },

    ['cookedmeat'] = {
        food = {hunger = 250000, useTime = 5500},
        anim = {anim = 'mp_player_inteat@burger', disc = 'mp_player_int_eat_burger'},
        prop = {
            name = 'fivecode_cookedmeat',
            pos = {xPos = 0.16, yPos = 0.06, zPos = 0.06, xRot = -16.0, yRot = 13.0, zRot = -28.0},
        },
    },

    -- Drinks
    [Config.BeerBarrelItems.full] = {
        food = {alcohol = 60000, thirst = 50000, useTime = 2500},
        giveItem = {
            {name = Config.BeerBarrelItems.empty, amount = 1},
        },
        anim = {anim = 'mp_player_intdrink', disc = 'loop_bottle'},
        prop = {
            name = 'prop_cs_paper_cup',
            pos = {xPos = 0.13, yPos = -0.01, zPos = 0.06, xRot = -43.0, yRot = 132.0, zRot = 18.0},
        },
    },
}