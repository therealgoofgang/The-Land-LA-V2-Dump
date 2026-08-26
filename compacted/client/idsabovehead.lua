local isHoldingViewKey = false
local disPlayerNames = 5
local playerInDistanceCache = {}
local customScale = 0.55
local useCustomScale = false

local function DrawText3D(position, text, r, g, b)
    local camPos = GetGameplayCamCoord()
    local fov = GetGameplayCamFov()

    local onScreen, _x, _y = World3dToScreen2d(position.x, position.y, position.z + 1.0)
    if not onScreen then return end
    local dist = #(camPos - position)
    if dist < 0.001 then dist = 0.001 end
    local scale = ((1.0 / dist) * 2.0) * ((1.0 / fov) * 100.0)
    if not useCustomScale then
        SetTextScale(0.0 * scale, 0.55 * scale)
    else
        SetTextScale(0.0 * scale, customScale)
    end
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end

Citizen.CreateThread(function()
    local sleep = 100
    while true do
        if isHoldingViewKey then
            for id, distance in pairs(playerInDistanceCache) do
                local targetPed = GetPlayerPed(id)
                if DoesEntityExist(targetPed) then
                    local targetPedCords = GetEntityCoords(targetPed)
                    if NetworkIsPlayerTalking(id) then
                        DrawText3D(targetPedCords, tostring(GetPlayerServerId(id)), 50, 50, 255)
                    else
                        DrawText3D(targetPedCords, tostring(GetPlayerServerId(id)), 255, 255, 255)
                    end
                end
            end
        end

        if IsControlPressed(0, 303) then
            isHoldingViewKey = true
            sleep = 0
        else
            isHoldingViewKey = false
            sleep = 100
        end

        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        playerInDistanceCache = {}

        for _, id in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(id)
            local distance = #(GetEntityCoords(cache.ped)-GetEntityCoords(targetPed))
            if distance < disPlayerNames then
                playerInDistanceCache[id] = distance
            end
        end
        Wait(1000)
    end
end)