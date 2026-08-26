-- Calm ai
local scenarios = {
    "WORLD_MOUNTAIN_LION_REST",
    "WORLD_MOUNTAIN_LION_WANDER",
    "DRIVE",
    "WORLD_VEHICLE_POLICE_BIKE",
    "WORLD_VEHICLE_POLICE_CAR",
    "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
    "WORLD_VEHICLE_DRIVE_SOLO",
    "WORLD_VEHICLE_BIKER",
    "WORLD_VEHICLE_DRIVE_PASSENGERS",
    "WORLD_VEHICLE_SALTON_DIRT_BIKE",
    "WORLD_VEHICLE_BICYCLE_MOUNTAIN",
    "PROP_HUMAN_SEAT_CHAIR",
    "WORLD_VEHICLE_ATTRACTOR",
    "WORLD_HUMAN_LEANING",
    "WORLD_HUMAN_HANG_OUT_STREET",
    "WORLD_HUMAN_DRINKING",
    "WORLD_HUMAN_SMOKING",
    "WORLD_HUMAN_GUARD_STAND",
    "WORLD_HUMAN_CLIPBOARD",
    "WORLD_HUMAN_HIKER",
    "WORLD_VEHICLE_EMPTY",
    "WORLD_VEHICLE_BIKE_OFF_ROAD_RACE",
    "WORLD_HUMAN_PAPARAZZI",
    "WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN",
    "WORLD_VEHICLE_PARK_PARALLEL",
    "WORLD_VEHICLE_CONSTRUCTION_SOLO",
    "WORLD_VEHICLE_CONSTRUCTION_PASSENGERS",
    "WORLD_VEHICLE_TRUCK_LOGS",
    "WORLD_VEHICLE_AMBULANCE",
    "WORLD_VEHICLE_BICYCLE_BMX",
    "WORLD_VEHICLE_BICYCLE_BMX_BALLAS",
    "WORLD_VEHICLE_BICYCLE_BMX_FAMILY",
    "WORLD_VEHICLE_BICYCLE_BMX_HARMONY",
    "WORLD_VEHICLE_BICYCLE_BMX_VAGOS",
    "WORLD_VEHICLE_BICYCLE_ROAD",
    "WORLD_VEHICLE_BOAT_IDLE",
    "WORLD_VEHICLE_BOAT_IDLE_ALAMO",
    "WORLD_VEHICLE_BOAT_IDLE_MARQUIS",
    "WORLD_VEHICLE_BROKEN_DOWN",
    "WORLD_VEHICLE_BUSINESSMEN",
    "WORLD_VEHICLE_HELI_LIFEGUARD",
    "WORLD_VEHICLE_CLUCKIN_BELL_TRAILER",
    "WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED",
    "WORLD_VEHICLE_FARM_WORKER",
    "WORLD_VEHICLE_FIRE_TRUCK",
    "WORLD_VEHICLE_MARIACHI",
    "WORLD_VEHICLE_MECHANIC",
    "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
    "WORLD_VEHICLE_PASSENGER_EXIT",
    "WORLD_VEHICLE_POLICE",
    "WORLD_VEHICLE_QUARRY",
    "WORLD_VEHICLE_SALTON",
    "WORLD_VEHICLE_SECURITY_CAR",
    "WORLD_VEHICLE_STREETRACE",
    "WORLD_VEHICLE_TOURBUS",
    "WORLD_VEHICLE_TOURIST",
    "WORLD_VEHICLE_TANDL",
    "WORLD_VEHICLE_TRACTOR",
    "WORLD_VEHICLE_TRACTOR_BEACH",
    "WORLD_VEHICLE_TRUCKS_TRAILERS",
    "WORLD_VEHICLE_DISTANT_EMPTY_GROUND",
}

local models = {
    `shamal`,
    `luxor`, 
    `luxor2`,
    `jet`,
    `lazer`,
    `titan`,
    `barracks`,
    `barracks2`,
    `crusader`,
    `rhino`,
    `airtug`,
    `ripley`,
    `buzzard`,
    `firetruk`,
    `ambulance`,
    `police`,
    `police2`,
    `police3`,
    `police4`,
    `riot2`,
    `pranger`,
    `iguard`,
    `sheriff`,
    `police5`,
    `pbus`,
    `fbi`,
    `riot`,
    `seriff2`,
    `policet`,
    `fib2`,
    `policeb`,
    `S_M_Y_Cop_01`,
    `S_M_M_Cop_01`,
    `S_F_Y_Cop_01`,
    `CSB_Cop`,
    `S_M_Y_HwayCop_01`,
    `S_F_Y_Sheriff_01`,
    `S_M_Y_Sheriff_01`
}

local relationships = { -- set these groups friendly to player.
    `AMBIENT_GANG_HILLBILLY`,
    `AMBIENT_GANG_BALLAS`,
    `AMBIENT_GANG_MEXICAN`,
    `AMBIENT_GANG_FAMILY`,
    `AMBIENT_GANG_MARABUNTE`,
    `AMBIENT_GANG_SALVA`,
    `GANG_1`,
    `GANG_2`,
    `GANG_9`,
    `GANG_10`,
    `FIREMAN`,
    `MEDIC`,
    `COP`
}

