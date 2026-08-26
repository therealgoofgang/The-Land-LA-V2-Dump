local trays = {
    `ex_prop_exec_ashtray_01`,
    `v_ind_cftray`,
    `xm3_prop_xm3_lab_tray_01b`,
    `prop_cs_silver_tray`
}

Citizen.CreateThread(function()
    exports.ox_target:addModel(trays, {
        {
            name = 'trays',
            icon = 'fa-solid fa-box',
            label = 'Open tray',
            distance = 2.0,
            onSelect = function(data)
                local coords = GetEntityCoords(data.entity)
                TriggerServerEvent('compacted:traySelected', coords)
            end
        }
    })
end)

RegisterNetEvent('compacted:openTray', function(stashId)
    exports.ox_inventory:openInventory('stash', stashId)
end)