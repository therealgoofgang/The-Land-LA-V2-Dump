exports('hotrocks', function(itemData)
    -- health
    FreezeEntityPosition(PlayerPedId(), true)

    if lib.progressBar({
        duration = 7500,
        label = 'Applying hot rocks', 
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        -- anim = {
        --     dict = 'missheistdocks2bleadinoutlsdh_2b_int',
        --     clip = 'leg_massage_b_floyd',
        -- }
    }) then 
        local my_coords = GetEntityCoords(PlayerPedId())
        local targetSrc = lib.getClosestPlayer(vec3(my_coords.x, my_coords.y, my_coords.z), 4.0, false)
        if not targetSrc then return lib.notify({ type = 'error', description = 'No player found' }) end
    
        targetSrc = GetPlayerServerId(targetSrc)
        TriggerServerEvent('spaStart', targetSrc, 'hotrocks')
    end

    FreezeEntityPosition(PlayerPedId(), false)
end)

exports('massagebodyoil', function(itemData)
    -- health + water + food
    local my_coords = GetEntityCoords(PlayerPedId())
    local targetSrc = lib.getClosestPlayer(vec3(my_coords.x, my_coords.y, my_coords.z), 4.0, false)
    if not targetSrc then return lib.notify({ type = 'error', description = 'No player found' }) end

    FreezeEntityPosition(PlayerPedId(), true)

    if lib.progressBar({
        duration = 7500,
        label = 'Applying body oil',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        -- anim = {
        --     dict = 'missheistdocks2aleadinoutlsdh_2a_int',
        --     clip = 'massage_loop_2_floyd',
        -- }
    }) then 
        local my_coords = GetEntityCoords(PlayerPedId())
        local targetSrc = lib.getClosestPlayer(vec3(my_coords.x, my_coords.y, my_coords.z), 4.0, false)
        if not targetSrc then return lib.notify({ type = 'error', description = 'No player found' }) end
    
        targetSrc = GetPlayerServerId(targetSrc)
        TriggerServerEvent('spaStart', targetSrc, 'massagebodyoil')
    end

    FreezeEntityPosition(PlayerPedId(), false)
end)

RegisterNetEvent('spaComplete', function(item)
    if item == 'hotrocks' then
        SetEntityHealth(PlayerPedId(), 200)
    elseif item == 'massagebodyoil' then
        SetEntityHealth(PlayerPedId(), 200)
        TriggerEvent("esx_status:add", "thirst", 1000000)
        TriggerEvent("esx_status:add", "hunger", 1000000)
    end
end)

exports('islandstrawberrybananasmoothie', function()
        if lib.progressBar({
        duration = 3000,
        label = 'Drinking smoothie',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        -- anim = {
        --     dict = 'missheistdocks2aleadinoutlsdh_2a_int',
        --     clip = 'massage_loop_2_floyd',
        -- }
    }) then 
        SetEntityHealth(PlayerPedId(), GetPedMaxHealth(PlayerPedId()))
        lib.notify({
            description = 'You feel refreshed and energized!',
            type = 'success',
            duration = 3000,
        })
    end
end)