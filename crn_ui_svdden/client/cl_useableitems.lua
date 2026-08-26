local isUsingItem = false
local scaleform = nil
local cacheData = {
    prop = nil
}
p_smoke_location = {
	20279,
}
p_smoke_particle = "exp_grd_bzgas_smoke"
p_smoke_particle_asset = "core" 

RegisterNetEvent('crn_ui_svdden:smokeItem', function(data)
    Citizen.CreateThread(function()
        isUsingItem = true

        lib.showTextUI('[G] Hit [H] Pass [Backspace] Put Out')

        local model = data.model
        lib.requestModel(model, 5000)

        cacheData.prop = CreateObject(GetHashKey(data.model), GetEntityCoords(cache.ped), true, true, true)
        AttachEntityToEntity(cacheData.prop, cache.ped, GetPedBoneIndex(cache.ped, 57005), 0.14, 0.02, -0.05, 0.0, -71.0, -6.0, true, true, false, false, 1, true)
        
        Citizen.CreateThread(function()
            while isUsingItem do
                if data.useDuration <= 0 then
                    keyPressAction(data.animationData, 'cancel')
                    isUsingItem = false
                    break
                end

                data.useDuration = data.useDuration - 1

                SendNUIMessage({
                    action = "drugsSmoke:data",
                    data = {
                        shouldShow = true,
                        newTime = data.useDuration
                    }
                })
                Citizen.Wait(1000)
            end
        end)

        while isUsingItem do
            if IsControlJustPressed(0, 47) then
                keyPressAction(data.animationData, 'hit', data)
            elseif IsControlJustPressed(0, 74) then
                keyPressAction(data.animationData, 'pass', data)
            elseif IsControlJustPressed(0, 177) then
                keyPressAction(data.animationData, 'cancel')
                isUsingItem = false
            end

            Citizen.Wait(0)
        end
    end)
end)

local function appleBuff(buffData)
    if not buffData then return end

    if buffData[1] == 'armour' then
        local playerArmour = GetPedArmour(cache.ped)
        local newArmour = playerArmour + buffData[2]
        if newArmour > buffData[3] then
            newArmour = buffData[3]
        end
        if newArmour > GetPedArmour(cache.ped) then
            SetPedArmour(cache.ped, newArmour)
        end
    elseif buffData[1] == 'health' then
        local playerHealth = GetEntityHealth(cache.ped)
        local newHealth = playerHealth + buffData[2]
        if newHealth > buffData[3] then
            newHealth = buffData[3]
        end
        newHealth = newHealth + 100
        if newHealth > GetEntityHealth(cache.ped) then
            SetEntityHealth(cache.ped, newHealth)
        end
    elseif buffData[1] == 'icecream' then
        local playerHealth = GetEntityHealth(cache.ped)
        local newHealth = playerHealth + buffData[2]

        if newHealth > buffData[3] then
            newHealth = buffData[3]
        end

        if newHealth > GetEntityHealth(cache.ped) then
            SetEntityHealth(cache.ped, newHealth)
        end
    end
end

