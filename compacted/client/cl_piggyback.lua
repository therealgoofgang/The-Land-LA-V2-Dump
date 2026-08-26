
local piggyback = {
	InProgress = false,
	targetSrc = -1,
	type = "",
	personPiggybacking = {
		animDict = "anim@arena@celeb@flat@paired@no_props@",
		anim = "piggyback_c_player_a",
		flag = 49,
	},
	personBeingPiggybacked = {
		animDict = "anim@arena@celeb@flat@paired@no_props@",
		anim = "piggyback_c_player_b",
		attachX = 0.0,
		attachY = -0.07,
		attachZ = 0.45,
		flag = 33,
	}
}

local function drawNativeNotification(text)
	lib.notify({
		type = 'inform',
		description = text
	})
end

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(targetCoords-playerCoords)
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
    return animDict
end

RegisterCommand("piggyback",function(source, args)
	if IsPedInAnyVehicle(PlayerPedId(), false) then return lib.notify({ type = 'error', description = 'You can not do this in a vehicle' }) end

	local closestPlayer = GetClosestPlayer(3)
	if closestPlayer then
		local targetSrc = GetPlayerServerId(closestPlayer)
		if targetSrc == -1 then
			drawNativeNotification("No one nearby to piggyback!")
			return
		end
	else
		drawNativeNotification("No one nearby to piggyback!")
		return
	end

	if lib.progressBar({
        duration = 500,
        label = 'Trying to ' .. (piggyback.InProgress and 'stop' or 'start') .. ' piggyback',
        useWhileDead = false,
        canCancel = true,
        allowFalling = false,
        allowRagdoll = false,
        allowSwimming = false,
        disable = {
            car = true,
            combat = true,
            move = true,
            sprint = true,
        },
    }) then 
		if not piggyback.InProgress then
			local closestPlayer = GetClosestPlayer(3)
			if closestPlayer then
				local targetSrc = GetPlayerServerId(closestPlayer)
				if targetSrc ~= -1 then
					piggyback.InProgress = true
					piggyback.targetSrc = targetSrc
					TriggerServerEvent("Piggyback:sync",targetSrc)
					ensureAnimDict(piggyback.personPiggybacking.animDict)
					piggyback.type = "piggybacking"
				else
					drawNativeNotification("No one nearby to piggyback!")
				end
			else
				drawNativeNotification("No one nearby to piggyback!")
			end
		else
			piggyback.InProgress = false
			ClearPedSecondaryTask(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
			TriggerServerEvent("Piggyback:stop",piggyback.targetSrc)
			piggyback.targetSrc = 0
		end
	end
end,false)

RegisterNetEvent("Piggyback:syncTarget")
AddEventHandler("Piggyback:syncTarget", function(targetSrc)
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(targetSrc))
	piggyback.InProgress = true
	ensureAnimDict(piggyback.personBeingPiggybacked.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, piggyback.personBeingPiggybacked.attachX, piggyback.personBeingPiggybacked.attachY, piggyback.personBeingPiggybacked.attachZ, 0.5, 0.5, 180, false, false, false, false, 2, false)
	piggyback.type = "beingPiggybacked"
end)

RegisterNetEvent("Piggyback:cl_stop")
AddEventHandler("Piggyback:cl_stop", function()
	piggyback.InProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if piggyback.InProgress then
			sleep = 5
			if piggyback.type == "beingPiggybacked" then
				if not IsEntityPlayingAnim(PlayerPedId(), piggyback.personBeingPiggybacked.animDict, piggyback.personBeingPiggybacked.anim, 3) then
					TaskPlayAnim(PlayerPedId(), piggyback.personBeingPiggybacked.animDict, piggyback.personBeingPiggybacked.anim, 8.0, -8.0, 100000, piggyback.personBeingPiggybacked.flag, 0, false, false, false)
				end
			elseif piggyback.type == "piggybacking" then
				if not IsEntityPlayingAnim(PlayerPedId(), piggyback.personPiggybacking.animDict, piggyback.personPiggybacking.anim, 3) then
					TaskPlayAnim(PlayerPedId(), piggyback.personPiggybacking.animDict, piggyback.personPiggybacking.anim, 8.0, -8.0, 100000, piggyback.personPiggybacking.flag, 0, false, false, false)
				end
			end
		else
			sleep = 1000
		end
		Wait(sleep)
	end
end)