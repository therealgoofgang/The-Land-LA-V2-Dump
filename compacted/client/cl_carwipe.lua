local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end

    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)

    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next

    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local ignoreVehicles = {
  [-730904777] = true,
  [-1989691485] = true,
  [-1917016601] = true,
  [-184773924] = true,
  [-1555796705] = true,
  [-227413559] = true,
  [-1204003331] = true,
  [-893954051] = true,
  [-1252161686] = true,
  [`tlla_mdalamo`] = true,
  [`tlla_mdbuffalo`] = true,
  [`tlla_mdcaracara`] = true,
  [`tlla_mddominator`] = true,
  [`tlla_mddubsta`] = true,
  [`tlla_mdg4m82`] = true,
  [`tlla_mdheli`] = true,
  [`tlla_mdobey`] = true,
  [`tlla_mdsandstorm`] = true,
  [`reepems`] = true,
  [`rodgeems`] = true,
  [`17mov_WindowCar`] = true
}

RegisterNetEvent("delallveh")
AddEventHandler("delallveh", function ()
  TriggerEvent('chatMessage', '', {255, 255, 255}, "^1Vehicle Cleanup in 30 seconds^3.")
  Wait(20000)
  TriggerEvent('chatMessage', '', {255, 255, 255}, "^1Vehicle Cleanup in 10 seconds^3.")
  Wait(5000)
  for i = 5, 1, -1 do
    TriggerEvent('chatMessage', '', {255, 255, 255}, "^1Vehicle Cleanup in " .. i .. " second(s)^3.")
    Wait(1000)
  end

  local count = 0
  for vehicle in EnumerateVehicles() do
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local model = GetEntityModel(vehicle)
    local numberPlateText = GetVehicleNumberPlateText(vehicle)



    if not IsPedAPlayer(driver) then
      if numberPlateText then
        numberPlateText = string.upper(numberPlateText)
      end
      if not ignoreVehicles[model] and not numberPlateText:find("PD") and not numberPlateText:find("EMS") then
        SetVehicleHasBeenOwnedByPlayer(vehicle, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)
        if DoesEntityExist(vehicle) then
          DeleteEntity(vehicle)
        end
        count = count + 1
      else
        -- print(("Skipping ignored vehicle (model hash: %s)"):format(model))
      end
    end
  end

  TriggerEvent('chatMessage', '', { 255, 255, 255 }, "^1Vehicle Cleanup Complete!^3.")     --- This is massage after the cleanup has been completed!
end)

-- RegisterCommand('testCleanup', function()
--   TriggerEvent("delallveh")
-- end, false)

RegisterCommand('vehiclehash', function()
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  if veh and veh ~= 0 then
    local model = GetEntityModel(veh)
    print("Your vehicle model hash is:", model)
    TriggerEvent('chatMessage', '', {255, 255, 255}, "Model hash: " .. model)
  else
    print("Not in a vehicle.")
  end
end, false)