RegisterNetEvent('crn_ui_svdden:useableitems', function(index)
    local data = Config.useableitems[index]
    if not data then return end

    if data.type == 'craft' then
        local options = {}
    
        for k, v in pairs(data.options) do
            local hasAllItems = false
            for k2, v2 in pairs(v.requiredItems) do
                if ox_inventory:GetItemCount(v2.item) >= v2.count then
                    hasAllItems = true
                else
                    hasAllItems = false
                    break
                end
            end
    
            if hasAllItems then
                table.insert(options, {
                    title = v.label,
                    description = 'You need ' .. v.requiredItems[1].count .. 'x ' .. v.requiredItems[1].label,
                    icon = 'fas fa-cogs',
                    image = 'https://cdn2.nullnetwork.ca/2adc0505f31cd560/inventory/' .. v.item .. '.png',
                    onSelect = function()
                        TaskStartScenarioInPlace(cache.ped, 'PROP_HUMAN_PARKING_METER', 0, true)
    
                        if lib.progressBar({
                            duration = 5000,
                            label = 'Crafting ' .. v.label,
                            useWhileDead = false,
                            canCancel = false,
                        }) then 
                            local result = lib.callback.await('crn_ui_svdden:useableitems:craft', false, index, k)
                            ClearPedTasks(cache.ped)
                            lib.notify({ title = 'Success', description = 'You have crafted ' .. v.label, type = 'success', duration = 7500 })
                        else 
                            lib.notify({ title = 'Error', description = 'Crafting was cancelled', type = 'error', duration = 7500 })
                            ClearPedTasks(cache.ped)
                        end
                    end
                })
            end
        end
    
        lib.registerContext({
            id = 'useableitems_craft',
            title = data.label,
            menu = data.label,
            options = options
        })
         
        lib.showContext('useableitems_craft')
    elseif data.type == 'use' then
        if isUsingItem then  return lib.notify({ title = 'Error', description = 'You are already using something', type = 'error', duration = 7500 })  end

        if data.action == 'smoke' then
            TriggerEvent('crn_ui_svdden:smokeItem', data)
        elseif data.action == 'crack' then
            isUsingItem = true
            lib.requestAnimDict("amb@world_human_bum_freeway@male@base", 5000)
            TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)

            Citizen.CreateThread(function()
                while isUsingItem and data.action == 'crack' do
                    if not IsEntityPlayingAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 3) then
                        TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)
                    end
                    Citizen.Wait(0)
                end
            end)

            Citizen.Wait(data.useDuration * 1000)
            ClearPedTasks(cache.ped)
            RemoveAnimDict("amb@world_human_bum_freeway@male@base")
            lib.notify({ description = 'You have took some crack', type = 'success', duration = 7500 })
            -- appleBuff(data.buff)
            crackEffect()
            isUsingItem = false
        elseif data.action == 'fent' then
            isUsingItem = true
            lib.requestAnimDict("amb@world_human_bum_freeway@male@base", 5000)
            TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)

            Citizen.CreateThread(function()
                while isUsingItem and data.action == 'fent' do
                    if not IsEntityPlayingAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 3) then
                        TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)
                    end
                    Citizen.Wait(0)
                end
            end)

            Citizen.Wait(data.useDuration * 1000)
            ClearPedTasks(cache.ped)
            RemoveAnimDict("amb@world_human_bum_freeway@male@base")
            lib.notify({ description = 'You have took some fent', type = 'success', duration = 7500 })
            -- appleBuff(data.buff)
            crackEffect()
            isUsingItem = false
        elseif data.action == 'pink' then
            isUsingItem = true
            lib.requestAnimDict("amb@world_human_bum_freeway@male@base", 5000)
            TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)

            Citizen.CreateThread(function()
                while isUsingItem and data.action == 'fent' do
                    if not IsEntityPlayingAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 3) then
                        TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)
                    end
                    Citizen.Wait(0)
                end
            end)

            Citizen.Wait(data.useDuration * 1000)
            ClearPedTasks(cache.ped)
            RemoveAnimDict("amb@world_human_bum_freeway@male@base")
            lib.notify({ description = 'You have took some Pink Coke', type = 'success', duration = 7500 })
            -- appleBuff(data.buff)
            pinkEffect()
            isUsingItem = false
        elseif data.action == 'coke' then
            isUsingItem = true
            lib.requestAnimDict("amb@world_human_bum_freeway@male@base", 5000)
            TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)

            Citizen.CreateThread(function()
                while isUsingItem and data.action == 'coke' do
                    if not IsEntityPlayingAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 3) then
                        TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)
                    end
                    Citizen.Wait(0)
                end
            end)

            Citizen.Wait(data.useDuration * 1000)
            ClearPedTasks(cache.ped)
            RemoveAnimDict("amb@world_human_bum_freeway@male@base")
            lib.notify({ description = 'You have took some Coke', type = 'success', duration = 7500 })
            appleBuff(data.buff)
            pinkEffect()
            isUsingItem = false
        elseif data.action == 'lean' then
            isUsingItem = true
            -- lib.requestAnimDict("amb@world_human_bum_freeway@male@base", 5000)
            -- TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)
            ExecuteCommand('e coffee')

            Citizen.CreateThread(function()
                while isUsingItem and data.action == 'lean' do
                    if not IsEntityPlayingAnim(cache.ped, "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 3) then
                        TaskPlayAnim(cache.ped, "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 8.0, 8.0, -1, 49, 0, false, false, false)
                    end
                    Citizen.Wait(0)
                end
            end)

            Citizen.Wait(data.useDuration * 1000)
            ClearPedTasks(cache.ped)
            RemoveAnimDict("amb@world_human_drinking@coffee@male@idle_a")
            ExecuteCommand('emotecancel')
            lib.notify({ description = 'You have took some lean', type = 'success', duration = 7500 })
            appleBuff(data.buff)
            crackEffect()
            isUsingItem = false
        elseif data.action == 'drug_drnumb' then
            appleBuff(data.buff)
        elseif data.action == 'icecream' then
            print("ICE CREAM")
            isUsingItem = true

            Citizen.CreateThread(function()
                while isUsingItem and data.action == 'icecream' do
                    if not IsEntityPlayingAnim(cache.ped, "mp_player_inteat@burger", "mp_player_int_eat_burger", 3) then
                        TaskPlayAnim(cache.ped, "mp_player_inteat@burger", "mp_player_int_eat_burger", 8.0, 8.0, -1, 49, 0, false, false, false)
                    end
                    Citizen.Wait(0)
                end
            end)

            Citizen.Wait(data.useDuration * 1000)
            ClearPedTasks(cache.ped)
            appleBuff(data.buff)
            isUsingItem = false
        else
            appleBuff(data.buff)
            -- CreateThread(function()
            --     randomEffect()
            -- end)
        end
    end
end)

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

local hasCrackEffect = false
function crackEffect()
    if hasCrackEffect then return end
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

local hasPinkEffect = false
function pinkEffect()
    -- if hasPinkEffect then return end
    hasPinkEffect = true
    Citizen.CreateThread(function()
        SetTimecycleModifier("spectator5")
        SetPedMotionBlur(cache.ped, true)
        AnimpostfxPlay("DrugsMichaelAliensFight", 10000001, true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.9)

        SetPedMoveRateOverride(PlayerId(),10.0)
        SetRunSprintMultiplierForPlayer(PlayerId(),1.49)

        local endTime = GetGameTimer() + 30000
        while hasPinkEffect and GetGameTimer() < endTime do
            SetPlayerStamina(PlayerId(), 100.0)
            Citizen.Wait(500)
        end
  
        SetPedMoveRateOverride(cache.ped, 1.0)
        SetPedMotionBlur(cache.ped, false)
        ResetPedMovementClipset(cache.ped)
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)

        SetPedMoveRateOverride(PlayerId(),1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(), 0.0)
        hasPinkEffect = false
    end)
