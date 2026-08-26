-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = false -- Check for Updates?

Config.Elevators = {
    pier76 = {
        [1] = {
            coords = vec3(840.9020, -905.2463, 25.2516), -- This is the location of the blip
            heading = 0.3748, -- Heading of how will spawn on floor
            title = 'Pier 76', -- Title
            description = 'Lobby', -- Description
            distance = 2.5, -- Distance to interact
            vehicle = true
        },
        [2] = {
            coords = vec3(836.8960, -920.7506, 17.2471), -- This is the location of the blip
            heading = 357.6719, -- Heading of how will spawn on floor
            title = 'Pier 76', -- Title
            description = 'Basement', -- Description
            distance = 2.5, -- Distance to interact
            vehicle = true
        },
    },
    LuxxClub = {
        [1] = {
            coords = vec3(-73.2726, -1277.9802, 29.3009), -- This is the location of the blip
            heading = 269.0652, -- Heading of how will spawn on floor
            title = 'Luxxx Club', -- Title
            description = 'Lobby', -- Description
            distance = 1.3, -- Distance to interact
        },
        [2] = {
            coords = vec3(-70.0824, -1279.3436, 20.1916), -- This is the location of the blip
            heading =  89.3431, -- Heading of how will spawn on floor
            title = 'Luxxx Club', -- Title
            description = '2nd Floor', -- Description
            distance = 1.3, -- Distance to interact
        },
        
    },
    Blazingun = {
        [1] = {
            coords = vec3(-895.9484, -1150.9517, 5.1568), -- This is the location of the blip
            heading = 180.229, -- Heading of how will spawn on floor
            title = 'Blazin Gun', -- Title
            description = 'Lobby', -- Description
            distance = 2.5, -- Distance to interact
        },
        [2] = {
            coords = vec3(-894.1252, -1156.6908, -16.2349), -- This is the location of the blip
            heading = 180.229, -- Heading of how will spawn on floor
            title = 'Blazin Gun', -- Title
            description = 'Shooting Range', -- Description
            distance = 2.5, -- Distance to interact
        },
    },
    EchoHouse = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(-610.4658, 45.6575, 129.2771), -- Coords, if you're new; last number is heading
            heading = 88.4640, -- Heading of how will spawn on floor
            title = 'MLO House Exit', -- Title 
            description = 'MLO House Exit', -- Description
            distance = 2.5, -- Distance to interact
            -- groups = {-- Job locks
            --     'police',
            --     'ambulance'
            -- },
        },
        [2] = {
            coords = vec3(-625.3846, 43.2738, 43.59), -- Coords, if you're new; last number is heading
            heading = 91.9598,
            title = 'MLO House Entrance',
            description = 'MLO House Entrance',
            distance = 2.5, -- Distance to interact
        },
    },
    Motto = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(3931.5039, -1070.0316, 213.9879), -- Coords, if you're new; last number is heading
            heading = 32.6428, -- Heading of how will spawn on floor
            title = 'Motto Entrance', -- Title 
            description = 'Motto Entrance', -- Description
            distance = 2.5, -- Distance to interact
            -- groups = {-- Job locks
            --     'police',
            --     'ambulance'
            -- },
        },
        [2] = {
            coords = vec3(951.9636, -1059.5664, 37.06), -- Coords, if you're new; last number is heading
            heading = 88.3105,
            title = 'Motto Exit',
            description = 'Motto Exit',
            distance = 2.5, -- Distance to interact
        },
    },

    Rooftop = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(-772.8701, 313.0923, 85.6981), -- Coords, if you're new; last number is heading
            heading = 359.2320, -- Heading of how will spawn on floor
            title = 'Enter / Exit', -- Title 
            description = 'Enter / Exit', -- Description
            distance = 2.5, -- Distance to interact
            -- groups = {-- Job locks
            --     'police',
            --     'ambulance'
            -- },
        },
        [2] = {
            coords = vec3(-748.5912, 327.3352, 243.0554), -- Coords, if you're new; last number is heading
            heading = 68.0923,
            title = 'Rooftop',
            description = 'Rooftop',
            distance = 2.5, -- Distance to interact
        },
    },

    Vu = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(118.1300, -1262.1431, 22.7121), -- Coords, if you're new; last number is heading
            heading = 120.2677, -- Heading of how will spawn on floor
            title = 'Main', -- Title 
            description = 'Main Floor', -- Description
            distance = 2.5, -- Distance to interact
            -- groups = {-- Job locks
            --     'police',
            --     'ambulance'
            -- },
        },
        [2] = {
            coords = vec3(130.7, -1283.24, -82.49), -- Coords, if you're new; last number is heading
            heading = 252.84,
            title = 'Motel',
            description = 'Motel Floor',
            distance = 2.5, -- Distance to interact
        },
    },
    SnS = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(-94.6652, 364.3268, 113.2755), -- Coords, if you're new; last number is heading
            heading = 244.8750, -- Heading of how will spawn on floor
            title = 'Main', -- Title 
            description = 'Main Floor', -- Description
            distance = 2.5, -- Distance to interact
            -- groups = {-- Job locks
            --     'police',
            --     'ambulance'
            -- },
        },
        [2] = {
            coords = vec3(-111.5411, 384.7298, 142.6508), -- Coords, if you're new; last number is heading
            heading = 186.6364,
            title = 'Second',
            description = 'Second Floor',
            distance = 2.5, -- Distance to interact
        },
    },
    Hospital = {
        [1] = {
            coords = vec3(-862.5955, -2138.6973, 9.9222), -- Coords, if you're new; last number is heading
            heading = 316.0992, -- Heading of how will spawn on floor
            title = 'Main', -- Title 
            description = 'Main Floor', -- Description
            distance = 2.5, -- Distance to interact
            -- groups = {-- Job locks
            --     'police',
            --     'ambulance'
            -- },
        },
        [2] = {
            coords = vec3(-853.8313, -2147.5308, 16.5624), -- Coords, if you're new; last number is heading
            heading = 316.2382, -- Heading of how will spawn on floor
            title = 'Floor 2',
            description = 'Floor 2',
            distance = 2.5, -- Distance to interact
        },
        [3] = {
            coords = vec3(-842.7462, -2143.7617, 96.2625), -- Coords, if you're new; last number is heading
            heading = 45.8530,
            title = 'Roof',
            description = 'Roof',
            distance = 2.5, -- Distance to interact
        },
    },
    underground = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(-947.7534, -765.4371, 14.8742), -- Coords, if you're new; last number is heading
            heading = 172.6093, -- Heading of how will spawn on floor
            title = '1st Floor', -- Title 
            description = '1st Floor', -- Description
            distance = 2.5, -- Distance to interact
        },
        [2] = {
            coords = vec3(-947.8130, -765.5447, 21.2477), -- Coords, if you're new; last number is heading
            heading = 161.5017,
            title = '2nd Floor',
            description = '2nd Floor',
            distance = 2.5, -- Distance to interact
        },
        [3] = {
            coords = vec3(-947.9066, -765.5103, 28.9133), -- Coords, if you're new; last number is heading
            heading = 344.5908,
            title = 'Rooftop Access',
            description = 'Rooftop Access',
            distance = 2.5, -- Distance to interact
        },
    },
    opium = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(-706.110, -2256.275, 13.462), -- Coords, if you're new; last number is heading
        heading = 180.229, -- Heading of how will spawn on floor
        title = 'Lobby', -- Title
        description = 'Lobby', -- Description
        distance = 2.5, -- Distance to interact
    },
    [2] = {
        coords = vec3(-706.165, -2251.319, 30.393), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 1',
        description = 'Floor 1',
        distance = 2.5, -- Distance to interact
    },
    [3] = {
        coords = vec3(-706.165, -2251.319, 39.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 2',
        description = 'Floor 2',
        distance = 2.5, -- Distance to interact
    },
    [4] = {
        coords = vec3(-706.165, -2251.319, 48.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 3',
        description = 'Floor 3',
        distance = 2.5, -- Distance to interact
    },
    [5] = {
        coords = vec3(-706.165, -2251.319, 57.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 4',
        description = 'Floor 4',
        distance = 2.5, -- Distance to interact
    },
    [6] = {
        coords = vec3(-706.165, -2251.319, 65.50), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 5',
        description = 'Floor 5',
        distance = 2.5, -- Distance to interact
    },
    [7] = {
        coords = vec3(-706.165, -2251.319, 74.50), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 6',
        description = 'Floor 6',
        distance = 2.5, -- Distance to interact
    },

    },
    opium1 = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(-709.615, -2256.275, 13.462), -- Coords, if you're new; last number is heading
        heading = 180.229, -- Heading of how will spawn on floor
        title = 'Lobby', -- Title
        description = 'Lobby', -- Description
        distance = 2.5, -- Distance to interact
    },
    [2] = {
        coords = vec3(-709.615, -2251.319, 30.393), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 1',
        description = 'Floor 1',
        distance = 2.5, -- Distance to interact
    },
    [3] = {
        coords = vec3(-709.615, -2251.319, 39.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 2',
        description = 'Floor 2',
        distance = 2.5, -- Distance to interact
    },
    [4] = {
        coords = vec3(-709.615, -2251.319, 48.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 3',
        description = 'Floor 3',
        distance = 2.5, -- Distance to interact
    },
    [5] = {
        coords = vec3(-709.615, -2251.319, 57.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 4',
        description = 'Floor 4',
        distance = 2.5, -- Distance to interact
    },
    [6] = {
        coords = vec3(-709.615, -2251.319, 65.50), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 5',
        description = 'Floor 5',
        distance = 2.5, -- Distance to interact
    },
    [7] = {
        coords = vec3(-709.615, -2251.319, 74.50), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 6',
        description = 'Floor 6',
        distance = 2.5, -- Distance to interact
    },

    },
    opium2 = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(-709.615, -2256.275, 13.462), -- Coords, if you're new; last number is heading
        heading = 180.229, -- Heading of how will spawn on floor
        title = 'Lobby', -- Title
        description = 'Lobby', -- Description
        distance = 2.5, -- Distance to interact
    },
    [2] = {
        coords = vec3(-709.615, -2251.319, 30.393), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 1',
        description = 'Floor 1',
        distance = 2.5, -- Distance to interact
    },
    [3] = {
        coords = vec3(-709.615, -2251.319, 39.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 2',
        description = 'Floor 2',
        distance = 2.5, -- Distance to interact
    },
    [4] = {
        coords = vec3(-709.615, -2251.319, 48.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 3',
        description = 'Floor 3',
        distance = 2.5, -- Distance to interact
    },
    [5] = {
        coords = vec3(-709.615, -2251.319, 57.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 4',
        description = 'Floor 4',
        distance = 2.5, -- Distance to interact
    },
    [6] = {
        coords = vec3(-709.615, -2251.319, 65.50), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 5',
        description = 'Floor 5',
        distance = 2.5, -- Distance to interact
    },
    [7] = {
        coords = vec3(-709.615, -2251.319, 74.50), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 6',
        description = 'Floor 6',
        distance = 2.5, -- Distance to interact
    },

    },
    opium3 = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(-733.811, -2255.925, 13.462), -- Coords, if you're new; last number is heading
        heading = 176.444, -- Heading of how will spawn on floor
        title = 'Lobby', -- Title
        description = 'Lobby', -- Description
        distance = 2.5, -- Distance to interact
    },
    [2] = {
        coords = vec3(-734.155, -2251.164, 30.393), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 1',
        description = 'Floor 1',
        distance = 2.5, -- Distance to interact
    },
    [3] = {
        coords = vec3(-734.155, -2251.164, 39.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 2',
        description = 'Floor 2',
        distance = 2.5, -- Distance to interact
    },
    [4] = {
        coords = vec3(-734.155, -2251.164, 48.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 3',
        description = 'Floor 3',
        distance = 2.5, -- Distance to interact
    },
    [5] = {
        coords = vec3(-734.155, -2251.164, 57.0), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 4',
        description = 'Floor 4',
        distance = 2.5, -- Distance to interact
    },
    [6] = {
        coords = vec3(-734.155, -2251.164, 65.50), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 5',
        description = 'Floor 5',
        distance = 2.5, -- Distance to interact
    },
    [7] = {
        coords = vec3(-734.155, -2251.164, 74.50), -- Coords, if you're new; last number is heading
        heading = 192.299,
        title = 'Floor 6',
        description = 'Floor 6',
        distance = 2.5, -- Distance to interact
    },
},

mrpd = {
    [1] = {
        coords = vec3(-467.2217, -1077.3923, 25.1681), -- Coords, if you're new; last number is heading
        heading = 2.0227, -- Heading of how will spawn on floor
        title = 'FLOOR 01', -- Title 
        description = 'FLOOR 01', -- Description
        distance = 2.5, -- Distance to interact
    },
    [2] = {
        coords = vec3(-467.2001, -1077.4749, 30.0483), -- Coords, if you're new; last number is heading
        heading = 3.0694,
        title = 'FLOOR 02',
        description = 'FLOOR 02',
        distance = 2.5, -- Distance to interact
    },
    [3] = {
        coords = vec3(-457.2868, -1021.5502, 64.6137), -- Coords, if you're new; last number is heading
        heading = 92.5401,
        title = 'ROOF',
        description = 'ROOF',
        distance = 2.5, -- Distance to interact
    },
}



}