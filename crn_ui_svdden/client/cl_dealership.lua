local awaitingModel = false
local dealershipData = nil

local dealershipCache = {
    previewColor = { r = 255, g = 255, b = 255 },
    previewCategoryIndex = 1,
    previewVehicleIndex = 1,
}

local function cleanUpVehiclesInArea(coords, radius)
    
end

local function previewVehicle(categoryIndex, vehicleIndex)
    if awaitingModel then return end

    awaitingModel = true
    DoScreenFadeOut(500)
    Wait(700)
    -- if DoesEntityExist(dealershipCache.vehiclePreviewObject) then
    -- DeleteEntity(dealershipCache.vehiclePreviewObject)
    -- end

    SetEntityAsMissionEntity(dealershipCache.vehiclePreviewObject, true, true)
    NetworkRequestControlOfEntity(dealershipCache.vehiclePreviewObject)
    DeleteVehicle(dealershipCache.vehiclePreviewObject)

    dealershipCache.previewVehicleIndex = vehicleIndex
    dealershipCache.previewCategoryIndex = categoryIndex

    local vehicle = dealershipData.vehicles[categoryIndex][vehicleIndex]

    local vehicleModel = GetHashKey(vehicle.model)
    local timer = GetGameTimer()
    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        RequestModel(vehicleModel)
        if timer + 10000 < GetGameTimer() then
            lib.notify({ title = 'Error', description = 'There was an error loading the vehicle model.', type = 'error', duration = 7500 })
            awaitingModel = false
            closeDealership()
            return
        end
        Wait(0)
    end

    dealershipCache.vehiclePreviewObject = CreateVehicle(vehicleModel, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.coords.x, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.coords.y, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.coords.z - 1, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.coords.w, false, false)
    SetEntityAsMissionEntity(dealershipCache.vehiclePreviewObject, true, true)
    SetVehicleCustomPrimaryColour(dealershipCache.vehiclePreviewObject, dealershipCache.previewColor.r, dealershipCache.previewColor.g, dealershipCache.previewColor.b)
    SetVehicleCustomSecondaryColour(dealershipCache.vehiclePreviewObject, dealershipCache.previewColor.r, dealershipCache.previewColor.g, dealershipCache.previewColor.b)
    SetVehicleDirtLevel(dealershipCache.vehiclePreviewObject, 0.0)
    SetVehicleEngineOn(dealershipCache.vehiclePreviewObject, true, true, false)
    SetVehicleLights(dealershipCache.vehiclePreviewObject, 2)
    SetVehicleWindowTint(dealershipCache.vehiclePreviewObject, 1)
    SetVehicleNumberPlateText(dealershipCache.vehiclePreviewObject, 'PDMP-REVIEW')
    SetModelAsNoLongerNeeded(vehicleModel)
    SetVehicleOnGroundProperly(dealershipCache.vehiclePreviewObject)
    
    dealershipCache.modData = (vehicle.modData or false)
    dealershipCache.forcedLivery = (vehicle.forcedLivery or false)

    if vehicle and vehicle.modData then
        for i = 1, #vehicle.modData do
            SetVehicleModKit(dealershipCache.vehiclePreviewObject, 0)
            ToggleVehicleMod(dealershipCache.vehiclePreviewObject, vehicle.modData[i].modType, true)
            SetVehicleMod(dealershipCache.vehiclePreviewObject, vehicle.modData[i].modType, vehicle.modData[i].modIndex, false)
        end
    end

    if vehicle and dealershipCache.forcedLivery then
        SetVehicleLivery(dealershipCache.vehiclePreviewObject, dealershipCache.forcedLivery)
    end

    DoScreenFadeIn(1000)
    awaitingModel = false
end

