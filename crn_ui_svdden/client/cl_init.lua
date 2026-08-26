CreateThread(function()
    initDealerships()
    initIdentityPed()
    initDumpsterDiving()
    -- initBlackmarket()
end)


RegisterNetEvent('crn_ui_svdden:client:hideLogo', function(duration)
    SendNUIMessage({ action = 'hideLogo', data = { duration = duration or 7500 } })
end)