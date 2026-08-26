if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    OnPlayerLoaded()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    OnPlayerUnload()
end)

function hasPlyLoaded()
    return LocalPlayer.state.isLoggedIn
end

function DoNotification(text, nType)
    QBCore.Functions.Notify(text, nType)
end

function ShowTextUI(text, opts)
    lib.showTextUI(text, opts)
end

function HideTextUI()
    lib.hideTextUI()
end

function GetPlayerMoney()
    local PlayerData = QBCore.Functions.GetPlayerData()
    return PlayerData.money and PlayerData.money.cash or 0
end

function GetPlayerBankMoney()
    local PlayerData = QBCore.Functions.GetPlayerData()
    return PlayerData.money and PlayerData.money.bank or 0
end

function ProgressCircle(options)
    return lib.progressCircle(options)
end