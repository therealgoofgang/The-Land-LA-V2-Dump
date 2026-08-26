Citizen.CreateThread(function()
    local crutchModel = `crutch`
    local bagModel = `p_michael_backpack_s`
    while true do
		local cObjectPool = GetGamePool('CObject')
		for i = 1, #cObjectPool do
			if GetEntityModel(cObjectPool[i]) == crutchModel or GetEntityModel(cObjectPool[i]) == bagModel then
				local crutchCoords = GetEntityCoords(cObjectPool[i])
				local players = GetActivePlayers()
				local playerNear = false
				for j = 1, #players do
					local playerPed = GetPlayerPed(players[j])
					local playerCoords = GetEntityCoords(playerPed)
					if #(crutchCoords - playerCoords) < 2.0 then
						playerNear = true
						break
					end
				end
				if not playerNear then
					DeleteEntity(cObjectPool[i])
				end
			end
		end
        Wait(30000)
    end
end)