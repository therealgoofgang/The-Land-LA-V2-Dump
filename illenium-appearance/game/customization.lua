local logger = require("modules.utility.shared.logger")
local gameBridge = require("game.bridge")

local playerAppearance = nil
local isCameraInterpolating = false
local currentCamera = nil
local currentCameraKey = nil
local currentHeading = nil
local currentPosition = nil
local customizationCallback = nil
local customizationConfig = nil
local isPedTurned = false

function getAppearance()
  if not playerAppearance then
    logger.debugf("[game] [customization] [getAppearance] variable `playerAppearance` was nil, calling getPedAppearance")
    playerAppearance = client.getPedAppearance(cache.ped)
  end
  return playerAppearance
end

client.getAppearance = getAppearance

function getConfig()
  return customizationConfig
end

client.getConfig = getConfig

function setCamera(cameraKey)
  if isCameraInterpolating then
    logger.infof("[game] [customization] [setCamera] returning since isCameraInterpolating is true, key: (%s)", cameraKey)
    return
  end

  if cameraKey ~= "current" then
    currentCameraKey = cameraKey
  end

  local cameraStart, cameraEnd = table.unpack(constants.CAMERAS[currentCameraKey])
  local direction = isPedTurned and -1 or 1

  if not currentCamera then
    local startOffset = GetOffsetFromEntityInWorldCoords(cache.ped, cameraStart.x, cameraStart.y, cameraStart.z)
    local endOffset = GetOffsetFromEntityInWorldCoords(cache.ped, cameraEnd.x, cameraEnd.y, cameraEnd.z)
    currentCamera = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", startOffset.x, startOffset.y, startOffset.z, 0.0, 0.0, 0.0, 49.0, false, 0)
    PointCamAtCoord(currentCamera, endOffset.x, endOffset.y, endOffset.z)
    SetCamActive(currentCamera, true)
    return
  end

  local startOffset = GetOffsetFromEntityInWorldCoords(cache.ped, cameraStart.x * direction, cameraStart.y * direction, cameraStart.z * direction)
  local endOffset = GetOffsetFromEntityInWorldCoords(cache.ped, cameraEnd.x, cameraEnd.y, cameraEnd.z)
  local newCamera = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", startOffset.x, startOffset.y, startOffset.z, 0.0, 0.0, 0.0, 49.0, false, 0)
  PointCamAtCoord(newCamera, endOffset.x, endOffset.y, endOffset.z)
  SetCamActiveWithInterp(newCamera, currentCamera, 1000, 1, 1)
  isCameraInterpolating = true

  CreateThread(function()
    repeat
      Wait(500)
    until not IsCamInterpolating(currentCamera) and IsCamActive(newCamera)
    DestroyCam(currentCamera, false)
    currentCamera = newCamera
    isCameraInterpolating = false
  end)
end

client.setCamera = setCamera

function rotateCamera(direction)
  if not isCameraInterpolating then
    local cameraStart, cameraEnd = table.unpack(constants.CAMERAS[currentCameraKey])
    local offset = constants.OFFSETS[currentCameraKey]
    local rotationDirection = (direction == "left") and 1 or -1
    local directionMultiplier = isPedTurned and -1 or 1

    local startOffset = GetOffsetFromEntityInWorldCoords(
      cache.ped,
      (cameraStart.x + offset.x) * rotationDirection * directionMultiplier,
      (cameraStart.y + offset.y) * directionMultiplier,
      cameraStart.z
    )
    local endOffset = GetOffsetFromEntityInWorldCoords(cache.ped, cameraEnd.x, cameraEnd.y, cameraEnd.z)
    local newCamera = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", startOffset.x, startOffset.y, startOffset.z, 0.0, 0.0, 0.0, 49.0, false, 0)
    PointCamAtCoord(newCamera, endOffset.x, endOffset.y, endOffset.z)
    SetCamActiveWithInterp(newCamera, currentCamera, 1000, 1, 1)
    isCameraInterpolating = true

    CreateThread(function()
      repeat
        Wait(500)
      until not IsCamInterpolating(currentCamera) and IsCamActive(newCamera)
      DestroyCam(currentCamera, false)
      currentCamera = newCamera
      isCameraInterpolating = false
    end)
  end
end

