local function FlashBlip(blip)
	Citizen.CreateThread(function()
		while true do
			if IsPauseMenuActive() then
				SetBlipAlpha(blip, 0)
				Citizen.Wait(500)
				SetBlipAlpha(blip, 255)
				Citizen.Wait(500)
			else
				Wait(4500)
			end
			
		end
	end)
end

local function initBlips()
	for k,v in pairs(Config.blips) do
		local blip = AddBlipForCoord(v.coords)
		if v.flash then
			FlashBlip(blip)
		end
		SetBlipSprite(blip, v.sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, v.scale)
		SetBlipColour(blip, v.color)
		SetBlipAsShortRange(blip, v.shortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.name)
		EndTextCommandSetBlipName(blip)
	end
end

CreateThread(function()
    initBlips()
end)

