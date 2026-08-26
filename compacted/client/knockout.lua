local hits = 0
local knockout = false

AddEventHandler('gameEventTriggered', function(name, args)
    if name == "CEventNetworkEntityDamage" then
        if IsPedAPlayer(args[1]) and IsPedAPlayer(args[2]) then
            local victim = args[1]
            local attacker = args[2]
            local weaponHash = args[5]

            if victim == PlayerPedId() and IsEntityAMissionEntity(attacker) then
                if not (HasPedBeenDamagedByWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), 0) )then
                    return
                end

                hits = hits + 1
                if hits >= 13 and not knockout then
                    knockOut()
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        hits = 0
        Wait(10 * 60 * 1000)
    end
end)

function knockOut()
    hits = 0
    knockout = true
    local playerped = PlayerPedId()
    SetPlayerInvincible(playerped, false)
    DisablePlayerFiring(playerped, true)
    SetPedToRagdoll(playerped, 10000, 10000, 0, 0, 0, 0)
    ResetPedRagdollTimer(playerped)
    DoScreenFadeOut(1000)
    Wait(1000)
    -- Red Cam
    SetTimecycleModifier("REDMIST")
    ShakeGameplayCam("VIBRATE_SHAKE", 1.0)
    Wait(1000)
    DoScreenFadeIn(10000)
    Wait(11000)
    SetTimecycleModifier("")
    SetTransitionTimecycleModifier("")
    SetPlayerInvincible(playerped, false)

    knockout = false
end
