local hold = {
    InProgress = false,
    targetSrc = -1,
    type = "",
    personholding = {
        animDict = "anim@move_m@trash",
        anim = "idle",
        flag = 49,
    },
}

local controls = {36, 25, 24, 47, 58}

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(targetCoords - playerCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end

    if closestDistance ~= -1 and closestDistance <= radius then
        return closestPlayer
    else
        return nil
    end
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end
    end
end

RegisterCommand("hold", function()
    if not hold.InProgress then
        local closestPlayer = GetClosestPlayer(3)
        if closestPlayer then
            local targetSrc = GetPlayerServerId(closestPlayer)
            TriggerServerEvent("hold:requestHold", targetSrc)
            ESX.ShowNotification("You sent a hold request.")
        else
            ESX.ShowNotification("No one nearby to hold!")
        end
    else
        hold.InProgress = false
        ClearPedSecondaryTask(PlayerPedId())
        DetachEntity(PlayerPedId(), true, false)
    StopAnimTask(PlayerPedId(), "move_m@multiplayer", "walk", 1.0)
    ResetPedMovementClipset(PlayerPedId(), 0.0)
        TriggerServerEvent("hold:stop", hold.targetSrc)
        hold.type = ""
        hold.targetSrc = -1
        for _, control in ipairs(controls) do
            EnableControlAction(0, control, true)
        end
    end
end)

RegisterNetEvent("hold:receiveRequest", function(fromSrc)
    lib.notify({
        title = "Hold Request",
        description = GetPlayerName(GetPlayerFromServerId(fromSrc)) .. " wants to hold you.",
        type = "info"
    })

    lib.registerContext({
        id = 'hold_confirm_menu',
        title = 'Hold Request',
        options = {
            {
                title = "✔️ Accept",
                onSelect = function()
                    TriggerServerEvent("hold:sync", fromSrc)
                end
            },
            {
                title = "❌ Decline",
                onSelect = function()
                    TriggerServerEvent("hold:decline", fromSrc)
                end
            }
        }
    })

    lib.showContext('hold_confirm_menu')
end)

RegisterNetEvent("hold:startHolding")
AddEventHandler("hold:startHolding", function(targetSrc)
    hold.InProgress = true
    hold.targetSrc = targetSrc
    hold.type = "holding"
    ensureAnimDict(hold.personholding.animDict)
    TaskPlayAnim(PlayerPedId(), hold.personholding.animDict, hold.personholding.anim, 8.0, -8.0, -1, hold.personholding.flag, 0, false, false, false)
end)

RegisterNetEvent("hold:startBeingHeld")
AddEventHandler("hold:startBeingHeld", function(holderSrc)
    hold.InProgress = true
    hold.targetSrc = holderSrc
    hold.type = "beingholded"
    local playerPed = PlayerPedId()
    local holderPed = GetPlayerPed(GetPlayerFromServerId(holderSrc))

    AttachEntityToEntity(playerPed, holderPed, 11816, 0.35, 0.17, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

    local dict = "move_m@multiplayer"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(playerPed, dict, "walk", 8.0, -8.0, -1, 1, 0, false, false, false)
    
end)

RegisterNetEvent("hold:cl_stop", function()
    hold.InProgress = false
    ClearPedSecondaryTask(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    StopAnimTask(PlayerPedId(), "move_m@multiplayer", "walk", 1.0)
    ResetPedMovementClipset(PlayerPedId(), 0.0)
    TriggerServerEvent("hold:stop", hold.targetSrc)
    hold.type = ""
    hold.targetSrc = -1
    for _, control in ipairs(controls) do
        EnableControlAction(0, control, true)
    end
end)

-- Controls logic
Citizen.CreateThread(function()
	while true do
		local WaitTime = 500
		if hold.InProgress then
			WaitTime = 0
			if hold.type == "beingholded" then
				for _, control in ipairs(controls) do
					DisableControlAction(0, control, true)
				end
				local playerPed = PlayerPedId()
				local target = GetPlayerPed(GetPlayerFromServerId(hold.targetSrc))
				if IsPedWalking(target) then
					local coords = GetEntityCoords(playerPed) + GetEntityForwardVector(playerPed)
					TaskGoStraightToCoord(playerPed, coords.x, coords.y, coords.z, 1.0, -1, GetEntityHeading(target), 0.0)
				elseif IsPedRunning(target) or IsPedSprinting(target) then
					local dict = 'move_m@multiplayer'
					if not IsEntityPlayingAnim(playerPed, dict, 'run', 3) then
						RequestAnimDict(dict)
						TaskPlayAnim(playerPed, dict, 'run', 8.0, -8, -1, 1, 0.0, false, false, false)
					end
				else
					ClearPedTasks(PlayerPedId())
				end
			elseif hold.type == "holding" then
				for _, control in ipairs(controls) do
					DisableControlAction(0, control, true)
				end
				if not IsEntityPlayingAnim(PlayerPedId(), hold.personholding.animDict, hold.personholding.anim, 3) then
					TaskPlayAnim(PlayerPedId(), hold.personholding.animDict, hold.personholding.anim, 8.0, -8.0, 100000, hold.personholding.flag, 0, false, false, false)
				end
			end
		end
		Wait(WaitTime)
	end
end)