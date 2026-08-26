Config.dumpsterDiving = {
    Cooldown = 5, -- cooldown time (in seconds)
    SearchCooldown = 30, -- search cooldown time (in seconds)
    SearchDuration = 6, -- search duration time (in seconds)
    MaxCommonReward = 8, -- max amount of common items you can find
    MaxUncommonReward = 3, -- max stack of uncommon items you can find
    MaxRareReward = 1, -- max stack of uncommon items you can find

    CommonRewards = { -- common items that can be found in dumpsters - (60% chance)
        'trash',
        'electric_scrap',
        'plastic',
        'steel',
    },

    UncommonRewards = { -- uncommon items that can be found in dumpsters - (25% chance)
        'plastic',
        'steel',
        'copper',
        'aluminum',
        'iron',
    },

    RareRewards = { -- rare items that can be found in dumpsters - (5% chance)
        'phone',
        'laptop', 
    },

    binModels = {
        `prop_bin_07b`,
        `prop_bin_01a`,
        `prop_recyclebin_03_a`,
        `zprop_bin_01a_old`,
        `prop_bin_07c`,
        `prop_bin_04a`,
        `prop_bin_09a`,
        `prop_bin_03a`,
        `prop_bin_02a`,
        `prop_bin_12a`,
        `prop_bin_05a`,
        `prop_bin_07a`,
        -- small ^
        `prop_skip_05a`,
        `prop_dumpster_3a`,
        `prop_skip_08a`,
        `prop_dumpster_4b`,
        `prop_bin_14a`,
        `prop_skip_03`,
        `prop_dumpster_01a`,
        `prop_dumpster_4a`,
        `prop_skip_10a`,
        `prop_dumpster_02b`,
        `prop_bin_14b`,
        `prop_skip_06a`,
        `prop_dumpster_02a`,
        `prop_bin_07a`,
        `prop_skip_02a`,
        -- big ^
    }
}