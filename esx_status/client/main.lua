local OriginalStatus, Status, isPaused = {}, {}, false

-- Hash map: name -> status object. O(1) lookup instead of linear scan.
local StatusByName = {}

-- Pre-allocated reusable tables for tick data (avoids GC churn)
local tickData = {}
local tickDataCount = 0

local function RebuildTickData()
	tickData = {}
	tickDataCount = #Status
	for i = 1, tickDataCount do
		tickData[i] = { name = '', val = 0, percent = 0, color = '', visible = false }
	end
end

local function RebuildIndex()
	StatusByName = {}
	for i = 1, #Status do
		StatusByName[Status[i].name] = Status[i]
	end
end

function GetStatusData(minimal)
	local status = {}
	for i = 1, #Status do
		if minimal then
			status[i] = {
				name    = Status[i].name,
				val     = Status[i].val,
				percent = (Status[i].val / Config.StatusMax) * 100
			}
		else
			status[i] = {
				name    = Status[i].name,
				val     = Status[i].val,
				color   = Status[i].color,
				visible = Status[i].visible(Status[i]),
				percent = (Status[i].val / Config.StatusMax) * 100
			}
		end
	end
	return status
end

AddEventHandler('esx_status:registerStatus', function(name, default, color, visible, tickCallback)
	local status = CreateStatus(name, default, color, visible, tickCallback)

	for i = 1, #OriginalStatus do
		if status.name == OriginalStatus[i].name then
			status.set(OriginalStatus[i].val)
		end
	end

	table.insert(Status, status)
	RebuildIndex()
	RebuildTickData()
end)

AddEventHandler('esx_status:unregisterStatus', function(name)
	for k, v in ipairs(Status) do
		if v.name == name then
			table.remove(Status, k)
			break
		end
	end
	RebuildIndex()
	RebuildTickData()
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	Status = {}
	StatusByName = {}
	tickData = {}
	tickDataCount = 0
	if Config.Display then
		SendNUIMessage({
			update = true,
			status = Status
		})
	end
end)

RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(status)
	OriginalStatus = status
	ESX.PlayerLoaded = true
	TriggerEvent('esx_status:loaded')

	if Config.Display then TriggerEvent('esx_status:setDisplay', 0.5) end

	CreateThread(function()
		Wait(100)
		RebuildTickData()
		RebuildIndex()

		local statusMax = Config.StatusMax
		local display = Config.Display
		local n

		while ESX.PlayerLoaded do
			n = #Status

			for i = 1, n do
				Status[i].onTick()

				local d = tickData[i]
				if d then
					d.name = Status[i].name
					d.val = Status[i].val
					d.percent = (Status[i].val / statusMax) * 100
				end
			end

			if display then
				for i = 1, n do
					local d = tickData[i]
					if d then
						d.color = Status[i].color
						d.visible = Status[i].visible(Status[i])
					end
				end
				SendNUIMessage({
					update = true,
					status = tickData
				})
			end

			TriggerEvent('esx_status:onTick', tickData)
			Wait(Config.TickTime)
		end
	end)
end)

-- All lookups use StatusByName hash — O(1) instead of O(n) loop

RegisterNetEvent('esx_status:set')
AddEventHandler('esx_status:set', function(name, val)
	local s = StatusByName[name]
	if s then s.set(val) end
	if Config.Display then
		SendNUIMessage({ update = true, status = GetStatusData() })
	end
end)

RegisterNetEvent('esx_status:add')
AddEventHandler('esx_status:add', function(name, val)
	local s = StatusByName[name]
	if s then s.add(val) end
	if Config.Display then
		SendNUIMessage({ update = true, status = GetStatusData() })
	end
end)

RegisterNetEvent('esx_status:remove')
AddEventHandler('esx_status:remove', function(name, val)
	local s = StatusByName[name]
	if s then s.remove(val) end
	if Config.Display then
		SendNUIMessage({ update = true, status = GetStatusData() })
	end
end)

AddEventHandler('esx_status:getStatus', function(name, cb)
	local s = StatusByName[name]
	if s then cb(s) end
end)

AddEventHandler('esx_status:getAllStatus', function(cb)
	cb(Status)
end)

AddEventHandler('esx_status:setDisplay', function(val)
	SendNUIMessage({
		setDisplay = true,
		display    = val
	})
end)

-- Pause menu disable hud display
if Config.Display then
	AddEventHandler('esx:pauseMenuActive', function(state)
		if state then
			isPaused = true
			TriggerEvent('esx_status:setDisplay', 0.0)
			return
		end
		isPaused = false
		TriggerEvent('esx_status:setDisplay', 0.5)
	end)

	AddEventHandler('esx:loadingScreenOff', function()
		if not isPaused then
			TriggerEvent('esx_status:setDisplay', 0.3)
		end
	end)
end

-- Update server
CreateThread(function()
	while true do
		Wait(Config.UpdateInterval)
		if ESX.PlayerLoaded then TriggerServerEvent('esx_status:update', GetStatusData(true)) end
	end
end)
