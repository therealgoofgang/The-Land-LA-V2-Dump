-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

ESX = nil
local PlayerData, target

CreateThread(function()
    if GetResourceState('es_extended') ~= 'started' then return end

    ESX = exports.es_extended:getSharedObject()
    PlayerData = ESX.GetPlayerData()
    while not PlayerData or not PlayerData.job do
        Wait(100)
        PlayerData = ESX.GetPlayerData()
    end

    RegisterNetEvent('esx:setJob', function(job)
        PlayerData.job = job
    end)
end)

CreateThread(function()
    while not ESX do
        Wait(500)
    end
    target = 'qtarget'
end)

AddEventHandler('wasabi_elevator:goToFloor', function(data)
    local elevator, floor = data.elevator, data.floor
    local coords = Config.Elevators[elevator][floor].coords
    local heading = Config.Elevators[elevator][floor].heading
    local ped = cache.ped
    local allowVehicle = Config.Elevators[elevator][floor].vehicle
    local vehicle = allowVehicle and GetVehiclePedIsIn(ped, false) or 0
    local inVehicle = vehicle ~= 0

    DoScreenFadeOut(1500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    while not HasCollisionLoadedAroundEntity(ped) do
        Wait()
    end

    if inVehicle then
        SetEntityCoords(vehicle, coords.x, coords.y, coords.z, false, false, false, false)
        SetEntityHeading(vehicle, heading and heading or 0.0)
    else
        SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
        SetEntityHeading(ped, heading and heading or 0.0)
    end

    Wait(3000)
    DoScreenFadeIn(1500)
end)

AddEventHandler('wasabi_elevator:noAccess', function()
    lib.notify({
        title = 'No Access',
        description = 'You do not have access to this floor',
        type = 'error'
    })
end)

AddEventHandler('wasabi_elevator:openMenu', function(data)
    local elevator = data.elevator
    local floor = data.floor
    local elevatorData = Config.Elevators[elevator]
    local Options = {}

    for k,v in pairs(elevatorData) do
        if k == floor then
            table.insert(Options, {
                title = v.title..' (Current)',
                description = v.description,
                event = '',
                --args = { elevator = elevator, floor = k }
            })
        elseif v.groups then
            local found
            for i=1, #v.groups do
                if PlayerData.job.name == v.groups[i] then
                    found = true
                end
            end
            if found then
                table.insert(Options, {
                    title = v.title,
                    description = v.description,
                    event = 'wasabi_elevator:goToFloor',
                    args = { elevator = elevator, floor = k }
                })
            else
                table.insert(Options, {
                    title = v.title,
                    description = v.description,
                    event = 'wasabi_elevator:noAccess'
                })
            end
        elseif not v.groups then
            table.insert(Options, {
                title = v.title,
                description = v.description,
                event = 'wasabi_elevator:goToFloor',
                args = { elevator = elevator, floor = k }
            })
        else
            table.insert(Options, {
                title = v.title,
                description = v.description,
                event = 'wasabi_elevator:noAccess'
            })
        end
    end
    lib.registerContext({
        id = 'elevator_menu',
        title = 'Elevator Menu',
        options = Options
    })

    lib.showContext('elevator_menu')
end)

CreateThread(function()
    for k,v in pairs(Config.Elevators) do
        for a,b in pairs(Config.Elevators[k]) do
            -- exports[target]:AddBoxZone(k..':'..a, b.coords, b.target.width, b.target.length, {
            --     name = k..':'..a,
            --     heading = b.target.heading,
            --     debugPoly = false,
            --     minZ = b.coords.z - 1.5,
            --     maxZ = b.coords.z + 1.5
            -- },
            -- {
            --     options = {
            --         {
            --             event = 'wasabi_elevator:openMenu',
            --             icon = 'fa-solid fa-hand',
            --             label = 'Interact',
            --             elevator = k,
            --             floor = a
            --         },
            --     },
            --     distance = 1.5 
            -- })

            local point = lib.points.new({
                coords = b.coords,
                distance = b.distance
            })
             
            function point:onEnter()
                lib.showTextUI('[E] - Interact')
            end
             
            function point:onExit()
                lib.hideTextUI()
            end
             
            function point:nearby()
                if self.currentDistance < self.distance and IsControlJustReleased(0, 38) then
                    TriggerEvent('wasabi_elevator:openMenu', { elevator = k, floor = a })
                end
            end
        end
    end
end)
