local isBeingRobbed = false

local function loadanimdict(dictname)
    RequestAnimDict(dictname)
    while not HasAnimDictLoaded(dictname) do
        Wait(1)
    end
end

local function openPlayerInventory(player)
    exports.ox_inventory:openInventory('player', player)
end

local function stealClosestPlayer()
    if LocalPlayer.state.isInGreenone then return lib.notify({ type = 'error', description = 'You cannot rob players in Greenzone!' }) end

    local closestPlayer = lib.getClosestPlayer(GetEntityCoords(PlayerPedId()), 5.0)
    if closestPlayer ~= nil then
        local playerheading = GetEntityHeading(PlayerPedId())
        local playerlocation = GetEntityForwardVector(PlayerPedId())
        local playerCoords = GetEntityCoords(PlayerPedId())
        local searchPlayerPed = GetPlayerPed(closestPlayer)
        local target_id = GetPlayerServerId(closestPlayer)
        if target_id ~= nil and searchPlayerPed ~= nil then
            if IsEntityPlayingAnim(searchPlayerPed, 'random@mugging3', 'handsup_standing_base', 3) or IsEntityPlayingAnim(searchPlayerPed, 'missminuteman_1ig_2', 'handsup_enter', 3) then
                TriggerServerEvent('fayqo:robPlayer', target_id, playerheading, playerCoords, playerlocation)
            else
                lib.notify({ type = 'error', description = 'The person is not raising their hands' })
            end
        end
    else
        lib.notify({ type = 'error', description = 'No one is nearby you!' })
    end
end

RegisterNetEvent('fayqo:gettingRobbed', function(playerheading, playercoords, playerlocation)
	if LocalPlayer.state.isInGreenone then return lib.notify({ type = 'error', description = 'You cannot be robbed in Greenzone!' }) end
	if IsEntityPlayingAnim(PlayerPedId(), 'random@mugging3', 'handsup_standing_base', 3) or IsEntityPlayingAnim(PlayerPedId(), 'missminuteman_1ig_2', 'handsup_enter', 3) then
		LocalPlayer.state.invBusy = true
		playerPed = PlayerPedId()
		isBeingRobbed = true
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
		local x, y, z = table.unpack(playercoords + playerlocation * 0.85)
		SetEntityCoords(PlayerPedId(), x, y, z - 0.50)
		SetEntityHeading(PlayerPedId(), playerheading)
		Wait(250)
		loadanimdict('random@mugging3')
		TaskPlayAnim(PlayerPedId(), 'random@mugging3', 'handsup_standing_base', 8.0, -8, -1, 49, 0.0, false, false, false)
		isBeingRobbed = true
		Wait(12500)
		isBeingRobbed = false
		LocalPlayer.state.invBusy = false
	else
		lib.notify({ type = 'error', description = 'You are not raising your hands!' })
	end
end)

RegisterNetEvent('fayqo:startedRobbing', function(targetid)
    loadanimdict('combat@aim_variations@arrest')
    TaskPlayAnim(PlayerPedId(), 'combat@aim_variations@arrest', 'cop_med_arrest_01', 8.0, -8, 3750, 2, 0, 0, 0, 0)
    if lib.progressBar({
        duration = 5000,
        label = 'Stealing from player...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
    }) then
        openPlayerInventory(targetid)
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        if isBeingRobbed then
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 32, true)
            DisableControlAction(0, 34, true)
            DisableControlAction(0, 31, true)
            DisableControlAction(0, 30, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 44, true)
            DisableControlAction(0, 37, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 217, true)
            DisableControlAction(0, 137, true)
            DisableControlAction(0, 288, true)
            DisableControlAction(0, 289, true)
            DisableControlAction(0, 170, true)
            DisableControlAction(0, 167, true)
            DisableControlAction(0, 0, true)
            DisableControlAction(0, 26, true)
            DisableControlAction(0, 73, true)
            DisableControlAction(2, 199, true)
            DisableControlAction(0, 59, true)
            DisableControlAction(0, 71, true)
            DisableControlAction(0, 72, true)
            DisableControlAction(2, 36, true)
            DisableControlAction(0, 47, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)

            if IsEntityPlayingAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 3) ~= 1 then
                loadanimdict('random@mugging3')
                TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 8.0, -8, -1, 49, 0.0, false, false, false)
            end
        else
            Wait(500)
        end
    end
end)

RegisterCommand('steal', function()
    stealClosestPlayer()
end)