end

local hasWeedEffect = false

local function smokeEffect()
    if hasWeedEffect then return end
    Citizen.CreateThread(function()
        hasWeedEffect = true
        SetTimecycleModifier("spectator3")
        SetPedMotionBlur(cache.ped, true)
        AnimpostfxPlay("ChopVision", 1000, true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.2)
  
        Citizen.Wait(30000)
  
        SetPedMoveRateOverride(cache.ped, 1.0)
        SetPedMotionBlur(cache.ped, false)
        ResetPedMovementClipset(cache.ped)
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)
        hasWeedEffect = false
    end)
end

function keyPressAction(animationData, action, data)
    if action == 'hit' then
        lib.requestAnimDict(animationData[1], 5000)

        TaskPlayAnim(cache.ped, animationData[1], animationData[2], 8.0, 8.0, -1, 49, 0, false, false, false)
        TriggerServerEvent('crn_ui_svdden:useableitems:smokeSync', PedToNet(cache.ped), 0.3)
        Citizen.Wait(5600)

        appleBuff(data.buff)
    
        smokeEffect()
        ClearPedTasks(cache.ped)
        RemoveAnimDict(animationData[1])
    elseif action == 'pass' then
        local coords = GetEntityCoords(cache.ped)
        local closestPlayer = lib.getClosestPlayer(coords, 3.0, false)
        if not closestPlayer then return lib.notify({ description = 'No players nearby', type = 'error', duration = 7500 }) end

        lib.hideTextUI()
        isUsingItem = false
        SendNUIMessage({
            action = "drugsSmoke:data",
            data = {
                shouldShow = false,
                newTime = 0
            }
        })

        local targetPed = GetPlayerPed(closestPlayer)
        TaskTurnPedToFaceEntity(cache.ped, targetPed, 1000)
        Citizen.Wait(1000)

        lib.requestAnimDict("mp_common", 5000)
        TaskPlayAnim(cache.ped, "mp_common", "givetake1_a", 8.0, 8.0, -1, 49, 0, false, false, false)
        Citizen.Wait(1000)

        DeleteEntity(cacheData.prop)
        TriggerServerEvent('crn_ui_svdden:useableitems:syncPass', GetPlayerServerId(closestPlayer), data)
        lib.notify({ title = 'Success', description = 'You have passed the smoke', type = 'success', duration = 7500 })

        ClearPedTasks(cache.ped)
        RemoveAnimDict("mp_common")
    elseif action == 'cancel' then
        lib.hideTextUI()
        isUsingItem = false
        SendNUIMessage({
            action = "drugsSmoke:data",
            data = {
                shouldShow = false,
                newTime = 0
            }
        })

        DeleteEntity(cacheData.prop)
        lib.requestAnimDict("amb@world_human_bum_freeway@male@base", 5000)
        TaskPlayAnim(cache.ped, "amb@world_human_bum_freeway@male@base", "base", 8.0, 8.0, -1, 49, 0, false, false, false)
        Citizen.Wait(1000)
        ClearPedTasks(cache.ped)
        RemoveAnimDict("amb@world_human_bum_freeway@male@base")
        lib.notify({ description = 'You have put out the smoke', type = 'error', duration = 7500 })
    end
end

RegisterNetEvent('crn_ui_svdden:useableitems:smokeSync', function(c_ped, size)
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

RegisterNetEvent('crn_ui_svdden:useableitems:syncPass', function(data)
    local coords = GetEntityCoords(cache.ped)
    local closestPlayer = lib.getClosestPlayer(coords, 3.0, false)
    if closestPlayer then
        local targetPed = GetPlayerPed(closestPlayer)
        TaskTurnPedToFaceEntity(cache.ped, targetPed, 700)
        Citizen.Wait(1000)
    end

    TriggerEvent('crn_ui_svdden:smokeItem', data)
end)