CreateThread(function()
    for i=1, #relationships do
        SetRelationshipBetweenGroups(1, relationships[i], `PLAYER`)
    end
    for i=1, #scenarios do
        SetScenarioTypeEnabled(scenarios[i], false)
    end
    for i=1, 32 do
        EnableDispatchService(i, false)
    end
    for i=1, #models do
        local mdl = models[i]
        if IsModelAVehicle(mdl) then
            SetVehicleModelIsSuppressed(mdl, true)
        elseif IsModelAPed(mdl) then
            SetPedModelIsSuppressed(mdl, true)
        end
    end
end)

SetMaxWantedLevel(0)
SetCreateRandomCops(false)
SetCreateRandomCopsNotOnScenarios(false)
SetCreateRandomCopsOnScenarios(false)

-- Disable Annoying Sounds Script (Standalone)

-- List of emitters to disable
local emittersToDisable = {
    'se_dlc_aw_arena_crowd_background_main',
    'se_dlc_aw_arena_crowd_exterior_lobby',
    'se_dlc_aw_arena_crowd_interior_lobby',
    'se_dlc_aw_arena_construction_01'
}

-- Disable emitters on client map start
AddEventHandler('onClientMapStart', function()
    -- Wait a moment to ensure all resources are loaded
    Citizen.Wait(1000)

    for _, emitter in ipairs(emittersToDisable) do
        SetStaticEmitterEnabled(emitter, false)
        print(emitter .. " sound disabled.")
    end
end)

-- Monitor player location and disable sounds dynamically
Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())

        -- Define areas where sounds should be disabled
        local locationsToDisable = {
            vector3(-225.0, -2027.0, 30.0),  -- Maze Bank Arena
            vector3(3053.1824, -3830.7314, 10.0289)  -- Ocean coordinates where arena cheer is heard
        }

        for _, location in ipairs(locationsToDisable) do
            if #(playerCoords - location) < 500.0 then
                for _, emitter in ipairs(emittersToDisable) do
                    SetStaticEmitterEnabled(emitter, false)
                end
            end
        end

        Citizen.Wait(10000) -- Check every second
    end
end)

CreateThread(function()
    local point = lib.points.new({
        coords = vector4(15.2290, -804.9882, 1377.9282, 192.5754),
        distance = 5
    })
    
    function point:onEnter()
        lib.showTextUI("[E] - Teleport to Legion")
    end
    
    function point:onExit()
        lib.hideTextUI()
    end
    
    function point:nearby()
        DrawMarker(41, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.3, 1.3, 1.3, 20, 20, 255, 50, false, true, 2, false, nil, nil, false)
        if self.currentDistance < 5 and IsControlJustReleased(0, 38) then
            SetEntityCoords(PlayerPedId(), 189.2439, -851.9706, 31.19)
        end
    end
end)

CreateThread(function()
    local point = lib.points.new({
        coords = vector4(15.2290, -804.9882, 1377.9282, 192.5754),
        distance = 5
    })
    
    function point:onEnter()
        lib.showTextUI("[E] - Teleport to Legion")
    end
    
    function point:onExit()
        lib.hideTextUI()
    end
    
    function point:nearby()
        DrawMarker(41, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.3, 1.3, 1.3, 20, 20, 255, 50, false, true, 2, false, nil, nil, false)
        if self.currentDistance < 5 and IsControlJustReleased(0, 38) then
            SetEntityCoords(PlayerPedId(), 189.2439, -851.9706, 31.19)
        end
    end
end)

-- CreateThread(function()
--     local islandEntry = lib.points.new({
--         coords = vector4(-3420.2771, 969.2225, 8.3429, 8.4278),
--         distance = 5
--     })

--     function islandEntry:onEnter()
--         lib.showTextUI("[E] - Teleport to Admin Center")
--     end

--     function islandEntry:onExit()
--         lib.hideTextUI()
--     end

--     function islandEntry:nearby()
--         DrawMarker(41, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.3, 1.3, 1.3, 0, 255, 100, 50, false, true, 2, false, nil, nil, false)
--         if self.currentDistance < 5 and IsControlJustReleased(0, 38) then
--             SetEntityCoords(PlayerPedId(), 7385.886, 7483.154, 4.543)
--         end
--     end
-- end)

-- CreateThread(function()
--     local islandExit = lib.points.new({
--         coords = vector4(-429.2210, 1109.3212, 327.6824, 153.9909),
--         distance = 5
--     })

--     function islandExit:onEnter()
--         lib.showTextUI("[E] - Return from Admin Center")
--     end

--     function islandExit:onExit()
--         lib.hideTextUI()
--     end

--     function islandExit:nearby()
--         DrawMarker(41, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.3, 1.3, 1.3, 255, 50, 50, 50, false, true, 2, false, nil, nil, false)
--         if self.currentDistance < 5 and IsControlJustReleased(0, 38) then
--             SetEntityCoords(PlayerPedId(), -3420.2771, 969.2225, 8.3429)
--         end
--     end
-- end)