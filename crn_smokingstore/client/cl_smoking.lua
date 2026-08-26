local SMOKING_DATA_STORE = {
    currentlyVaping = false,
    vapeEntity = nil,
    buffActive = false,
}

local function hitVape(itemData)
    local slot = itemData.slot
    local playerInventory = exports.ox_inventory:GetPlayerItems()
    local itemDataAtSlot = playerInventory[slot]
    if not itemDataAtSlot then return Config.clientNotify('error', 'Item not found.') end
    if itemData.name ~= itemDataAtSlot.name then return Config.clientNotify('error', 'You\'ve moved the item.') end

    TriggerServerEvent('crn_smoking:server:smokeVape', slot)
    local animDict = "amb@world_human_smoking@male@male_b@base"
    local animClip = "base"

    lib.requestAnimDict(animDict, 2000)
    
    TaskPlayAnim(cache.ped, animDict, animClip, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)
    Wait(4000)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    Wait(1500)
    TriggerServerEvent('crn_smoking:server:smokeSync')

    RemoveAnimDict(animDict)
end

local function stopVaping()
    SMOKING_DATA_STORE.currentlyVaping = false

    ClearPedTasks(cache.ped)
    lib.hideTextUI()
    SetModelAsNoLongerNeeded(GetEntityModel(SMOKING_DATA_STORE.vapeEntity))
    DeleteEntity(SMOKING_DATA_STORE.vapeEntity)

    SetPedMoveRateOverride(PlayerPedId(), 1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function startVaping(itemData)
    if SMOKING_DATA_STORE and SMOKING_DATA_STORE.currentlyVaping then return Config.clientNotify('error', 'You are already vaping.') end
    local attachmentData = SmokingVapes[itemData.name].attachmentData
    if not attachmentData then return Config.clientNotify('error', 'This item cannot be vaped.') end

    SMOKING_DATA_STORE.currentlyVaping = true

    lib.showTextUI('[G] Hit [H] Put Away')

    local model = GetHashKey(attachmentData.Prop)

    lib.requestModel(model, 4000)

    SMOKING_DATA_STORE.vapeEntity = CreateObject(model, 0.0, 0.0, 0.0, true, false, true)
    AttachEntityToEntity(SMOKING_DATA_STORE.vapeEntity, cache.ped, GetPedBoneIndex(cache.ped, attachmentData.PropBone), attachmentData.PropPlacement[1], attachmentData.PropPlacement[2], attachmentData.PropPlacement[3], attachmentData.PropPlacement[4], attachmentData.PropPlacement[5], attachmentData.PropPlacement[6], true, true, false, true, 1, true)

    while SMOKING_DATA_STORE.currentlyVaping do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 47) then
            hitVape(itemData)
        elseif IsControlJustPressed(0, 74) then
            stopVaping()
            break
        end
    end
end

exports('usedVapeItem', function(itemData)
    startVaping(itemData)
end)

local p_smoke_location = {
	20279,
}

local p_smoke_particle = "exp_grd_bzgas_smoke"
local p_smoke_particle_asset = "core" 

RegisterNetEvent('crn_smoking:client:smokeSync', function(c_ped, size)
	for _, bones in pairs(p_smoke_location) do
        Wait(2000)
		if DoesEntityExist(NetToPed(c_ped)) and not IsEntityDead(NetToPed(c_ped)) then
			createdSmoke = UseParticleFxAssetNextCall(p_smoke_particle_asset)
			createdPart = StartNetworkedParticleFxLoopedOnEntityBone(p_smoke_particle, NetToPed(c_ped), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToPed(c_ped), bones), size, 0.0, 0.0, 0.0)
            Wait(4000)
			RemoveParticleFxFromEntity(NetToPed(c_ped))
            RemoveParticleFx(createdSmoke, 0)
			break
		end
	end
end)

RegisterNetEvent('crn_smoking:client:stopVaping', function()
    stopVaping()
end)

local function startVapeEffect()
    while SMOKING_DATA_STORE.buffActive do
        SetPedMoveRateOverride(PlayerPedId(), 1.03)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
        RestorePlayerStamina(PlayerId(), 100.0)
        Wait(0)
    end
end

local function runWeedBuff()
    local currentArmour = GetPedArmour(cache.ped)
    if ((currentArmour + 25) <= 100) then
        SetPedArmour(cache.ped, currentArmour + 25)
        randomEffect()
    else
        randomEffect()
    end
end

-- :)
local hasRandomEffect = false
function randomEffect()
    if hasRandomEffect then return end
    hasRandomEffect = true
    Citizen.CreateThread(function()
        SetTimecycleModifier("spectator5")
        SetPedMotionBlur(cache.ped, true)
        AnimpostfxPlay("DrugsMichaelAliensFight", 10000001, true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.9)

        Citizen.Wait(30000)

        SetPedMoveRateOverride(cache.ped, 1.0)
        SetPedMotionBlur(cache.ped, false)
        ResetPedMovementClipset(cache.ped)
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)
    end)
end

local function endVapeBuff()
    SMOKING_DATA_STORE.buffActive = false
    LocalPlayer.state.vapeBuffActive = false

    SetPedMoveRateOverride(PlayerPedId(), 0.8)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    RestorePlayerStamina(PlayerId(), 100.0)
end

RegisterNetEvent('crn_smoking:client:runWeedEffect', function()
    runWeedBuff()
end)

RegisterNetEvent('crn_smoking:client:startVapeBuff', function()
    SMOKING_DATA_STORE.buffActive = true
    LocalPlayer.state.vapeBuffActive = true
    startVapeEffect()
end)

RegisterNetEvent('crn_smoking:client:endVapeBuff', function()
    endVapeBuff()
end)

local PD_DONUT = false

local function startDonutEffect()
    while PD_DONUT do
        SetPedMoveRateOverride(PlayerPedId(), 1.03)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
        RestorePlayerStamina(PlayerId(), 100.0)
        Wait(0)
    end
end

AddEventHandler('ox_inventory:usedItem', function(name, slotId, metadata) 
    if name ~= 'pd_donut' and name ~= 'ems_narcandy' then return end
    if PD_DONUT then return end
    
    PD_DONUT = true
    Citizen.CreateThread(function()
        startDonutEffect()
    end)

    SetTimeout(120 * 60 * 1000, function()
        PD_DONUT = false
        Wait(1000)
        SetPedMoveRateOverride(PlayerPedId(), 0.8)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        RestorePlayerStamina(PlayerId(), 100.0)
    end)
end)
