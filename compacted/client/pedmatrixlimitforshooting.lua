local function vec3Length(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
end

lib.onCache('weapon', function(currentWeaponHash)
    if currentWeaponHash then 
        local ped = PlayerPedId()
        while GetSelectedPedWeapon(ped) == currentWeaponHash do
            local ped = PlayerPedId()
            local right, forward, up, position = GetEntityMatrix(PlayerPedId())

            local scaleZ = vec3Length(up)

            local matrixLimitMin = 0.97
            local matrixLimitMax = 1.05

            if scaleZ < matrixLimitMin or scaleZ > matrixLimitMax then
                TriggerEvent('ox_inventory:disarm', true)
                lib.notify({
                    title = 'Disarmed',
                    description = string.format('You cannot hold a weapon while your scale is outside the allowed range (min: %.2f, max: %.2f).', matrixLimitMin, matrixLimitMax),
                    type = 'error',
                    position = 'top',
                    duration = 7500
                })
            end
            Wait(1000)
        end
    end
end)