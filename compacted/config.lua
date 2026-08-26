ESX = exports.es_extended:getSharedObject()

Config = Config or {}

-- Don't Touch, Will Write Code For This Later On, As we use an absurd amount of groups, will make it easier when doing group checks
Config.StaffPermissions = {
    -- admin = true,
    trialstaff = true,
    senior = true,
    lead = true,
    developer = true,
    management = true,
    support = true,
    tester = true,
    gadmin = true,
    sadmin = true,
    ladmin = true,
}

Config.AnnouncePerms = {
    developer = true,
    management = true,
    gadmin = true,
    owner = true,
    sadmin = true,
    ladmin = true,
}

Config.StaffChatPermissions = {
    -- admin = true,
    trialstaff = true,
    senior = true,
    lead = true,
    developer = true,
    management = true,
    support = true,
    tester = true,
    gadmin = true,
    sadmin = true,
    ladmin = true,
}

Config.ReportPermmissions = {
    -- admin = true,
    trialstaff = true,
    senior = true,
    lead = true,
    developer = true,
    management = true,
    support = true,
    tester = true,
    gadmin = true,
    sadmin = true,
    ladmin = true,
}

Config.blips = {
    {
        coords = vector3(-308.6889, -1642.7588, 31.8488),
        sprite = 140,
        color = 2,
        scale = 0.7,
        name = 'Weed Field', -- This is the name of the blip
        shortRange = true, -- This will make the blip only show up when you are close to it
    },
    {
        coords = vector3(4128.9517, -4464.6670, 2.09),
        sprite = 68,
        color = 5,
        scale = 0.7,
        name = 'Cayo Rental', -- This is the name of the blip
        shortRange = true, -- This will make the blip only show up when you are close to it
    },
	{
		coords = vector3(-48.3700, -1238.6000, 29.4260), -- This is the location of the blip
		sprite = 84, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
		color = 1, -- This is the color of the blip
		scale = 0.7, -- This is the scale of the blip
		name = 'Black Diamond Market', -- This is the name of the blip
		shortRange = true, -- This will make the blip only show up when you are close to it
	},
	{
		coords = vector3(1971.6279, 3829.2190, 31.5107), -- Sandy Shores Black Diamond Market ped
		sprite = 84, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
		color = 1, -- This is the color of the blip
		scale = 0.7, -- This is the scale of the blip
		name = 'Black Diamond Market', -- This is the name of the blip
		shortRange = true, -- This will make the blip only show up when you are close to it
	},
	{
		coords = vector3(1996.7092, 3039.9065, 47.027), -- This is the location of the blip
		sprite = 512, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
		color = 3, -- This is the color of the blip
		scale = 0.7, -- This is the scale of the blip
		name = 'Off Road Rental', -- This is the name of the blip
		shortRange = true, -- This will make the blip only show up when you are close to it
	},
	{
		coords = vector3(1472.8849, 3684.6838, 34.4668), -- This is the location of the blip
		sprite = 475, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
		color = 46, -- This is the color of the blip
		scale = 0.7, -- This is the scale of the blip
		name = 'Sandy Civ Block', -- This is the name of the blip
		shortRange = true, -- This will make the blip only show up when you are close to it
	},
	{
		coords = vector3(770.3279, -233.2499, 66.6279), -- This is the location of the blip
		sprite = 475, -- This is the sprite of the blip (https://docs.fivem.net/docs/game-references/blips/)
		color = 46, -- This is the color of the blip
		scale = 0.7, -- This is the scale of the blip
		name = 'Los Santos Civ Block', -- This is the name of the blip
		shortRange = true, -- This will make the blip only show up when you are close to it
	},
}

Config.licenseAllowedJobs = {
	['police'] = true
}

Config.vehilepush = {
	target = false, -- Use target system for vehicle push (disables TextUI)
	targetSystem = 'ox_target', -- Target System to use. ox_target, qtarget, qb-target
	Usebones = true, -- Use bones for vehicle push
	PushKey = 'E', -- Key to push vehicle
	TurnRightKey = 'D', -- Keys to turn the vehicle while pushing it.
	TurnLeftKey = 'A', -- Keys to turn the vehicle while pushing it.
	TextUI = true, -- Use Text UI for vehicle push
	useOTSkills = false, -- Use OT Skills for XP gain from pushing vehicles. Found here: https://otstudios.tebex.io
	maxReward = 20, -- Max amount of xp that can be gained from pushing a vehicle per push, make sure this is the same or less than what is set for strength in your OT_skills config.
	healthMin = 100.0, -- Minimum health of vehicle to be able to push it.
	blacklist = { -- blacklist vehicle models from being pushed.
		[`phantom`] = true
	}
}

greenzoneConfig = greenzoneConfig or {}

greenzoneConfig.config = {
    blockedKeys = { --Disable all LEFT/RIGHT MOUSE BUTTON KEYS
        24, 
        25, 
        106,
        122,
        135,
        142,
        257,
        329,
        346,
    },

    disableCollison = false, --Set true to enable | Disabling collision with vehicles and peds

    wait = false,
    waitSeconds = 100, --4 seconds / Set how much time must to wait to make can player attack from greenzone

    callback = function(a)
        --Notification setting. You can attach your notifications here.
        if a == "join" then
            lib.notify({
                title = 'Greenzone',
                description = 'You are now in a greenzone.',
                icon = 'shield',
                position = 'top',
                style = {
                    backgroundColor = '#1b1c22',
                },
                iconColor = '#71BC68',
            })
        elseif a == "leave" then
            lib.notify({
                title = 'Greenzone',
                description = 'You are now leaving the greenzone.',
                icon = 'shield',
                position = 'top',
                style = {
                    backgroundColor = '#1b1c22',
                },
                iconColor = '#A7171A',
            })
        elseif a == "adminjoin" then
            lib.notify({
                title = 'Admin Zone',
                description = 'You are now in a admin greenzone.',
                icon = 'shield',
                position = 'top',
                style = {
                    backgroundColor = '#1b1c22',
                },
                iconColor = '#A7171A',
            })
        elseif a == "adminleave" then
            lib.notify({
                title = 'Admin Zone',
                description = 'You are now leaving a admin greenzone.',
                icon = 'shield',
                position = 'top',
                style = {
                    backgroundColor = '#1b1c22',
                },
                iconColor = '#A7171A',
            })
        end
    end,

    greenzones = {
        ["Hospital"] = {
            coords = vector3(-865.61, -2122.30, 9.92),
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 160.0, -- Radius for greenzone
            blip = true,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 170.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["Admin Center 2"] = {
            coords = vector3(7467.7349, 7501.7466, 9.7695),
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 300.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 300.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Admin Center 2", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["Bahama"] = {
            coords = {
                vec3(-1389.6999511719, -643.65002441406, 29.0),
		        vec3(-1416.1500244141, -602.65002441406, 29.0),
		        vec3(-1383.0, -582.0, 29.0),
		        vec3(-1356.0, -622.0, 29.0),
		        vec3(-1356.0, -622.0, 29.0)
            },
            thickness = 15,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 45.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 45.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Admin Center", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },
        ["baddiesmech"] = {
            coords = vector3(-789.8848, -215.9715, 37.4836),
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 45.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 75.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Admin Center", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },
		["Suburban"] = {
            coords = {
				vec3(166.0, -212.0, 54.0),
				vec3(75.0, -180.0, 54.0),
				vec3(56.0, -225.0, 54.0),
				vec3(151.0, -255.0, 54.0),
			},
			thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["Mining"] = {
            coords = {
                vec3(2538.0, 1613.0, 30.0),
                vec3(2424.0, 1609.0, 34.0),
                vec3(2417.0, 1493.0, 38.0),
                vec3(2506.0, 1492.0, 34.0),
            },
            thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["kggun"] = {
            coords = {
                vec3(-1314.9000244141, -394.70001220703, 37.0),
		        vec3(-1313.25, -388.0, 37.0),
		        vec3(-1303.75, -390.25, 37.0),
		        vec3(-1305.25, -395.25, 37.0),
		        vec3(-1307.25, -394.75, 37.0),
		        vec3(-1309.0500488281, -395.75, 37.0),
		        vec3(-1309.25, -396.85000610352, 37.0),
            },
            thickness = 34.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },


    ------ BUSINESS ZONES ------
        ["saltlab"] = {
            coords = vector3(-3078.5732, 438.5887, 6.9734),
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 45.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 45.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Salt Lab Mech", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },
        
        ["bennysmotorworks"] = {
            coords = {
                vector3(-185.1819, -1344.4949, 31.2498),
                vector3(-247.4388, -1345.4556, 31.2262),
                vector3(-249.6959, -1307.3127, 31.2742),
                vector3(-182.1033, -1307.2960, 31.2974) 
            },  
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 45.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 45.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Bennys Motorworks", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },

        ["burntrubbaexotics"] = {
            coords = {
                vector3(2290.0, 3084.0, 47.0),
                vector3(2266.0, 3144.0, 47.0),
                vector3(2391.0, 3176.0, 47.0),
                vector3(2422.0, 3130.0, 47.0),
                vector3(2415.0, 3081.0, 47.0) 
            },  
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 45.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 45.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Burnt Rubber Exotics", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },

        ["freebands"] = {
            coords = {
                vector3(844.2661, -1022.7849, 27.8114),
                vector3(843.6070, -1031.4337, 28.1949),
                vector3(837.7628, -1020.7319, 27.2959)
            },
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 45.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 45.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Freebands Armory", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },
        ["luxx"] = {
            coords = {
                vec3(-42.0, -1264.0, 29.0),
		        vec3(-92.5, -1264.0, 29.0),
		        vec3(-93.0, -1293.0, 29.0),
		        vec3(-43.0, -1293.0, 29.0),
            },
            thickness = 29.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 45.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 45.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Luxx Night Club", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },
		["triggerhappy"] = {
            coords = {
				vec3(-328.0, 6068.0, 31.0),
				vec3(-306.0, 6093.0, 31.0),
				vec3(-329.0, 6118.0, 31.0),
				vec3(-353.0, 6094.0, 31.0),
			},
			thickness = 64.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
    	["RunNGunIslandSmoothie"] = {
            coords = {
				vec3(1117.0, -508.0, 64.0),
				vec3(1159.0, -505.0, 64.0),
				vec3(1166.0, -502.0, 64.0),
				vec3(1166.0, -501.0, 64.0),
				vec3(1177.0, -458.0, 64.0),
				vec3(1180.0, -446.0, 64.0),
				vec3(1136.0, -435.0, 64.0),
			},
			thickness = 29.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
		["FemaleBarber"] = {
            coords = {
				vec3(1218.0, -518.0, 66.0),
				vec3(1196.0, -509.0, 66.0),
				vec3(1192.0, -504.0, 66.0),
				vec3(1192.0, -498.0, 66.0),
				vec3(1199.0, -467.0, 66.0),
				vec3(1226.0, -475.0, 66.0),
				vec3(1223.0, -491.0, 66.0),
				vec3(1226.0, -491.0, 66.0),
			},
			thickness = 16.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
		["Hornys"] = {
            coords = {
				vec3(1264.0, -390.0, 69.0),
				vec3(1253.0, -382.0, 69.0),
				vec3(1243.0, -377.0, 69.0),
				vec3(1230.0, -372.0, 69.0),
				vec3(1226.0, -368.0, 69.0),
				vec3(1225.0, -360.0, 69.0),
				vec3(1226.0, -345.0, 69.0),
				vec3(1225.0, -328.0, 69.0),
				vec3(1232.0, -327.0, 69.0),
				vec3(1269.0, -333.0, 69.0),
				vec3(1283.0, -366.0, 69.0),
			},
			thickness = 14.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["westvinewood"] = {
            coords = {
                vec3(-629.65002441406, 297.04998779297, 82.0),
		        vec3(-650.0, 299.0, 82.0),
		        vec3(-648.0, 317.70001220703, 82.0),
		        vec3(-651.0, 318.0, 82.0),
		        vec3(-651.0, 315.0, 82.0),
		        vec3(-658.0, 316.0, 82.0),
		        vec3(-687.45001220703, 318.85000610352, 82.0),
		        vec3(-685.40002441406, 343.35000610352, 82.0),
		        vec3(-648.79998779297, 341.29998779297, 82.0),
            },
            thickness = 24.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["vu"] = {
            coords = {
                vec3(101.0, -1326.0, 29.0),
		        vec3(162.0, -1287.0, 29.0),
		        vec3(128.0, -1244.0, 29.0),
		        vec3(77.0, -1256.0, 29.0),
		        vec3(74.0, -1285.0, 29.0),
            },
            thickness = 25.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
		["ShinerZ"] = {
            coords = {
				vec3(-1382.3499755859, -257.70001220703, 43.0),
		        vec3(-1383.5500488281, -257.60000610352, 43.0),
		        vec3(-1399.25, -272.95001220703, 43.0),
		        vec3(-1403.3499755859, -269.10000610352, 43.0),
		        vec3(-1400.0, -266.0, 43.0),
		        vec3(-1401.75, -263.75, 43.0),
		        vec3(-1397.3000488281, -259.89999389648, 43.0),
		        vec3(-1409.0999755859, -247.0, 43.0),
		        vec3(-1404.6500244141, -243.0, 43.0),
		        vec3(-1397.3499755859, -236.25, 43.0),
		        vec3(-1382.25, -252.89999389648, 43.0),
		        vec3(-1382.5500488281, -253.75, 43.0),
		        vec3(-1381.5999755859, -253.85000610352, 43.0),
			},
			thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["weedworld"] = {
            coords = {
				vec3(55.0, -137.0, 55.0),
		        vec3(37.0, -130.0, 55.0),
		        vec3(47.0, -106.0, 55.0),
		        vec3(72.0, -115.0, 55.0),
			},
			thickness = 26.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
		["50Shotz"] = {
            coords = {
				vec3(-1309.0, -367.0, 37.0),
				vec3(-1291.0, -396.0, 37.0),
				vec3(-1340.0, -424.0, 37.0),
				vec3(-1361.0, -397.0, 37.0),
			},
			thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
		["Puff Puff"] = {
            coords = {
				vec3(-1548.0, -477.0, 35.0),
				vec3(-1487.0, -433.0, 35.0),
				vec3(-1529.0, -392.0, 35.0),
				vec3(-1573.0, -454.0, 35.0),
			},
			thickness = 21.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["super_mech"] = {
            coords = {
                vec3(792.0, -997.0, 26.0),
                vec3(793.0, -955.0, 26.0),
                vec3(791.0, -912.0, 25.0),
                vec3(850.0, -911.0, 25.0),
                vec3(851.0, -951.0, 26.0),
                vec3(853.0, -997.0, 29.0),
                vec3(853.0, -1017.0, 30.0),
                vec3(823.0, -1024.0, 26.0),
                vec3(794.0, -1026.0, 26.0),
            },
            thickness = 34.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["d_customs"] = {
            coords = {
                vec3(92.0, -1541.0, 29.0),
                vec3(147.0, -1587.0, 29.0),
                vec3(53.0, -1650.0, 29.0),
                vec3(92.0, -1540.0, 29.0),
                vec3(74.0, -1534.0, 29.0),
                vec3(18.0, -1591.0, 29.0),
                vec3(38.0, -1554.0, 29.0),
                vec3(11.0, -1586.0, 29.0),
            },
            thickness = 34.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["pbuppergarage"] = {
            coords = {
                vec3(294.0, -360.0, 45.0),
		        vec3(305.0, -328.0, 45.0),
		        vec3(268.0, -315.0, 45.0),
		        vec3(257.0, -346.0, 45.0),
            },
            thickness = 53.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["mirror_restaurant"] = {
            coords = {
                vec3(-1266.0, -1059.0, 8.0),
                vec3(-1354.0, -1110.0, 4.0),
                vec3(-1389.0, -1051.0, 4.0),
                vec3(-1296.0, -999.0, 7.0),
            },
            thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["twin_triggers"] = {
            coords = vector3(213.7244, -31.1666, 69.6948),
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 50.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 45.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Twin Triggers", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },
        ["twin_triggers2"] = {
            coords = vector3(286.8318, -60.1646, 70.1905),
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            radius = 35.0, -- Radius for greenzone
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 45.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 30, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Twin Triggers", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0, -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
            adminCenter = true
        },
        ["SmokingVape"] = { 
            coords = {
                vec3(-496.0, 276.0, 83.0),
                vec3(-505.0, 276.0, 83.0),
                vec3(-503.0, 300.0, 83.0),
                vec3(-494.0, 301.0, 83.0),
            },
            thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["uwucafe"] = { 
            coords = {
                vec3(-564.0, -1086.0, 22.0),
                vec3(-603.0, -1086.0, 22.0),
                vec3(-604.0, -1046.0, 21.0),
                vec3(-564.0, -1046.0, 22.0),
            },
            thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
         ["pentgarage"] = { 
            coords = {
                vec3(-651.0, -767.0, 25.0),
                vec3(-652.0, -820.0, 24.0),
                vec3(-735.0, -822.0, 22.0),
                vec3(-737.0, -767.0, 25.0),
            },
            thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["maingunNpdm"] = { 
            coords = {
                vec3(20.200000762939, -1115.3000488281, 30.0),
		        vec3(35.549999237061, -1076.0999755859, 30.0),
		        vec3(29.049999237061, -1073.8499755859, 30.0),
		        vec3(25.200000762939, -1088.5500488281, 30.0),
		        vec3(21.10000038147, -1099.6999511719, 30.0),
		        vec3(7.5500001907349, -1094.8000488281, 30.0),
		        vec3(5.1999998092651, -1102.1999511719, 30.0),
		        vec3(6.9499998092651, -1103.0, 30.0),
		        vec3(5.6999998092651, -1106.8000488281, 30.0),
		        vec3(9.1000003814697, -1108.0, 30.0),
		        vec3(9.9499998092651, -1109.8499755859, 30.0),
		        vec3(9.1999998092651, -1111.8499755859, 30.0),
            },
            thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["wedding_chapel"] = {
            coords = {
                vec3(-786.0, -46.0, 37.0),
                vec3(-736.0, -21.0, 37.0),
                vec3(-757.0, 23.0, 40.0),
                vec3(-803.0, -1.0, 41.0),
            },
            thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
		["guns4repair"] = {
            coords = {
				vec3(851.0, -1011.0, 29.0),
				vec3(827.0, -1012.0, 29.0),
				vec3(829.0, -1045.0, 29.0),
				vec3(860.0, -1047.0, 29.0),
			},
			thickness = 17.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["boathouse"] = {
            coords = {
                vec3(1542.0, 3760.0, 34.0),
                vec3(1499.0, 3733.0, 34.0),
                vec3(1470.0, 3778.0, 34.0),
                vec3(1565.0, 3825.0, 34.0),
                vec3(1577.0, 3786.0, 34.0),
			},
			thickness = 17.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["gunsforfun"] = {
            coords = {
                vec3(1697.0, 3753.0, 35.0),
                vec3(1693.0, 3757.0, 35.0),
                vec3(1692.0, 3756.0, 35.0),
                vec3(1692.0, 3756.0, 35.0),
                vec3(1690.0, 3757.0, 35.0),
                vec3(1692.0, 3759.0, 35.0),
                vec3(1694.0, 3761.0, 35.0),
                vec3(1697.0, 3759.0, 35.0),
                vec3(1699.0, 3759.0, 35.0),
                vec3(1698.0, 3760.0, 35.0),
                vec3(1701.0, 3756.0, 35.0),
                vec3(1700.0, 3758.0, 35.0),
                vec3(1701.0, 3756.0, 35.0),
                vec3(1699.0, 3748.0, 35.0),
			},
			thickness = 17.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["dablock"] = {
            coords = {
				vec3(258.0, -1967.0, 23.0),
                vec3(234.0, -1944.0, 23.0),
                vec3(222.0, -1957.0, 23.0),
                vec3(250.0, -1980.0, 23.0),
			},
			thickness = 15.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
		["highnotes"] = {
            coords = {
				vec3(-824.0, -245.0, 37.0),
				vec3(-863.0, -177.0, 37.0),
				vec3(-887.0, -191.0, 37.0),
				vec3(-846.0, -280.0, 37.0),
			},
			thickness = 142.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["triggered"] = {
            coords = {
                vec3(827.97998046875, -2190.330078125, 27.9),
                vec3(827.55999755859, -2148.7900390625, 27.9),
                vec3(808.07000732422, -2149.0, 27.9),
                vec3(808.27001953125, -2191.830078125, 27.9),
	        },
	        thickness = 15.25,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        --palace
        ["palace"] = {
            coords = {
				vec3(355.0, 166.0, 128.0),
		        vec3(385.0, 249.0, 128.0),
		        vec3(345.0, 264.0, 128.0),
		        vec3(316.0, 181.0, 128.0),
			},
			thickness = 67.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["palace_lounge"] = {
            coords = {
				vec3(368.70001220703, 215.35000610352, 99.0),
                vec3(364.75, 212.55000305176, 99.0),
                vec3(362.54998779297, 209.0, 99.0),
                vec3(361.60000610352, 206.05000305176, 99.0),
                vec3(362.70001220703, 198.94999694824, 99.0),
                vec3(365.0, 198.0, 99.0),
                vec3(363.79998779297, 195.0, 99.0),
                vec3(370.10000610352, 192.80000305176, 99.0),
                vec3(377.5, 213.10000610352, 99.0),
                vec3(370.95001220703, 215.39999389648, 99.0),
			},
			thickness = 7.3,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["aldente"] = {
            coords = {
		        vec3(116.0, -13.0, 68.0),
		        vec3(114.13999938965, -12.260000228882, 68.0),
		        vec3(43.240001678467, 16.709999084473, 68.0),
		        vec3(52.919998168945, 34.459999084473, 68.0),
		        vec3(129.00999450684, 9.3699998855591, 68.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["monroesandbox"] = {
            coords = {
		        vec3(-714.0, -56.0, 38.0),
		        vec3(-714.0, -56.0, 38.0),
		        vec3(-707.0, -70.0, 38.0),
		        vec3(-760.0, -99.0, 38.0),
		        vec3(-770.0, -82.0, 38.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["monroecoffee"] = {
            coords = {
		        vec3(-1212.0, -284.0, 38.0),
		        vec3(-1238.0, -297.0, 38.0),
		        vec3(-1253.0, -261.0, 38.0),
		        vec3(-1234.0, -247.0, 38.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["bmore"] = {
            coords = {
                vec3(802.0, -928.0, 26.0),
                vec3(842.0, -928.0, 26.0),
                vec3(846.0, -1003.0, 26.0),
                vec3(802.0, -1003.0, 26.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["ldorganics"] = {
            coords = {
		        vec3(-1152.0, -1415.0, 5.0),
		        vec3(-1136.0, -1405.0, 5.0),
		        vec3(-1120.0, -1431.0, 5.0),
		        vec3(-1139.0, -1444.0, 5.0),
		        vec3(-1154.0, -1416.0, 5.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["cfmech"] = {
            coords = {
		        vec3(-248.0, -1152.0, 23.0),
		        vec3(-130.0, -1152.0, 23.0),
		        vec3(-130.0, -1206.0, 23.0),
		        vec3(-245.0, -1202.0, 23.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["aquabar"] = {
            coords = {
		        vec3(-19.0, -965.0, 29.0),
		        vec3(38.0, -980.0, 29.0),
		        vec3(22.0, -1035.0, 29.0),
		        vec3(-37.0, -1013.0, 29.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["whitewidow"] = {
            coords = {
		        vec3(209.0, -238.0, 54.0),
		        vec3(197.0, -275.0, 54.0),
		        vec3(151.0, -258.0, 54.0),
		        vec3(165.0, -220.0, 54.0),
		        vec3(208.0, -235.0, 54.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["smc"] = {
            coords = {
		        vec3(-872.0, -819.0, 15.0),
		        vec3(-952.0, -819.0, 15.0),
		        vec3(-993.0, -795.0, 15.0),
		        vec3(-983.0, -752.0, 15.0),
		        vec3(-945.0, -735.0, 15.0),
		        vec3(-876.0, -739.0, 15.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["redwings"] = {
            coords = {
		        vec3(231.0, -1068.0, 29.0),
		        vec3(256.0, -1067.0, 29.0),
		        vec3(254.0, -1119.0, 29.0),
		        vec3(226.0, -1120.0, 29.0),
		        vec3(226.0, -1120.0, 29.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["pizzathis"] = {
            coords = {
		        vec3(527.0, 96.0, 96.0),
		        vec3(539.0, 126.0, 96.0),
		        vec3(593.0, 109.0, 96.0),
		        vec3(580.0, 75.0, 96.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["chinatown"] = {
            coords = {
		        vec3(311.0, -745.0, 29.0),
		        vec3(328.0, -695.0, 29.0),
		        vec3(290.0, -681.0, 29.0),
		        vec3(273.0, -732.0, 29.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["ghostchambers"] = {
            coords = {
		        vec3(-728.0, -1155.0, 11.0),
		        vec3(-750.0, -1122.0, 11.0),
		        vec3(-727.0, -1106.0, 11.0),
		        vec3(-704.0, -1135.0, 11.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["smokeys"] = {
            coords = {
		        vec3(1146.0, -975.0, 46.0),
		        vec3(1117.0, -979.0, 46.0),
		        vec3(1119.0, -1000.0, 46.0),
		        vec3(1148.0, -996.0, 46.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["harmony"] = {
            coords = {
		        vec3(1161.0, 2677.0, 38.0),
		        vec3(1161.0, 2677.0, 38.0),
		        vec3(1219.0, 2674.0, 38.0),
		        vec3(1217.0, 2615.0, 38.0),
		        vec3(1161.0, 2617.0, 38.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["topgear"] = {
            coords = {
                vec3(110.0, 6504.0, 31.0),
                vec3(136.0, 6528.0, 31.0),
                vec3(78.0, 6599.0, 31.0),
                vec3(9.0, 6535.0, 31.0),
                vec3(74.0, 6470.0, 31.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["pier76"] = {
            coords = {
		        vec3(551.0, -3115.0, 7.0),
		        vec3(497.0, -3115.0, 7.0),
		        vec3(494.0, -3049.0, 7.0),
		        vec3(544.0, -3043.0, 7.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["neptum"] = {
            coords = {
                vec3(878.0, -2371.0, 28.0),
                vec3(876.0, -2448.0, 28.0),
                vec3(828.0, -2443.0, 28.0),
                vec3(834.0, -2346.0, 28.0),
                vec3(875.0, -2368.0, 28.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 65.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["vbmech"] = {
            coords = {
		        vec3(-1602.0, -873.0, 10.0),
		        vec3(-1657.0, -832.0, 10.0),
		        vec3(-1663.0, -827.0, 10.0),
		        vec3(-1627.0, -792.0, 10.0),
		        vec3(-1568.0, -843.0, 10.0),
		        vec3(-1599.0, -878.0, 10.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["icylic"] = {
            coords = {
		        vec3(-217.0, -45.0, 50.0),
		        vec3(-210.0, -23.0, 50.0),
		        vec3(-234.0, -12.0, 50.0),
		        vec3(-244.0, -31.0, 50.0),
		        vec3(-228.0, -65.0, 50.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["treybakery"] = {
            coords = {
		        vec3(65.0, -143.0, 55.0),
		        vec3(34.0, -133.0, 55.0),
		        vec3(45.0, -109.0, 55.0),
		        vec3(74.0, -117.0, 55.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["fusion"] = {
            coords = {
		        vec3(1226.0, -327.0, 69.0),
		        vec3(1223.0, -369.0, 69.0),
		        vec3(1263.0, -388.0, 69.0),
		        vec3(1270.0, -393.0, 69.0),
		        vec3(1300.0, -336.0, 69.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["playhouse"] = {
            coords = {
		        vec3(826.0, -1583.0, 31.0),
		        vec3(817.0, -1675.0, 31.0),
		        vec3(748.0, -1666.0, 31.0),
		        vec3(752.0, -1635.0, 31.0),
		        vec3(803.0, -1579.0, 31.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["moneysidevapes"] = {
            coords = {
                vec3(-3170.0, 1061.0, 21.0),
                vec3(-3152.0, 1100.0, 21.0),
                vec3(-3176.0, 1110.0, 21.0),
                vec3(-3192.0, 1073.0, 21.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["rockford"] = {
            coords = {
                vec3(-1030.0, -261.0, 38.0),
                vec3(-983.0, -237.0, 38.0),
                vec3(-945.0, -257.0, 38.0),
                vec3(-1015.0, -296.0, 38.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },

        ["hookah"] = {
            coords = {
                vec3(-450.0, -16.0, 43.0), 		
                vec3(-405.0, -19.0, 43.0), 		
                vec3(-408.0, -34.0, 43.0), 		
                vec3(-417.0, -51.0, 43.0), 		 
                vec3(-453.0, -53.0, 43.0)
			},
			thickness = 18.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["supermech"] = {
            coords = {
                vec3(845.15002441406, -994.95001220703, 24.0),
                vec3(800.0, -995.0, 24.0),
                vec3(797.0, -924.0, 24.0),
                vec3(847.0, -923.0, 24.0),
			},
			thickness = 24.2,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["shotsonme"] = {
            coords = {
                vec3(-658.70001220703, -945.20001220703, 22.0),
                vec3(-666.20001220703, -945.20001220703, 22.0),
                vec3(-666.79998779297, -942.59997558594, 22.0),
                vec3(-665.0, -942.29998779297, 22.0),
                vec3(-665.0, -937.5, 22.0),
                vec3(-666.5, -937.09997558594, 22.0),
                vec3(-666.79998779297, -934.59997558594, 22.0),
                vec3(-665.20001220703, -934.59997558594, 22.0),
                vec3(-661.29998779297, -934.5, 22.0),
                vec3(-661.29998779297, -936.5, 22.0),
                vec3(-659.90002441406, -938.0, 22.0),
                vec3(-658.79998779297, -938.0, 22.0),
            },
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["garmory"] = {
            coords = {
                vec3(-645.0, -245.0, 38.0),
                vec3(-640.0, -253.0, 38.0),
                vec3(-631.0, -253.0, 38.0),
                vec3(-624.0, -249.0, 38.0),
                vec3(-667.0, -215.0, 38.0),
                vec3(-695.0, -223.0, 38.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["pearls"] = {
            coords = {
                vec3(-1832.0, -1157.0, 14.0),
                vec3(-1773.0, -1206.0, 14.0),
                vec3(-1826.0, -1270.0, 14.0),
                vec3(-1886.0, -1221.0, 14.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["blacklabel"] = {
            coords = {
                vec3(-283.0, 244.0, 90.0),
                vec3(-238.0, 245.0, 90.0),
                vec3(-241.0, 204.0, 90.0),
                vec3(-282.0, 204.0, 90.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
        ["beachclub"] = {
            coords = {
                vec3(-1282.0, -1673.0, 5.0),
                vec3(-1251.0, -1716.0, 5.0),
                vec3(-1288.0, -1743.0, 5.0),
                vec3(-1319.0, -1700.0, 5.0),
			},
			thickness = 4.0,
            colors = { -- RGB Colors
                r = 2,
                g = 255,
                b = 255,
                a = 0 -- From 0.0 to 1.0
            },
            blip = false,
            blipType = "radius", --RADIUS/NORMAL
            debug = false,
            blipRadius = 55.0, -- BLIP RADIUS | Set the same radius as above or different
            blipSprite = 438, --BLIP SPRITE | List of all blips https://docs.fivem.net/docs/game-references/blips/
            blipColor = 2, --BLIP COLOR | List of all colors https://docs.fivem.net/docs/game-references/blips/
            blipAlpha = 120, --BLIP ALPHA | Set blip transparent
            blipName = "Greenzone", -- BLIP NAME | Set blip name
            changeBucket = false, -- True/false  whether the player is to be hidden in the bucket | You can set bucket from 0 to 2147483647 | Set to 0 to not change the bucket
            routingBucket = 0 -- You can set "random" for random bucket or number of bucket example: routingBucket = 24 works only if changeBucket is set to true
        },
    },
}


cfg = {
	deformationMultiplier = -1,					-- How much should the vehicle visually deform from a collision. Range 0.0 to 10.0 Where 0.0 is no deformation and 10.0 is 10x deformation. -1 = Don't touch. Visual damage does not sync well to other players.
	deformationExponent = 1,					-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	collisionDamageExponent = 1,				-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.

	damageFactorEngine = 1,					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorBody = 5,						-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorPetrolTank = 25,				-- Sane values are 1 to 200. Higher values means more damage to vehicle. A good starting point is 64
	engineDamageExponent = 0.6,					-- How much should the handling file engine damage setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	weaponsDamageMultiplier = 0.3,				-- How much damage should the vehicle get from weapons fire. Range 0.0 to 10.0, where 0.0 is no damage and 10.0 is 10x damage. -1 = don't touch
	degradingHealthSpeedFactor = 10,			-- Speed of slowly degrading health, but not failure. Value of 10 means that it will take about 0.25 second per health point, so degradation from 800 to 305 will take about 2 minutes of clean driving. Higher values means faster degradation
	cascadingFailureSpeedFactor = 8.0,			-- Sane values are 1 to 100. When vehicle health drops below a certain point, cascading failure sets in, and the health drops rapidly until the vehicle dies. Higher values means faster failure. A good starting point is 8

	degradingFailureThreshold = 800.0,			-- Below this value, slow health degradation will set in
	cascadingFailureThreshold = 360.0,			-- Below this value, health cascading failure will set in
	engineSafeGuard = 100.0,					-- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.

	torqueMultiplierEnabled = true,				-- Decrease engine torque as engine gets more and more damaged

	limpMode = false,							-- If true, the engine never fails completely, so you will always be able to get to a mechanic unless you flip your vehicle and preventVehicleFlip is set to true
	limpModeMultiplier = 0.13,					-- The torque multiplier to use when vehicle is limping. Sane values are 0.05 to 0.25

	preventVehicleFlip = false,					-- If true, you can't turn over an upside down vehicle

	sundayDriver = false,						-- If true, the accelerator response is scaled to enable easy slow driving. Will not prevent full throttle. Does not work with binary accelerators like a keyboard. Set to false to disable. The included stop-without-reversing and brake-light-hold feature does also work for keyboards.
	sundayDriverAcceleratorCurve = 7.5,			-- The response curve to apply to the accelerator. Range 0.0 to 10.0. Higher values enables easier slow driving, meaning more pressure on the throttle is required to accelerate forward. Does nothing for keyboard drivers
	sundayDriverBrakeCurve = 5.0,				-- The response curve to apply to the Brake. Range 0.0 to 10.0. Higher values enables easier braking, meaning more pressure on the throttle is required to brake hard. Does nothing for keyboard drivers

	displayBlips = true,						-- Show blips for mechanics locations

	compatibilityMode = false,					-- prevents other scripts from modifying the fuel tank health to avoid random engine failure with BVA 2.01 (Downside is it disabled explosion prevention)

	randomTireBurstInterval = 0,				-- Number of minutes (statistically, not precisely) to drive above 22 mph before you get a tire puncture. 0=feature is disabled


	-- Class Damagefactor Multiplier
	-- The damageFactor for engine, body and Petroltank will be multiplied by this value, depending on vehicle class
	-- Use it to increase or decrease damage for each class

	classDamageMultiplier = {
		[0] = 	1.0,		--	0: Compacts
				1.0,		--	1: Sedans
				1.0,		--	2: SUVs
				1.0,		--	3: Coupes
				1.0,		--	4: Muscle
				1.0,		--	5: Sports Classics
				1.0,		--	6: Sports
				1.0,		--	7: Super
				0.25,		--	8: Motorcycles
				0.7,		--	9: Off-road
				0.25,		--	10: Industrial
				1.0,		--	11: Utility
				1.0,		--	12: Vans
				1.0,		--	13: Cycles
				0.5,		--	14: Boats
				1.0,		--	15: Helicopters
				1.0,		--	16: Planes
				1.0,		--	17: Service
				0.75,		--	18: Emergency
				0.75,		--	19: Military
				1.0,		--	20: Commercial
				1.0			--	21: Trains
	}
}

repairCfg = {
	mechanics = {
		--{name="Quick Repair", id=402, r=25.0, x=-337.0,  y=-135.0,  z=39.0},	-- LSC Burton
		{name="Quick Repair", id=402, r=25.0, x=-1155.0, y=-2007.0, z=13.0},	-- LSC by airport
		{name="Quick Repair", id=402, r=25.0, x=734.0,   y=-1085.0, z=22.0},	-- LSC La Mesa
		{name="Quick Repair", id=402, r=25.0, x=1177.0,  y=2640.0,  z=37.0},	-- LSC Harmony
		{name="Quick Repair", id=402, r=25.0, x=108.0,   y=6624.0,  z=31.0},	-- LSC Paleto Bay
		{name="Quick Repair", id=402, r=15.0, x=1774.0,  y=3333.0,  z=41.0},	-- Mechanic Sandy Shores Airfield
		{name="Quick Repair", id=402, r=15.0, x=1143.0,  y=-776.0,  z=57.0},	-- Mechanic Mirror Park
		{name="Quick Repair", id=402, r=30.0, x=2508.0,  y=4103.0,  z=38.0},	-- Mechanic East Joshua Rd.
		{name="Quick Repair", id=402, r=16.0, x=2006.0,  y=3792.0,  z=32.0},	-- Mechanic Sandy Shores gas station
		{name="Quick Repair", id=402, r=25.0, x=484.0,   y=-1316.0, z=29.0},	-- Hayes Auto, Little Bighorn Ave.
		{name="Quick Repair", id=402, r=33.0, x=-1419.0, y=-450.0,  z=36.0},	-- Hayes Auto Body Shop, Del Perro
		{name="Quick Repair", id=402, r=33.0, x=268.0,   y=-1810.0, z=27.0},	-- Hayes Auto Body Shop, Davis
		{name="Quick Repair", id=402, r=45.0, x=-52.1146, y=-1685.9717, z=29.0250},	-- Mosley Auto Service, Strawberry
		{name="Quick Repair", id=402, r=44.0, x=-212.0,  y=-1378.0, z=31.0},	-- Glass Heroes, Strawberry
		{name="Quick Repair", id=402, r=33.0, x=258.0,   y=2594.0,  z=44.0},	-- Mechanic Harmony
	},

	fixMessages = {
		"You put the oil plug back in",
		"You stopped the oil leak using chewing gum",
		"You repaired the oil tube with gaffer tape",
		"You tightened the oil pan screw and stopped the dripping",
		"You kicked the engine and it magically came back to life",
		"You removed some rust from the spark tube",
		"You yelled at your vehicle, and it somehow had an effect"
	},
	fixMessageCount = 7,

	noFixMessages = {
		"You checked the oil plug. It's still there",
		"You looked at your engine, it seemed fine",
		"You made sure that the gaffer tape was still holding the engine together",
		"You turned up the radio volume. It just drowned out the weird engine noises",
		"You added rust-preventer to the spark tube. It made no difference",
		"Never fix something that ain't broken they said. You didn't listen. At least it didn't get worse"
	},
	noFixMessageCount = 6
}

RepairEveryoneWhitelisted = true
RepairWhitelist =
{
	"steam:000000000000000",
	"steam:000000000000000"
}