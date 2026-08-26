if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    ESX.PlayerLoaded = true
    OnPlayerLoaded()
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    ESX.PlayerLoaded = false
    OnPlayerUnload()
end)

function hasPlyLoaded()
    return ESX.PlayerLoaded
end

function DoNotification(text, nType)
    ESX.ShowNotification(text, nType)
end

function ShowTextUI(text, opts)
    lib.showTextUI(text, opts)
end

function HideTextUI()
    lib.hideTextUI()
end

function GetPlayerMoney()
    local xPlayer = ESX.GetPlayerData()
    return xPlayer and xPlayer.money or 0
end

function GetPlayerBankMoney()
    local xPlayer = ESX.GetPlayerData()
    if xPlayer and xPlayer.accounts then
        for _, account in ipairs(xPlayer.accounts) do
            if account.name == "bank" then
                return account.money or 0
            end
        end
    end
    return 0
end

function ProgressCircle(options)
    return lib.progressCircle(options)
end