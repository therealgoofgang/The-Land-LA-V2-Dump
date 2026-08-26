RegisterNetEvent('crn_ui_svdden:client:caseOpened', function(items)
    nuiHandler(true, true, 'CASE', items)
end)

RegisterNUICallback('crn_ui_svdden:ui:spinComplete', function(_, cb)
    TriggerServerEvent('crn_ui_svdden:server:spinComplete')
    nuiHandler(false, false, 'CASE', {})
    cb('ok')
end)