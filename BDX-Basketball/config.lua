Config = {}

-- HOW TO START A GAME:
-- First Player to Register need to Fill the Time and Rounds, also his team name.
-- Next Players to join the game need to just click register or fill opponent name in case that no one has register there yet.

-- HOW TO PLAY:
-- E: Pickup the Ball, also Drop the Ball if you already Bouncing.
-- Q: Steal the Ball (You need to be Close to the Ball Holder, Spam its not allowed).
-- R: Doge Players (No one can Steal you ball while performing this move, Spam its not Allowed).
-- Left Click: Dunk the Ball when Ball Holder its near by Oppenents Hoop area.
-- Right Click: Pass the Ball to Hoop near Team Mate.

-- END THE GAME:
-- Use Command /endbasketballgame to finish you current game early.

Config.Debug = true 

Config.Framework = "esx" -- Pick your framework: "qb", "esx", "vrp" or "custom".
Config.Target = "ox" -- 'none', 'ox', 'qb'
Config.ResourceName = nil -- Only for users that his Framwork Resource isnt located in the Default resource.
Config.TextFont = 4 -- For 3D Text when using 'none' target.
Config.DesignCount = 17 -- Increase if you add more balls png and ydr to their respective location.
Config.DesignPrice = 1000 -- The Price for the custom Ball design.
Config.PassRange = 16 -- Max Distance range to Pass the ball to a team mate.
Config.STEAL_COOLDOWN_MS = 2500 -- Waiting time to try Steal the ball.
Config.ROUTE_COOLDOWN_MS = 4000 -- Waiting time to doge Players while holding the ball.

-- Stamina System Configuration
Config.Stamina = {
    Enabled = true,              -- Enable/disable stamina system
    MaxStamina = 100,            -- Maximum stamina value
    DrainRate = 2.0,             -- Stamina drained per tick while sprinting (lower = longer sprint)
    RegenRate = 1.5,             -- Stamina regenerated per tick while not sprinting
    RegenDelay = 1.5,            -- Seconds to wait after stopping sprint before regen starts
    TickRate = 100,              -- Milliseconds between stamina updates (100 = 10 times per second)
    MinSprintStamina = 10,       -- Minimum stamina required to start sprinting
}

