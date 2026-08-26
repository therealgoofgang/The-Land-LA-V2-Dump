RegisterNetEvent('crn_ui_svdden:client:femaleOpenStaterCarMenu', function()
    local result = lib.callback.await('crn_ui_svdden:server:validateFemaleOpenStaterVehicleMenu', false)
    if not result then
        lib.notify({
            title = 'Error',
            description = 'You cannot open this menu at the moment.',
            type = 'error',
            position = 'top'
        })
        return
    end
    
    local menuOptions = {}
    for index, vehicle in ipairs(Config.startingVehiclesFemale) do
        table.insert(menuOptions, {
            title = vehicle.label,
            image = 'nui://crn_images_svdden/images/vehicles/' .. vehicle.model .. '.png',
            description = 'Choose this vehicle',
            onSelect = function()
                local result = lib.callback.await('crn_ui_svdden:server:giveStartingVehicle', false, index)
            end
        })
    end

    lib.registerContext({
        id = 'female_vehicle_menu',
        title = 'Choose a Vehicle',
        options = menuOptions,
        canClose  = false,
    })
    
    lib.showContext('female_vehicle_menu')
end)