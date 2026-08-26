local isPointing = false

CreateThread(function()
    local sleep = 1000
    while true do
        if isPointing then
            local playerPed = PlayerPedId()
            if IsTaskMoveNetworkActive(playerPed) then
                local camPitch = GetGameplayCamRelativePitch()

                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end

                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = math.cos(camHeading)
                local sinCamHeading = math.sin(camHeading)

                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end

                camHeading = (camHeading + 180.0) / 360.0

                local isBlocked = false

                local coords = GetOffsetFromEntityInWorldCoords(playerPed, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local raycast = StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, playerPed, 7)
                blocked, coords = GetShapeTestResult(raycast)

                SetTaskMoveNetworkSignalFloat(playerPed, 'Pitch', camPitch)
                SetTaskMoveNetworkSignalFloat(playerPed, 'Heading', camHeading * -1.0 + 1.0)
                SetTaskMoveNetworkSignalBool(playerPed, 'isBlocked', isBlocked)
                SetTaskMoveNetworkSignalBool(playerPed, 'isFirstPerson', GetCamViewModeForContext(GetCamActiveViewModeContext()) == 4)
            end
            sleep = 0
            Wait(sleep)
        else
            sleep = 1000
            Wait(sleep)
        end
    end
end)

StartPointing = function()
    local playerPed = PlayerPedId()
    local animDict = 'anim@mp_point'

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(50)
    end

    SetPedCurrentWeaponVisible(playerPed, false, true, true, true)
    SetPedConfigFlag(playerPed, 36, true)
    TaskMoveNetworkByName(playerPed, 'task_mp_pointing', 0.5, false, animDict, 24)
    RemoveAnimDict(animDict)
end

StopPointing = function()
    local playerPed = PlayerPedId()
    
    RequestTaskMoveNetworkStateTransition(playerPed, 'Stop')

    if not IsPedInAnyVehicle(playerPed, true) then
        SetPedCurrentWeaponVisible(playerPed, true, true, true, true)
    end

    SetPedConfigFlag(playerPed, 36, false)
    ClearPedSecondaryTask(playerPed)
end

RegisterCommand('point', function()
    local playerPed = PlayerPedId()
    local animDict = 'missminuteman_1ig_2'

    if not IsPauseMenuActive() and not IsPedDeadOrDying(playerPed, 1) and IsPedOnFoot(playerPed) then
        if isPointing then
            StopPointing()
            isPointing = false
        else
            StartPointing()
            isPointing = true
        end
    end
end)

RegisterKeyMapping('point', '(Extras) Toggle Point', 'keyboard', 'B')
