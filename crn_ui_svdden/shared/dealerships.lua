Config.dealerships = {
    { -- PDM
        coords = vector4(-57.2029, -1097.3854, 26.4223, 208.1806),
        dealershipName = 'Deluxe Motorsports',
        dealerName = 'Mellisa',
        currency = 'money',
        interactionDistance = 2.0,
        blipData = {
            coords = vector3(-56.7760, -1098.6674, 26.4223), -- This is the location of the blip
            sprite = 596, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
            color = 0, -- This is the color of the blip
            scale = 0.6, -- This is the scale of the blip
            name = 'Premium Deluxe Motorsports', -- This is the name of the blip
            shortRange = true, -- This will make the blip only show up when you are close to it
        },
        pedData = {
            coords = vector4(-56.7760, -1098.6674, 25.4223, 39.9579), -- This is the location of the ped
            pedModel = 'a_f_y_femaleagent', -- This is the model of the ped
            animation = 'WORLD_HUMAN_CLIPBOARD', -- This is the animation the ped will play (https://wiki.rage.mp/index.php?title=Scenarios)
            extraData = {
                freezeEntity = true, -- This will freeze the ped in place
                invincible = true, -- This will make the ped invincible to damage
                blockingEvents = true, -- This will block events from being triggered
            }
        },
        vehilcePreviewData = { 
            coords = vector4(-146.7585, -595.6647, 167.0000, 341.9688), -- This is the location of the vehicle preview
            cam = vector3(-149.7677, -593.2922, 167.0000), -- This is the location of the camera for the vehicle preview
        },
        testDriveCoords = vector4(-46.6465, -1075.7219, 27.0371, 71.5180), -- This is the location of the test drive
        buyVehicleSpawn = vector4(-17.1704, -1098.9669, 26.9482, 162.8059) -- This is the location of the vehicle spawn after buying
    },
    { -- Donor Dealership
        coords = vector4(-768.1225, -1051.7468, 13.4225, 109.6930),
        dealershipName = 'Donor Dealership',
        dealerName = 'Marie',
        currency = 'tbx_black_diamonds',
        interactionDistance = 2.0,
        blipData = {
            coords = vector3(-768.1225, -1051.7468, 13.0225), -- This is the location of the blip
            sprite = 304, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
            color = 73, -- This is the color of the blip
            scale = 0.6, -- This is the scale of the blip
            name = 'Donor Dealership', -- This is the name of the blip
            shortRange = true, -- This will make the blip only show up when you are close to it
        },
        pedData = {
            coords = vector4(-768.1225, -1051.7468, 12.0225, 109.6930), -- This is the location of the ped
            pedModel = 'a_f_y_femaleagent', -- This is the model of the ped
            animation = 'WORLD_HUMAN_CLIPBOARD', -- This is the animation the ped will play (https://wiki.rage.mp/index.php?title=Scenarios)
            extraData = {
                freezeEntity = true, -- This will freeze the ped in place
                invincible = true, -- This will make the ped invincible to damage
                blockingEvents = true, -- This will block events from being triggered
            }
        },
        vehilcePreviewData = { 
            coords = vector4(-146.7585, -595.6647, 167.0000, 341.9688), -- This is the location of the vehicle preview
            cam = vector3(-149.7677, -593.2922, 167.0000), -- This is the location of the camera for the vehicle preview
        },
        testDriveCoords = vector4(-765.1329, -1002.8569, 13.5553, 27.8927), -- This is the location of the test drive
        buyVehicleSpawn = vector4(-765.1329, -1002.8569, 13.5553, 27.89279) -- This is the location of the vehicle spawn after buying
    },
    { -- Exclusive Dealership
        coords = vector4(223.3076, 121.7820, 102.8371, 264.0165),
        dealershipName = 'Exclusive Motorsports',
        dealerName = 'Reed',
        currency = 'money',
        interactionDistance = 3.5,
        blipData = {
            coords = vector3(223.3076, 121.7820, 102.8371), -- This is the location of the blip
            sprite = 596, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
            color = 0, -- This is the color of the blip
            scale = 0.6, -- This is the scale of the blip
            name = 'Exclusive Motorsports', -- This is the name of the blip
            shortRange = true, -- This will make the blip only show up when you are close to it
        },
        pedData = {
            coords = vector4(223.3076, 121.7820, 101.8371, 264.0165), -- This is the location of the ped
            pedModel = 'IG_Charlie_Reed', -- This is the model of the ped
            animation = 'WORLD_HUMAN_GUARD_STAND_ARMY', -- This is the animation the ped will play (https://wiki.rage.mp/index.php?title=Scenarios)
            extraData = {
                freezeEntity = true, -- This will freeze the ped in place
                invincible = true, -- This will make the ped invincible to damage
                blockingEvents = true, -- This will block events from being triggered
            }
        },
        vehilcePreviewData = { 
            coords = vector4(-146.7585, -595.6647, 167.0000, 341.9688), -- This is the location of the vehicle preview
            cam = vector3(-149.7677, -593.2922, 167.0000), -- This is the location of the camera for the vehicle preview
        },
        testDriveCoords = vector4(234.5619, 121.0035, 102.6020, 258.6464), -- This is the location of the test drive
        buyVehicleSpawn = vector4(234.5619, 121.0035, 102.6020, 258.6464) -- This is the location of the vehicle spawn after buying
    },
    { -- Dono Boat Dealership
        coords = vector4(1411.5052, 3813.1633, 32.1858, 341.2671),
        dealershipName = 'Donor Boat Dealership',
        dealerName = 'Mark',
        currency = 'tbx_black_diamonds',
        interactionDistance = 2.0,
        blipData = {
            coords = vector3(1411.0319, 3811.5742, 32.3716), -- This is the location of the blip
            sprite = 427, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
            color = 73, -- This is the color of the blip
            scale = 0.7, -- This is the scale of the blip
            name = 'Dono Boat Dealership', -- This is the name of the blip
            shortRange = true, -- This will make the blip only show up when you are close to it
        },
        pedData = {
            coords = vector4(1411.0319, 3811.5742, 31.1716, 347.5008), -- This is the location of the ped
            pedModel = 'a_m_m_beach_01', -- This is the model of the ped
            animation = 'WORLD_HUMAN_CLIPBOARD', -- This is the animation the ped will play (https://wiki.rage.mp/index.php?title=Scenarios)
            extraData = {
                freezeEntity = true, -- This will freeze the ped in place
                invincible = true, -- This will make the ped invincible to damage
                blockingEvents = true, -- This will block events from being triggered
            }
        },
        vehilcePreviewData = { 
            coords = vector4(1392.9767, 3850.3687, 28.9257, 329.4380), -- This is the location of the vehicle preview
            cam = vector3(1389.3860, 3869.2007, 35.8529), -- This is the location of the camera for the vehicle preview
        },
        testDriveCoords = vector4(1384.1683, 3831.5591, 28.9153, 15.5157), -- This is the location of the test drive
        buyVehicleSpawn = vector4(1343.3953, 3805.0784, 28.5945, 338.1388) -- This is the location of the vehicle spawn after buying
    },
    { -- Offroad Dealership
        coords = vector4(1921.2535, 3725.5952, 32.5661, 259.3669),
        dealershipName = 'Offroad Dealership',
        dealerName = 'Billy',
        currency = 'tbx_black_diamonds',
        interactionDistance = 2.0,
        blipData = {
            coords = vector3(1922.6476, 3725.1680, 32.5661), -- This is the location of the blip
            sprite = 734, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
            color = 1, -- This is the color of the blip
            scale = 0.6, -- This is the scale of the blip
            name = 'Offroad Dealership', -- This is the name of the blip
            shortRange = true, -- This will make the blip only show up when you are close to it
        },
        pedData = {
            coords = vector4(1922.6476, 3725.1680, 31.5661, 78.4722), -- This is the location of the ped
            pedModel = 'a_m_m_hillbilly_02', -- This is the model of the ped
            animation = 'WORLD_HUMAN_CLIPBOARD', -- This is the animation the ped will play (https://wiki.rage.mp/index.php?title=Scenarios)
            extraData = {
                freezeEntity = true, -- This will freeze the ped in place
                invincible = true, -- This will make the ped invincible to damage
                blockingEvents = true, -- This will block events from being triggered
            }
        },
        vehilcePreviewData = { 
            coords = vector4(-146.7585, -595.6647, 167.0000, 341.9688), -- This is the location of the vehicle preview
            cam = vector3(-149.7677, -593.2922, 167.0000), -- This is the location of the camera for the vehicle preview
        },
        testDriveCoords = vector4(1902.2991, 3716.7656, 31.9479, 209.5311), -- This is the location of the test drive
        buyVehicleSpawn = vector4(1894.8844, 3736.0059, 31.9347, 299.1226) -- This is the location of the vehicle spawn after buying
    },
    { -- Boat Dealership
        coords = vector4(1418.6664, 3810.6577, 32.1858, 36.5776),
        dealershipName = 'Exotic Aquatics',
        dealerName = 'Bobby',
        currency = 'money',
        interactionDistance = 2.0,
        blipData = {
            coords = vector3(1418.6664, 3810.6577, 32.1858), -- This is the location of the blip
            sprite = 427, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
            color = 3, -- This is the color of the blip
            scale = 0.7, -- This is the scale of the blip
            name = 'Exotic Aquatics', -- This is the name of the blip
            shortRange = true, -- This will make the blip only show up when you are close to it
        },
        pedData = {
            coords = vector4(1418.6664, 3810.6577, 31.1858, 36.5776), -- This is the location of the ped
            pedModel = 'a_m_y_beach_01', -- This is the model of the ped
            animation = 'WORLD_HUMAN_CLIPBOARD', -- This is the animation the ped will play (https://wiki.rage.mp/index.php?title=Scenarios)
            extraData = {
                freezeEntity = true, -- This will freeze the ped in place
                invincible = true, -- This will make the ped invincible to damage
                blockingEvents = true, -- This will block events from being triggered
            }
        },
        vehilcePreviewData = { 
            coords = vector4(1392.9767, 3850.3687, 28.9257, 329.4380), -- This is the location of the vehicle preview
            cam = vector3(1389.3860, 3869.2007, 35.8529), -- This is the location of the camera for the vehicle preview
        },
        testDriveCoords = vector4(1384.1683, 3831.5591, 28.9153, 15.5157), -- This is the location of the test drive
        buyVehicleSpawn = vector4(1343.3953, 3805.0784, 28.5945, 338.1388) -- This is the location of the vehicle spawn after buying
    },
}