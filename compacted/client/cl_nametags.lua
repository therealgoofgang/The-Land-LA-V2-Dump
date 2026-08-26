nametags = false
local playerDistances = {}
local myPed, myCoords

RegisterCommand('tognames', function()
    nametags = not nametags
    if nametags then
        ShowTags()
    end
end)

function ShowTags()
    local distance = Config.Distance or 2.0
    local vehDistance = Config.DistanceInVehicle or 2.0

    CreateThread(function()
        while nametags do
            myPed = PlayerPedId()
            myCoords = GetEntityCoords(myPed)
            local players = GetActivePlayers()

            for i = 1, #players do
                local id = players[i]
                local targetPed = GetPlayerPed(id)
                if targetPed ~= myPed then
                    playerDistances[id] = #(myCoords - GetEntityCoords(targetPed))
                end
            end

            Wait(500)
        end

        table.wipe(playerDistances)
    end)

    CreateThread(function()
        while nametags do
            local sleep = 500
            local maxDist = IsPedInAnyVehicle(myPed, false) and vehDistance or distance
            local players = GetActivePlayers()

            for i = 1, #players do
                local id = players[i]
                local dist = playerDistances[id]

                if dist and dist < maxDist then
                    local targetPed = GetPlayerPed(id)

                    if targetPed ~= myPed and IsEntityVisible(targetPed) and HasEntityClearLosToEntity(myPed, targetPed, 17) and not IsPedInAnyVehicle(targetPed, false) then
                        sleep = 5
                        local targetId = GetPlayerServerId(id)
                        local maskDrawable = GetPedDrawableVariation(targetPed, 1)
                        local displayName

                        local tag = maskDrawable ~= 0 and 'Masked Individual' or Player(targetId).state.nametag or 'Unknown'
                        local gang = Player(targetId).state.gang
                        displayName = tag .. ' [' .. targetId .. ']' .. (gang and ' - (' .. gang .. ')' or '')

                        if displayName then
                            local coords = GetEntityCoords(targetPed)
                            DrawText3D(coords.x, coords.y, coords.z + 1.0, displayName, 255, 255, 255)
                        end
                    end
                end
            end

            Wait(sleep)
        end
    end)
end

function DrawText3D(x, y, z, text, r, g, b)
    local onScreen, sx, sy = GetScreenCoordFromWorldCoord(x, y, z)
    if not onScreen then return end

    SetTextScale(0.3, 0.3)
    SetTextFont(0)
    SetTextProportional(true)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(sx, sy)
end