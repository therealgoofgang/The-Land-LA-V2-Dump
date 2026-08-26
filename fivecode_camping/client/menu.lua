--[[ Config.Menu ]]--
function OpenMenu(menu)
    local _options = {}
    if Menu == 'ox' then
        for _, menu in pairs(menu.options) do
            table.insert(_options, {
                title = menu.title,
                description = menu.description,
                metadata = menu.metadata,
                disabled = menu.disabled,
                icon = menu.icon,
                image = menu.image,
                arrow = menu.arrow,
                data = menu.data,
                onSelect = menu.onSelect,
            })
        end
        lib.registerContext({
            id = menu.header.name,
            title = menu.header.title,
            menu = menu.header.backMenu,
            options = _options,
        })
        lib.showContext(menu.header.name)
    elseif Menu == 'qb' then
        _options = {{isMenuHeader = true, header = menu.header.title}}
        for _, menu in pairs(menu.options) do
            table.insert(_options, {
                header = menu.title,
                txt = menu.description,
                params = {event = TriggerName(menu.event), args = menu.args},
                metadata = menu.metadata,
                disabled = menu.disabled,
                icon = menu.icon,
                image = menu.image,
                arrow = menu.arrow,
                data = menu.data,
                onSelect = menu.onSelect,
            })
        end
        exports['qb-menu']:showHeader(_options)
    elseif Menu == 'esx' then
        local ped = PlayerPedId()
        FreezeEntityPosition(ped, true)
        for _, menu in pairs(menu.options) do
            table.insert(_options, {
                label = menu.description and menu.title..' - '..menu.description or menu.title,
                txt = menu.description,
                params = {event = TriggerName(menu.event), args = menu.args},
                metadata = menu.metadata,
                disabled = menu.disabled,
                icon = menu.icon,
                image = menu.image,
                arrow = menu.arrow,
                data = menu.data,
                onSelect = menu.onSelect,
            })
        end
        CORE.UI.Menu.Open("default", GetCurrentResourceName(), "esx_menu_default", {
            title = menu.header.title,
            align    = 'top-left',
            elements = _options
        }, function(data, esxMenu)
            if data.current then
                CORE.UI.Menu.CloseAll()
                TriggerEvent(data.current.params.event, data.current.params.args)
                FreezeEntityPosition(ped, false)
            end
        end, function(data, esxMenu)
            CORE.UI.Menu.CloseAll()
            FreezeEntityPosition(ped, false)
        end)
    end
end

--[[ Config.DialogMenu ]]--
function OpenDialogMenu(menu)
    if DialogMenu == 'ox' then
        local input = lib.inputDialog(menu.label, menu.menu)
        if not input then return nil end
        return {value1 = input[1], value2 = input[2]}
    elseif DialogMenu == 'esx' then
        local ped = PlayerPedId()
        FreezeEntityPosition(ped, true)
        CORE.UI.Menu.Open('dialog', GetCurrentResourceName(), 'esx_menu_dialog', {
                title = menu.label
            }, function(data, dialogMenu)
                if data.value then
                    CORE.UI.Menu.CloseAll()
                    MenuOther({data = data, menu = menu})
                    FreezeEntityPosition(ped, false)
                end
            end, function(data, dialogMenu)
                CORE.UI.Menu.CloseAll()
                FreezeEntityPosition(ped, false)
            end)
    elseif DialogMenu == 'qb' then
        local input = exports['qb-input']:ShowInput({
            header = menu.label,
            submitText = 'Submit',
            inputs = {
                {
                    text = menu.label,
                    name = 'value',
                    type = 'number',
                    isRequired = true,
                },
            },
        })
        if not input then return {value1 = nil, menu = menu} end
        return {value1 = input.value, menu = menu}
    end
end