local function openDealership(vehicleShopIndex)
    SendNUIMessage({
        action = "brandingHandle",
        data = {
            state = false,
        }
    })

    LocalPlayer.state.disableInteraction = true
    LocalPlayer.state.disableHud = true
    dealershipCache.vehicleShopIndex = vehicleShopIndex
    dealershipData = lib.callback.await('dealership:fetchVehicles', false, dealershipCache.vehicleShopIndex)
    DoScreenFadeOut(1000)
    Wait(1300)


    local camCoords = Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.cam
    local deadline = GetGameTimer() + 10000

    RequestCollisionAtCoord(camCoords.x, camCoords.y, camCoords.z)
    local interior = GetInteriorAtCoords(camCoords.x, camCoords.y, camCoords.z)
    while interior == 0 and GetGameTimer() < deadline do
        Wait(100)
        RequestCollisionAtCoord(camCoords.x, camCoords.y, camCoords.z)
        interior = GetInteriorAtCoords(camCoords.x, camCoords.y, camCoords.z)
    end

    if interior ~= 0 then
        LoadInterior(interior)
        while not IsInteriorReady(interior) and GetGameTimer() < deadline do
            Wait(100)
        end
    else
        print(('[dealership] no interior resolved at %.2f, %.2f, %.2f after %dms - opening anyway')
            :format(camCoords.x, camCoords.y, camCoords.z, 10000))
    end

    if not DoesCamExist(dealershipCache.cam) then
        dealershipCache.cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamCoord(dealershipCache.cam, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.cam.x, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.cam.y, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.cam.z + 0.6)
        SetCamRot(dealershipCache.cam, 0.0, 0.0, 0.0)
        SetCamFov(dealershipCache.cam, 70.0)
        SetCamActive(dealershipCache.cam, true)
        RenderScriptCams(true, false, 0, true, true)
        PointCamAtCoord(dealershipCache.cam, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.coords.x + 1.3, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.coords.y, Config.dealerships[dealershipCache.vehicleShopIndex].vehilcePreviewData.coords.z - 0.7)    
    end

    Wait(500)
    DoScreenFadeIn(1000)
    Wait(900)

    previewVehicle(1, 1)
    nuiHandler(true, true, 'dealership', dealershipData)
end

function closeDealership()
    DoScreenFadeOut(1000)
    nuiHandler(false, false, 'dealership', nil)
    Wait(1300)
    if DoesCamExist(dealershipCache.cam) then
        while DoesCamExist(dealershipCache.cam) do
            if not DoesCamExist(dealershipCache.cam) then break end
            RenderScriptCams(false, false, 0, true, true)
            DestroyCam(dealershipCache.cam, true)
            dealershipCache.cam = nil
            Wait(500)
        end
    end

    -- DeleteEntity(dealershipCache.vehiclePreviewObject)

    SetEntityAsMissionEntity(dealershipCache.vehiclePreviewObject, true, true)
    NetworkRequestControlOfEntity(dealershipCache.vehiclePreviewObject)
    DeleteVehicle(dealershipCache.vehiclePreviewObject)

    dealershipCache.previewColor = { r = 255, g = 255, b = 255 }

    DoScreenFadeIn(1000)
    LocalPlayer.state.disableInteraction = false
    LocalPlayer.state.disableHud = false
    dealershipCache.vehicleShopIndex = nil
    dealershipData = nil
    SendNUIMessage({
        action = "brandingHandle",
        data = {
            state = true,
        }
    })
end

RegisterNUICallback('previewVehicle', function(data, cb)
    if awaitingModel then lib.notify({ title = 'Error', description = 'Please wait for the current vehicle to load.', type = 'error', duration = 7500 }) return cb('error') end
    if not data or not data.categoryIndex or not data.vehicleIndex then return cb('error') end
    previewVehicle(data.categoryIndex, data.vehicleIndex)
    cb('ok')
end)

local function endTestDrive(currentTestDriveLocation)
    SendNUIMessage({
        action = 'testDriveEnd',
    })
    DoScreenFadeOut(1000)
    Wait(1300)
    -- if DoesEntityExist(dealershipCache.testDriveVehicle) then
    --     DeleteEntity(dealershipCache.testDriveVehicle)
    --     dealershipCache.testDriveVehicle = nil
    -- end

    SetEntityAsMissionEntity(dealershipCache.testDriveVehicle, true, true)
    NetworkRequestControlOfEntity(dealershipCache.testDriveVehicle)
    DeleteVehicle(dealershipCache.testDriveVehicle)
    dealershipCache.testDriveVehicle = nil

    SetEntityCoords(PlayerPedId(), currentTestDriveLocation)
    dealershipCache.currentTestDriveLocation = nil
    lib.notify({ title = 'Success', description = 'You have returned the vehicle.', type = 'success', duration = 7500 })
    
    DoScreenFadeIn(1000)