client.rotateCamera = rotateCamera

function pedTurn(ped, angle)
  isPedTurned = not isPedTurned
  local sequence = OpenSequenceTask()
  if sequence then
    TaskGoStraightToCoord(0, currentPosition.x, currentPosition.y, currentPosition.z, 8.0, -1, GetEntityHeading(ped) - angle, 0.1)
    TaskStandStill(0, -1)
    CloseSequenceTask(sequence)
    ClearPedTasks(ped)
    TaskPerformSequence(ped, sequence)
    ClearSequenceTask(sequence)
  end
end

client.pedTurn = pedTurn

function wearClothes(appearance, outfitKey)
  local outfitData = constants.DATA_CLOTHES[outfitKey]
  local components = outfitData.components[client.getPedDecorationType()]
  local props = outfitData.props[client.getPedDecorationType()]

  for _, component in ipairs(components) do
    for _, pedComponent in ipairs(appearance.components) do
      if pedComponent.component_id == component[1] then
        SetPedComponentVariation(cache.ped, component[1], pedComponent.drawable, pedComponent.texture, 2)
      end
    end
  end

  for _, prop in ipairs(props) do
    for _, pedProp in ipairs(appearance.props) do
      if pedProp.prop_id == prop[1] then
        SetPedPropIndex(cache.ped, prop[1], pedProp.drawable, pedProp.texture, true)
      end
    end
  end
end

client.wearClothes = wearClothes

function removeClothes(outfitKey)
  local outfitData = constants.DATA_CLOTHES[outfitKey]
  local components = outfitData.components[client.getPedDecorationType()]
  local props = outfitData.props[client.getPedDecorationType()]

  for _, component in ipairs(components) do
    SetPedComponentVariation(cache.ped, component[1], component[2], 0, 2)
  end

  for _, prop in ipairs(props) do
    ClearPedProp(cache.ped, prop[1])
  end
end

client.removeClothes = removeClothes

function getHeading()
  return currentHeading
end

client.getHeading = getHeading

function startPlayerCustomization(callback, config)
  repeat
    Wait(0)
  until IsScreenFadedIn() and not IsPlayerTeleportActive() and not IsPlayerSwitchInProgress()

  playerAppearance = client.getPedAppearance(cache.ped)
  currentPosition = GetEntityCoords(cache.ped, true)
  currentHeading = GetEntityHeading(cache.ped)
  BackupPlayerStats()
  customizationCallback = callback
  customizationConfig = config
  isPedTurned = false
  isCameraInterpolating = false
  setCamera("default")
  SetNuiFocus(true, true)
  SetNuiFocusKeepInput(false)
  RenderScriptCams(true, true, 250, true, true)
  SetEntityInvincible(cache.ped, Config.InvincibleDuringCustomization)
  TaskStandStill(cache.ped, -1)
  lib.hideTextUI()
  if Config.HideRadar then
    DisplayRadar(false)
  end
  gameBridge:onCustomizationStart(callback)
  Interface:syncCharacterAppearanceStateAndSettingsState(config)
  Interface:toggle(true, true)
end

client.startPlayerCustomization = startPlayerCustomization

function exitPlayerCustomization(appearance)
  RenderScriptCams(false, true, 250, true, true)
  DestroyCam(currentCamera, false)
  if Config.HideRadar then
    DisplayRadar(true)
  end
  ClearPedTasksImmediately(cache.ped)
  SetEntityInvincible(cache.ped, false)
  Interface:toggle(false, true)

  if not appearance then
    client.setPlayerAppearance(getAppearance())
  else
    client.setPedTattoos(cache.ped, appearance.tattoos)
  end

  RestorePlayerStats()
  gameBridge:onCustomizationExit()
  if customizationCallback then
    customizationCallback(appearance)
  end

  customizationCallback = nil
  customizationConfig = nil
  playerAppearance = nil
  currentPosition = nil
  currentCamera = nil
  currentCameraKey = nil
  isPedTurned = nil
  isCameraInterpolating = nil
end

client.exitPlayerCustomization = exitPlayerCustomization

AddEventHandler("onResourceStop", function(resourceName)
  if resourceName == GetCurrentResourceName() then
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
  end
end)

exports("startPlayerCustomization", client.startPlayerCustomization)