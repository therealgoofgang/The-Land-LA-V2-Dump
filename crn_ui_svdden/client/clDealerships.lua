local showroomVehicles = {}
local spawnedVehicles = {}
local showroomByPlate = {}

local PlayerPedId = PlayerPedId
local GetEntityCoords = GetEntityCoords
local IsControlJustReleased = IsControlJustReleased
local World3dToScreen2d = World3dToScreen2d
local SetTextScale = SetTextScale
local SetTextFont = SetTextFont
local SetTextProportional = SetTextProportional
local SetTextColour = SetTextColour
local SetTextEntry = SetTextEntry
local SetTextCentre = SetTextCentre
local AddTextComponentString = AddTextComponentString
local DrawText = DrawText
local DrawRect = DrawRect

RegisterCommand("sellvehicle", function(source, args)
    local playerData = ESX.GetPlayerData()
    if not playerData.job or (playerData.job.name ~= "underground" and playerData.job.name ~= "bodily" and playerData.job.name ~= "apex") then
        lib.notify({description = "You are not allowed to sell vehicles.", type = "error"})
        return
    end

    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle == 0 then
        lib.notify({description = "You must be in a vehicle to sell it", type = "error"})
        return
    end

    local plate = ESX.Game.GetVehicleProperties(vehicle).plate
    local price = tonumber(args[1]) or 0
    if price <= 0 then
        lib.notify({description = "Invalid price", type = "error"})
        return
    end

    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    local model = GetEntityModel(vehicle)
    local coords = GetEntityCoords(vehicle)
    local heading = GetEntityHeading(vehicle)

    TaskLeaveVehicle(ped, vehicle, 0)
    Wait(1000)
    DeleteEntity(vehicle)

    TriggerServerEvent("crn_ui_svdden:addForSale", plate, price, {
        x = coords.x, y = coords.y, z = coords.z, h = heading
    }, netId, model)
end, false)

RegisterNetEvent("crn_ui_svdden:addShowroomVehicle", function(data)
    showroomVehicles[#showroomVehicles + 1] = data
    showroomByPlate[data.plate] = data
end)

RegisterNetEvent("crn_ui_svdden:removeForSale", function(plate)
    showroomByPlate[plate] = nil

    for i = #showroomVehicles, 1, -1 do
        if showroomVehicles[i].plate == plate then
            table.remove(showroomVehicles, i)
            break
        end
    end

    if spawnedVehicles[plate] then
        DeleteEntity(spawnedVehicles[plate])
        spawnedVehicles[plate] = nil
    end
end)

CreateThread(function()
    local px, py, dx, dy, distSq
    local SPAWN_SQ = 50.0 * 50.0
    local DESPAWN_SQ = 60.0 * 60.0

    while true do
        local pos = GetEntityCoords(PlayerPedId())
        px, py = pos.x, pos.y

        for i = 1, #showroomVehicles do
            local v = showroomVehicles[i]
            dx = px - v.coords.x
            dy = py - v.coords.y
            distSq = dx * dx + dy * dy

            if distSq < SPAWN_SQ and not spawnedVehicles[v.plate] then
                local vehicle = CreateVehicle(v.model, v.coords.x, v.coords.y, v.coords.z, v.coords.h, true, true)
                SetVehicleNumberPlateText(vehicle, v.plate)
                SetVehicleDoorsLocked(vehicle, 2)
                FreezeEntityPosition(vehicle, true)
                SetEntityInvincible(vehicle, true)
                SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(vehicle), false)
                spawnedVehicles[v.plate] = vehicle
            elseif distSq > DESPAWN_SQ and spawnedVehicles[v.plate] then
                DeleteEntity(spawnedVehicles[v.plate])
                spawnedVehicles[v.plate] = nil
            end
        end

        Wait(2000)
    end
end)

CreateThread(function()
    local px, py, pz, dx, dy, dz, distSq
    local INTERACT_SQ = 3.0 * 3.0
    local BUY_SQ = 2.0 * 2.0
    local CHECK_SQ = 20.0 * 20.0

    while true do
        local pos = GetEntityCoords(PlayerPedId())
        px, py, pz = pos.x, pos.y, pos.z

        local nearestData, nearestVeh, nearestDistSq = nil, nil, INTERACT_SQ

        for plate, veh in pairs(spawnedVehicles) do
            if DoesEntityExist(veh) then
                local vc = GetEntityCoords(veh)
                dx = px - vc.x
                dy = py - vc.y
                distSq = dx * dx + dy * dy

                if distSq < nearestDistSq then
                    local data = showroomByPlate[plate]
                    if data then
                        nearestData = data
                        nearestVeh = veh
                        nearestDistSq = distSq
                    end
                end
            end
        end

        if nearestData then
            local vc = GetEntityCoords(nearestVeh)
            DrawText3D(vc.x, vc.y, vc.z + 1.0, "[E] - Buy Vehicle | $" .. nearestData.price .. " | Plate: " .. nearestData.plate)

            if nearestDistSq < BUY_SQ and IsControlJustReleased(0, 38) then
                TriggerServerEvent("crn_ui_svdden:buyVehicle", nearestData.plate, nearestData.seller,
                    NetworkGetNetworkIdFromEntity(nearestVeh), nearestData.price)
            end
            Wait(0)
        else
            Wait(500)
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, sx, sy = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(sx, sy)
        DrawRect(sx, sy + 0.0125, 0.015 + #text / 370, 0.03, 0, 0, 0, 100)
    end
end