end

RegisterNUICallback('actionSelected', function(data, cb)
    if not data or not data.action then return cb('error') end

    if data.action == 'testDrive' then
        local selectedVehicleColor = dealershipCache.previewColor
        dealershipCache.currentTestDriveLocation = GetEntityCoords(PlayerPedId())

        local coords = Config.dealerships[dealershipCache.vehicleShopIndex].testDriveCoords
        local heading = Config.dealerships[dealershipCache.vehicleShopIndex].testDriveCoords.w
        
        if dealershipData.vehicles[dealershipCache.previewCategoryIndex][dealershipCache.previewVehicleIndex].largeSeaVehicle then
            coords = vec3(-924.6702, -1620.6974, -0.7056)
            heading = 137.4033
        end

        dealershipCache.testDriveVehicle = CreateVehicle(GetEntityModel(dealershipCache.vehiclePreviewObject), coords.x, coords.y, coords.z, heading, true, true)
        SetEntityAsMissionEntity(dealershipCache.testDriveVehicle, true, true)
        SetVehicleOnGroundProperly(dealershipCache.testDriveVehicle)
        SetVehicleCustomPrimaryColour(dealershipCache.testDriveVehicle, selectedVehicleColor.r, selectedVehicleColor.g, selectedVehicleColor.b)
        SetVehicleCustomSecondaryColour(dealershipCache.testDriveVehicle, selectedVehicleColor.r, selectedVehicleColor.g, selectedVehicleColor.b)
        SetVehicleDirtLevel(dealershipCache.testDriveVehicle, 0.0)
        SetVehicleNumberPlateText(dealershipCache.testDriveVehicle, 'PDMP-TESTDRIVE')

        if dealershipCache.modData then
            for i = 1, #dealershipCache.modData do
                SetVehicleModKit(dealershipCache.testDriveVehicle, 0)
                ToggleVehicleMod(dealershipCache.testDriveVehicle, dealershipCache.modData[i].modType, true)
                SetVehicleMod(dealershipCache.testDriveVehicle, dealershipCache.modData[i].modType, dealershipCache.modData[i].modIndex, false)
            end
        end

        if dealershipCache.forcedLivery then
            SetVehicleLivery(dealershipCache.testDriveVehicle, dealershipCache.forcedLivery)
        end

        TaskWarpPedIntoVehicle(PlayerPedId(), dealershipCache.testDriveVehicle, -1)

        closeDealership()

        SendNUIMessage({
            action = 'testDriveStart',
        })

        CreateThread(function()
            while dealershipCache.testDriveVehicle do
                if IsControlPressed(0, 38) or IsControlPressed(0, 75) then
                    endTestDrive(dealershipCache.currentTestDriveLocation)
                end
                Wait(0)
            end
        end)
    elseif data.action == 'purchase' then
        data.locationIndex = dealershipCache.vehicleShopIndex
        data.color = dealershipCache.previewColor
        local result = lib.callback.await('dealership:attemptPurchase', false, data)
        if not result then return end

        local purchaseModel = GetHashKey(result.model)
        local modelDeadline = GetGameTimer() + 10000
        RequestModel(purchaseModel)
        while not HasModelLoaded(purchaseModel) do
            if GetGameTimer() > modelDeadline then
                TriggerServerEvent('AddPlayerVehicle', result.plate)
                TriggerServerEvent('giveCarKeys', result.plate)
                lib.notify({ title = 'Error', description = 'The vehicle model failed to load - it has been delivered to your garage.', type = 'error', duration = 7500 })
                return cb('error')
            end
            RequestModel(purchaseModel)
            Wait(0)
        end

        local vehicle = CreateVehicle(GetHashKey(result.model), Config.dealerships[dealershipCache.vehicleShopIndex].buyVehicleSpawn.x, Config.dealerships[dealershipCache.vehicleShopIndex].buyVehicleSpawn.y, Config.dealerships[dealershipCache.vehicleShopIndex].buyVehicleSpawn.z, Config.dealerships[dealershipCache.vehicleShopIndex].buyVehicleSpawn.w, true, true)
        TriggerServerEvent('AddPlayerVehicle', result.plate)
        TriggerServerEvent('giveCarKeys', result.plate)
        SetVehicleCustomPrimaryColour(vehicle, data.color.r, data.color.g, data.color.b)
        SetVehicleCustomSecondaryColour(vehicle, data.color.r, data.color.g, data.color.b)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetVehicleNumberPlateText(vehicle, result.plate)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetEntityAsMissionEntity(vehicle, true, true)
        SetVehicleNeedsToBeHotwired(vehicle, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        SetModelAsNoLongerNeeded(GetHashKey(result.model))
        if result and result.modData then
            for i = 1, #result.modData do
                SetVehicleModKit(vehicle, 0)
                ToggleVehicleMod(vehicle, result.modData[i].modType, true)
                SetVehicleMod(vehicle, result.modData[i].modType, result.modData[i].modIndex, false)
            end
        end

        if result and result.forcedLivery then
            SetVehicleLivery(vehicle, result.forcedLivery)
        end
        closeDealership()
    end

    cb('ok')
end)

RegisterNUICallback('testDriveEnded', function(_, cb)
    endTestDrive(dealershipCache.currentTestDriveLocation)
    cb('ok')
end)

local function convertHexToRGB(hex)
    hex = hex:gsub('#', '')
    return {
        r = tonumber('0x' .. hex:sub(1, 2)),
        g = tonumber('0x' .. hex:sub(3, 4)),
        b = tonumber('0x' .. hex:sub(5, 6)),
    }
end

RegisterNUICallback('confrimPaintChange', function(data, cb)
    if not data or not data.color then return cb('error') end
    dealershipCache.previewColor = convertHexToRGB(data.color)

    SetVehicleCustomPrimaryColour(dealershipCache.vehiclePreviewObject, dealershipCache.previewColor.r, dealershipCache.previewColor.g, dealershipCache.previewColor.b)
    SetVehicleCustomSecondaryColour(dealershipCache.vehiclePreviewObject, dealershipCache.previewColor.r, dealershipCache.previewColor.g, dealershipCache.previewColor.b)
    cb('ok')
end)

function initDealerships()
    for i = 1, #Config.dealerships do
        local dealership = Config.dealerships[i]

        if dealership.blipData then
            local blip = AddBlipForCoord(dealership.blipData.coords.x, dealership.blipData.coords.y, dealership.blipData.coords.z)
            SetBlipSprite(blip, dealership.blipData.sprite)
            SetBlipColour(blip, dealership.blipData.color)
            SetBlipScale(blip, dealership.blipData.scale)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(dealership.blipData.name)
            EndTextCommandSetBlipName(blip)
            SetBlipAsShortRange(blip, dealership.blipData.shortRange)
        end

        exports.svdden_dialog:createDialogPed({
            coords = dealership.coords,
            pedData = dealership.pedData,
            radius = dealership.interactionDistance,
            key = 'E',
            label = 'Speak with ' .. dealership.dealerName,
            dialogData = {
                icon = 'fa fa-car',
                title = dealership.dealerName,
                description = 'Would you like to speak with me about a vehicle?',
                buttons = {
                    {
                        label = 'No thanks',
                        onSelect = function() end,
                    },
                    {
                        label = 'Yes please',
                        onSelect = function()
                            openDealership(i)
                        end,
                    },
                },
            },
        })
    end
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    LocalPlayer.state.disableInteraction = false
    LocalPlayer.state.disableHud = false
    DoScreenFadeIn(1000)
end)

local bulletproofModels = {}

CreateThread(function()
    for i = 1, #Config.vehicles do
        local vehicle = Config.vehicles[i]
        if vehicle.catgeory == 'Bullet Proof' then 
            table.insert(bulletproofModels, GetHashKey(vehicle.model)) 
        end
    end
end)

exports('fetchBulletProofModels', function()
    return bulletproofModels
end)