--[[ Config.ActionMenu ]]--
function ActionMenus(coords, event, args, icon, label)
    local debug = false
    local name = TriggerName(event)..'-'..coords

    if ActionMenu == 'ox' then  
        exports.ox_target:addBoxZone({
            name = name,
            coords = vec3(coords.x, coords.y, coords.z),
            size = vec3(1.0, 1.0, 1.8),
            rotation = coords.w,
            debug = debug,
            options = {
                {
                    name = name,
                    event = TriggerName(event),
                    icon = icon,
                    label = label,
                    args = args,
                    distance = 2.0,
                    canInteract = function(entity, coords, distance)
                        return true
                    end
                },
            }
        })
    elseif ActionMenu == 'qb' then
        exports['qb-target']:AddBoxZone(name, vec3(coords.x, coords.y, coords.z), 1.0, 1.0, {
            name = name,
            heading = coords.w,
            debugPoly = debug,
            maxZ = coords.z+1,
            minZ = coords.z-1,
            },{
            options = {
                {
                    name = name,
                    event = TriggerName(event),
                    icon = icon,
                    label = label,
                    args = args,
                },
                
            },
            distance = 2.0
        })
    elseif ActionMenu == 'q' then
        exports.qtarget:AddBoxZone(name, vec3(coords.x, coords.y, coords.z), 1.0, 1.0, {
            name = name,
            heading = coords.w,
            debugPoly = debug,
            maxZ = coords.z+1,
            minZ = coords.z-1,
            },{
            options = {
                {
                    name = name,
                    event = TriggerName(event),
                    icon = icon,
                    label = label,
                    args = args,
                },
                
            },
            distance = 2.0
        })
    elseif ActionMenu == 'helpox' or ActionMenu == 'helpesx' or ActionMenu == 'helpqb' then
        CreateThread(function()
            while true do
                local _msec = 5000
                local ped = PlayerPedId()
                local distance = #(vec3(coords.x, coords.y, coords.z) - GetEntityCoords(ped))

                if distance < 30 then
                    _msec = 1000
                    if distance > 2 and distance < 2.5 then
                        StopHelpNotification()
                    end
                    if distance < 2 and not IsPedInAnyVehicle(ped, false) then
                        _msec = 5

                        ShowHelpNotification('[E] - '..label)
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent(TriggerName(event), {args = args})
                        end
                    end
                end
                Wait(_msec)
            end
        end)
    end
end

function AddModel(model, event, label, distance)
    local name = TriggerName(event)
    
    if ActionMenu == 'ox' then
        exports.ox_target:addModel(model,{			
            {
                name = name,
                label = label,
                distance = distance,
                icon = 'fas fa-hand',
                onSelect = function(args)
                    args.prop = model
                    TriggerEvent(TriggerName(event), args)
                end,
            },
        })
    elseif ActionMenu == 'qb' then
        exports['qb-target']:AddTargetModel(model, {
            options = {
                {
                    name = name,
                    label = label,
                    icon = 'fas fa-hand',
                    action = function(args)
                        TriggerEvent(TriggerName(event), {entity = args, prop = model})
                    end
                }
            },
            distance = distance
        })
    elseif ActionMenu == 'q' then
        exports['qtarget']:AddTargetModel(model, {
            options = {
                {
                    name = name,
                    label = label,
                    icon = 'fas fa-hand',
                    action = function(args)
                        TriggerEvent(TriggerName(event), {entity = args, prop = model})
                    end
                }
            },
            distance = distance
        })
    elseif ActionMenu == 'helpox' or ActionMenu == 'helpesx' or ActionMenu == 'helpqb' then
        CreateThread(function()
            while true do
                local _msec = 1000
                local ped = PlayerPedId()
                local playerCoords = GetEntityCoords(ped)
                local closestDistance = 2.0
                local closestObject
                local closestObjectId
                
                for objectId, objectInfo in pairs(Objects) do
                    if objectInfo.rendered then
                        local objectCoords = objectInfo.coords
                        local distance = #(playerCoords - vec3(objectCoords.x, objectCoords.y, objectCoords.z))

                        if distance < closestDistance+2 then
                            _msec = 5
                            if objectInfo.rendered and distance > closestDistance and distance < 2.5 then
                                StopHelpNotification()
                            end
                            if objectInfo.rendered and not Busy and distance < closestDistance then
                                if distance < closestDistance then
                                    closestObject = objectInfo
                                    closestObjectId = objectId
                                end
                            end
                        end
                    end
                end
                if closestObject then
                    ShowHelpNotification('[E] - '..GetObjectInteractonLable(closestObject.prop))

                    if IsControlJustPressed(0, 38) then
                        TriggerEvent(TriggerName(GetObjectMenu(closestObject.prop)), {entity = closestObject.netId, prop = model})
                    end
                end   
                Wait(_msec)
            end
        end)
    end
end