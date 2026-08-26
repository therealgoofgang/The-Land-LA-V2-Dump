ESX = exports["es_extended"]:getSharedObject()

local requiredPlaytime = Config.Time.Playtime

local __IsPedArmed = IsPedArmed
local __TriggerEvent = TriggerEvent

lib.onCache('weapon', function(weapon)
    local playerData = ESX.GetPlayerData()

    local time = LocalPlayer.state.playtimeWeaponCheck

    if weapon then
        for _, whitelistedWeapon in pairs(Config.WhitelistedWeapons) do
            if weapon == GetHashKey(whitelistedWeapon) then
                return
            end
        end
    end
    
    if not time or type(time) ~= "number" then
        time = 0
    end

    if __IsPedArmed(cache.ped, 4 | 2) then
        if playerData.job.name ~= 'police' and time < requiredPlaytime then

            __TriggerEvent('ox_inventory:disarm', 1, true)

            __TriggerEvent('ox_lib:notify', {
                title = 'Playtime',
                description = 'You do not have the required amount of hours to perform this action.',
                style = {
                    backgroundColor = '#0f172a',
                    color = '#f8fafc'
                },
                position = 'center-right',
                icon = 'flag',
                iconColor = '#14532d', 
                duration = 5000  
            })
        end
    end
end)