Config.Timers = {
    Start = 5, -- Waiting time to Start the Game.
    Round = 5, -- Waiting time per Round.
}
Config.Coords = {
    Peds = {
        Beach = { x = 813.1563, y = -281.2922, z = 66.4623, heading = 13.0053 },                 
    },
    Ball = {
        Beach = { x = 820.0893, y = -278.3827, z = 65.4625, heading = 190.6223 }        
    },
    Camera = { 
        Beach = { x = 820.0839, y = -276.9972, z = 66.3319, heading = 174.9031 },              
    },
} 
Config.Shops = {
    ShopPeds = {
        {
            Position = vector4(Config.Coords.Peds.Beach.x, Config.Coords.Peds.Beach.y, Config.Coords.Peds.Beach.z, Config.Coords.Peds.Beach.heading),
            Model = `a_m_y_motox_02`,
            Scenarios = 'WORLD_HUMAN_AA_COFFEE',
            StoreName = "Beach", -- Unique store ID
        },
    },
}
Config.Language = {
    Info = {
        ['warning'] = 'The Workshop is currently in use by another player.',
        ['purchase'] = 'You have successfully purchased this item!',
        ['failed'] = 'You dont have enough money.',
        ['error'] = 'You already own this Item.'
    },
    Store = {
        ['target'] = 'Open Jam Shop.',
        ['text'] = '[E] Open Jam Shop.'
    },
}
-- Game start positions where players can register
Config.GameStartPositions = {
    Spot1 = {x = -1313.8605, y = -1598.9260, z = 4.2312},
    Spot2 = {x = -1275.1116, y = -1530.6647, z = 4.3136},
    Spot3 = {x = -224.2627,  y = -1536.0229, z = 31.6283},
    Spot4 = {x = -910.1489,  y = -724.5370,  z = 19.9164},
    Spot5 = {x = 789.6991, y = -241.5437, z = 66.2129}, 
    Spot6 = {x = 1491.9227,  y = 3644.6123,  z = 34.4645},
}
-- Basketball hoops for each spot
Config.BasketballHoopPositions = {
    Spot1 = {
        {label = "1A", x = -1320.6896, y = -1587.1622, z = 7.0194}, -- Spot 1, Hoop A
        {label = "1B", x = -1307.0466, y = -1610.7548, z = 6.8827}, -- Spot 1, Hoop B
    },
    Spot2 = {
        {label = "1A", x = -1278.2438, y = -1544.0116, z = 7.0052}, -- Spot 2, Hoop A
        {label = "1B", x = -1271.9911, y = -1517.4589, z = 7.0172}, -- Spot 2, Hoop B
    },
    Spot3 = {
        {label = "1A", x = -231.8364,  y = -1545.0410, z = 34.3273}, -- Spot 3, Hoop A
        {label = "1B", x = -216.6852,  y = -1526.9546, z = 34.3273}, -- Spot 3, Hoop B
    },
    Spot4 = {
        {label = "1A", x = -910.1739, y = -712.7087, z = 22.6323}, -- Spot 4, Hoop A
        {label = "1B", x = -910.1548, y = -736.2028, z = 22.6322}, -- Spot 4, Hoop B 
    },
    Spot5 = {
        {label = "1A", x = 785.4821, y = -250.992722, z = 68.83688}, -- Spot 5, Hoop A
        {label = "1B", x = 793.919067, y = -232.356918, z = 68.83688}, -- Spot 5, Hoop B
    },
    Spot6 = {
        {label = "1A", x = 1480.9650, y = 3639.7534, z = 37.6545}, -- Spot 6, Hoop A 
        {label = "1B", x = 1503.3954, y = 3649.8015, z = 37.6548}, -- Spot 6, Hoop B 
    },
}
-- Define team positions (Spot 1 example, with 5 positions for each team)
Config.TeamPositions = {
    Spot1 = {
        TeamA = {
            {x = -1314.7323, y = -1597.4421, z = 3.2312, heading = 213.1122}, -- Team A Player 1
            {x = -1316.5056, y = -1587.1721, z = 3.2312, heading = 208.2644}, -- Team A Player 2   
            {x = -1322.4135, y = -1591.1829, z = 3.2312, heading = 209.8116}, -- Team A Player 3
            {x = -1319.3962, y = -1596.4387, z = 3.2312, heading = 212.9895}, -- Team A Player 4
            {x = -1313.0004, y = -1592.3208, z = 3.2312, heading = 208.3912}, -- Team A Player 5      
        },
        TeamB = {
            {x = -1312.8086, y = -1600.4865, z = 3.2312, heading = 29.0326}, -- Team B Player 1
            {x = -1308.1870, y = -1601.2612, z = 3.2312, heading = 23.1760}, -- Team B Player 2
            {x = -1304.2836, y = -1607.5723, z = 3.2312, heading = 25.1375}, -- Team B Player 3
            {x = -1310.5879, y = -1611.4282, z = 3.2312, heading = 27.4216}, -- Team B Player 4
            {x = -1314.7966, y = -1605.2820, z = 3.2312, heading = 29.2187}, -- Team B Player 5
        }
    },
    Spot2 = {
        TeamA = {
            {x = -1275.4261, y = -1532.7789, z = 3.3136, heading = 347.0098}, -- Team A Player 1
            {x = -1281.2719, y = -1542.1182, z = 3.3137, heading = 346.3868}, -- Team A Player 2   
            {x = -1280.6920, y = -1535.0884, z = 3.3137, heading = 341.2144}, -- Team A Player 3
            {x = -1274.0010, y = -1543.3911, z = 3.3136, heading = 347.0180}, -- Team A Player 4
            {x = -1272.5353, y = -1536.8350, z = 3.3136, heading = 336.2820}, -- Team A Player 5      
        },
        TeamB = {
            {x = -1274.9510, y = -1529.0149, z = 3.3136, heading = 162.8761}, -- Team B Player 1
            {x = -1269.0314, y = -1519.4021, z = 3.3136, heading = 165.4559}, -- Team B Player 2
            {x = -1270.2469, y = -1526.4498, z = 3.3136, heading = 166.3289}, -- Team B Player 3
            {x = -1275.9934, y = -1517.6094, z = 3.3136, heading = 164.7005}, -- Team B Player 4
            {x = -1277.5088, y = -1524.4733, z = 3.3136, heading = 156.0823}, -- Team B Player 5
        }
    },
    Spot3 = {
        TeamA = {
            {x = -225.2895, y = -1537.4614, z = 30.6227, heading = 315.2437}, -- Team A Player 1
            {x = -234.5821, y = -1542.5212, z = 30.5922, heading = 318.8262}, -- Team A Player 2   
            {x = -230.8632, y = -1537.6990, z = 30.6097, heading = 319.8181}, -- Team A Player 3
            {x = -228.8389, y = -1547.0582, z = 30.5884, heading = 318.8306}, -- Team A Player 4
            {x = -225.1670, y = -1542.8130, z = 30.6057, heading = 318.4273}, -- Team A Player 5      
        },
        TeamB = {
            {x = -223.0403, y = -1534.6741, z = 30.6249, heading = 135.7796}, -- Team B Player 1
            {x = -213.8739, y = -1529.9338, z = 30.6060, heading = 133.5814}, -- Team B Player 2
            {x = -217.0749, y = -1533.6982, z = 30.6146, heading = 136.4877}, -- Team B Player 3
            {x = -219.8850, y = -1524.8539, z = 30.6089, heading = 134.8565}, -- Team B Player 4
            {x = -223.5313, y = -1528.9746, z = 30.6185, heading = 138.1605}, -- Team B Player 5
        }
    },
    Spot4 = {
        TeamA = {
            {x = -910.2393, y = -722.7260, z = 18.9154, heading = 181.4224}, -- Team A Player 1
            {x = -906.7487, y = -712.6912, z = 18.9109, heading = 174.6692}, -- Team A Player 2   
            {x = -906.4224, y = -718.1835, z = 18.9139, heading = 183.7938}, -- Team A Player 3
            {x = -913.8997, y = -712.6031, z = 18.9090, heading = 181.2448}, -- Team A Player 4
            {x = -913.8627, y = -718.4980, z = 18.9123, heading = 182.8068}, -- Team A Player 5      
        },
        TeamB = {
            {x = -910.1265, y = -726.1545, z = 18.9176, heading = 1.6939},   -- Team B Player 1
            {x = -913.8290, y = -735.6437, z = 18.9250, heading = 349.7444}, -- Team B Player 2
            {x = -914.0140, y = -730.4129, z = 18.9211, heading = 2.5077},   -- Team B Player 3
            {x = -906.6805, y = -735.3353, z = 18.9242, heading = 357.4924}, -- Team B Player 4
            {x = -906.7444, y = -730.3101, z = 18.9204, heading = 2.2570},   -- Team B Player 5
        }
    },      
    Spot5 = {
        TeamA = {
            {x = 788.5620, y = -243.9668, z = 66.2111, heading = 334.8792}, -- Team A Player 1
            {x = 782.5851, y = -244.4857, z = 66.2090, heading = 315.4490}, -- Team A Player 2   
            {x = 785.4650, y = -243.6384, z = 66.2104, heading = 316.7845}, -- Team A Player 3
            {x = 792.0374, y = -247.4959, z = 66.2097, heading = 356.5309}, -- Team A Player 4
            {x = 791.2246, y = -250.2907, z = 66.2073, heading = 9.5133}, -- Team A Player 5      
        },
        TeamB = {
            {x = 790.5598, y = -239.3185, z = 66.2114, heading = 154.3661}, -- Team B Player 1
            {x = 794.5391, y = -239.8703, z = 66.2108, heading = 137.1353}, -- Team B Player 2
            {x = 786.1567, y = -236.7352, z = 66.2105, heading = 176.1518}, -- Team B Player 3
            {x = 787.6129, y = -233.0400, z = 66.2076, heading = 175.4392}, -- Team B Player 4
            {x = 797.9343, y = -238.2115, z = 66.2092, heading = 133.7584}, -- Team B Player 5
        }
    },
    Spot6 = {
        TeamA = {
            {x = 1491.2798, y = 3639.4092, z = 34.4652, heading = 303.0736}, -- Team A Player 1 
            {x = 1488.4194, y = 3646.4917, z = 34.4652, heading = 296.6570}, -- Team A Player 2 
            {x = 1486.9784, y = 3637.5215, z = 34.4664, heading = 302.2068}, -- Team A Player 3 
            {x = 1483.5159, y = 3645.3613, z = 34.4663, heading = 295.6572}, -- Team A Player 4 
            {x = 1485.3048, y = 3641.3318, z = 34.4663, heading = 297.4687}, -- Team A Player 5 
        },
        TeamB = {
            {x = 1495.7233, y = 3641.9309, z = 34.4641, heading = 119.0136}, -- Team B Player 1 
            {x = 1492.5734, y = 3649.8887, z = 34.4660, heading = 122.8883}, -- Team B Player 2 
            {x = 1501.0579, y = 3643.6030, z = 34.4659, heading = 114.3800}, -- Team B Player 3
            {x = 1496.8892, y = 3651.6511, z = 34.4671, heading = 123.9625}, -- Team B Player 4 
            {x = 1498.7046, y = 3647.7371, z = 34.4667, heading = 122.7237}, -- Team B Player 5 
        }
    },
}


