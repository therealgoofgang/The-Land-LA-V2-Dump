local personalZone = nil
local personalZoneActive = false
local zones = {}

local function isInAnyGreenzone()
    return LocalPlayer.state.isInGreenzone == true
end

local function isPhysicallyInGreenzone()
    local zoneIndex = LocalPlayer.state.greenzoneIndex
    if zoneIndex == nil then return false end

    local coords = GetEntityCoords(cache.ped)

    if zoneIndex == 'personal' then
        return personalZoneActive and personalZone ~= nil and personalZone:contains(coords) or false
    end

    local zone = zones[zoneIndex]
    return zone ~= nil and zone:contains(coords) or false
end

local function tryDisarm()
    if IsPedArmed(cache.ped, 4 | 2) then
        TriggerEvent('ox_inventory:disarm', 1, true)
        TriggerEvent('ox_lib:notify', {
            title = 'Greenzone',
            description = 'You cannot use weapons in a greenzone.',
            style = { backgroundColor = '#0f172a', color = '#f8fafc' },
            position = 'center-right',
            icon = 'shield-halved',
            iconColor = '#14532d',
            duration = 5000
        })
    end
end

local function enterGreenzone(zoneIndex)
    if isInAnyGreenzone() then return end
    if GetResourceState('senor_redzones') == 'started' then
        if exports['senor_redzones']:isInRedzone() then return end
    end
    LocalPlayer.state:set('greenzoneIndex', zoneIndex, false)
    LocalPlayer.state:set('isInGreenzone', true, true)
    NetworkSetFriendlyFireOption(false)
    tryDisarm()
    greenzoneConfig.config.callback("join")
end

local function exitGreenzone()
    if not isInAnyGreenzone() then return end
    LocalPlayer.state:set('greenzoneIndex', nil, false)
    LocalPlayer.state:set('isInGreenzone', false, true)
    NetworkSetFriendlyFireOption(true)
    greenzoneConfig.config.callback("leave")
end

local function CreateGreenzone(data, zoneIndex)
    if data.coords and type(data.coords) == 'vector3' then
        return lib.zones.sphere({
            coords = data.coords,
            radius = data.radius,
            onEnter = function() enterGreenzone(zoneIndex) end,
            onExit = exitGreenzone,
            debug = data.debug or false
        })
    elseif data.coords and type(data.coords) == 'table' then
        return lib.zones.poly({
            points = data.coords,
            thickness = data.thickness or 10,
            onEnter = function() enterGreenzone(zoneIndex) end,
            onExit = exitGreenzone,
            debug = data.debug or false
        })
    end
    return false
end

for _, v in pairs(greenzoneConfig.config.greenzones) do
    if v.blip then
        if v.blipType == "radius" then
            local blip2 = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.blipRadius + 3)
            SetBlipColour(blip2, 40)
            SetBlipAlpha(blip2, v.blipAlpha)

            local blip = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.blipRadius)
            SetBlipColour(blip, v.blipColor)
            SetBlipAlpha(blip, v.blipAlpha)

            if v.adminCenter then
                local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
                SetBlipSprite(blip, 269)
                SetBlipColour(2)
                SetBlipAlpha(255)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.blipName .. ' [OOC]')
                EndTextCommandSetBlipName(blip)
            end
        end
    end
    local zoneIndex = #zones + 1
    local zone = CreateGreenzone(v, zoneIndex)
    if zone then zones[zoneIndex] = zone end
end

exports("isPlayerInGreenzone", isInAnyGreenzone)

RegisterNetEvent('initGreenzone', function(coords, radius)
    personalZoneActive = false
    if personalZone then personalZone:remove() end

    personalZone = lib.zones.sphere({
        coords = coords,
        radius = radius,
        debug = false
    })

    personalZoneActive = true
    CreateThread(function()
        local wasInside = false
        while personalZoneActive do
            Wait(500)
            local isInside = #(GetEntityCoords(cache.ped) - vector3(coords.x, coords.y, coords.z)) <= radius

            if isInside and not wasInside then
                wasInside = true
                enterGreenzone('personal')
            elseif not isInside and wasInside then
                wasInside = false
                exitGreenzone()
            end

            if isInside then
                NetworkSetFriendlyFireOption(false)
            end
        end
    end)
end)

RegisterNetEvent('removeGreenzones', function()
    personalZoneActive = false
    if personalZone then
        personalZone:remove()
        personalZone = nil
    end
    exitGreenzone()
end)

RegisterNetEvent('land_gzTeleporter', function(coords, heading)
    SetEntityCoords(PlayerPedId(), coords, false, false, false, true)
    SetEntityHeading(PlayerPedId(), heading)
end)

lib.onCache('weapon', function(weapon)
    if not weapon then return end

    if isPhysicallyInGreenzone() then
        tryDisarm()
    elseif isInAnyGreenzone() then
        exitGreenzone()
    end
end)