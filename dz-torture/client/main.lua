
ESX    = nil
QBCore = nil

if Config.Framework == "qbcore" then
	QBCore = exports[Config.QBCoreName]:GetCoreObject()
elseif Config.Framework == "esx" then
	if Config.IsESXLegacy then
		ESX = exports[Config.ESXLegacyName]:getSharedObject()
	else
		ESX = nil
		CreateThread(function()
			while ESX == nil do
				TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
				Citizen.Wait(0)
			end
		end)
	end
else
	RegisterCommand(Config.TortureSceneCommand, function()
		ToggleTotureKitSpawner()
	end)
end

function Notify(msg, type)
	if (Config.Framework == "qbcore") and (QBCore ~= nil) then
		local notif = (((type == 2) and "error") or "success")
		QBCore.Functions.Notify(msg, notif, 5000)
	elseif (Config.Framework == "esx") and (ESX ~= nil) then
		local notif = (((type == 2) and "~r~") or "~g~")
		ESX.ShowNotification(notif..""..msg)
	else
		local notif = (((type == 2) and "~r~") or "~g~")
		SetNotificationTextEntry('STRING')
		AddTextComponentSubstringPlayerName(notif..""..msg)
		DrawNotification(false, true)
	end
end

RegisterNetEvent("dz-torture:client:Notify", function(msg, type)
	Notify(msg, type)
end)

RegisterNetEvent("dz-torture:client:TotureKitSpawner", function()
	ToggleTotureKitSpawner()
end)

function AddTortureKitItem()
	TriggerServerEvent('dz-torture:server:AddTortureKitItem')
end

function RemoveTortureKitItem()
	TriggerServerEvent('dz-torture:server:RemoveTortureKitItem')
end





-- This is a triggered event for each torture stage
-- This triggered requested by few customers to add their own code

RegisterNetEvent("dz-torture:client:TortureActionTriggered", function(player, action)
	-- Player Type: "1" torturer | "2" victim
	
	
	-- Actions List:
	
	-- torture-started
	-- torture-ended
	
	-- scene-wrench-intro
	-- scene-wrench-right
	-- scene-wrench-left
	-- scene-wrench-middle
	
	-- scene-jerrycan-intro
	-- scene-jerrycan-drown
	-- scene-jerrycan-stop
	
	-- scene-pullTooth-intro
	-- scene-pullTooth-pull
	-- scene-pullTooth-stop
	-- scene-pullTooth-exit
	
	-- scene-electrocute-intro
	-- scene-electrocute-right
	-- scene-electrocute-left
	-- scene-electrocute-both
	-- scene-electrocute-spark
	-- scene-electrocute-exit
	
	-- scene-syringe
end)