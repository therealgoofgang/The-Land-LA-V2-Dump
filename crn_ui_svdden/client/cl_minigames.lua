local awaitinMiniGameResponse = false

local function startMiniGame(tier, data, cb)
    awaitinMiniGameResponse = true
    nuiHandler(true, true, 'TIER1MINIGAME', data)

    while awaitinMiniGameResponse ~= 'success' and awaitinMiniGameResponse ~= 'failed' and awaitinMiniGameResponse do
        Wait(500)
    end

    return cb(awaitinMiniGameResponse == 'success', data)
end

exports('startMiniGame', startMiniGame)

RegisterNuiCallback('closeMinigame', function(data, cb)
    awaitinMiniGameResponse = 'failed'
    nuiHandler(false, false, 'TIER1MINIGAME', data)
    cb('')
end)

RegisterNuiCallback('minigameSuccess', function(data, cb)
    awaitinMiniGameResponse = 'success'
    nuiHandler(false, false, 'TIER1MINIGAME', data)
    cb('')
end)

if Config.debug then
    ----- testing useage
    RegisterCommand('minigameStart', function()
        local tier = 1
        local data = {
            label = 'Safe Cracking',
            amountToSelect = 6,
            maxAmountToFail = 3,
            timeToComplete = 7000,
            shuffleTime = 1000
        }

        startMiniGame(tier, data, function(success, data)
            if success then
                print('Success')
            else
                print('Failed')
            end
        end)
    end)
end