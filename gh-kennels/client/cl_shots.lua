-- ============================================================
--  Vaccinate a dog. Player picks one of their unvaccinated
--  dogs from the menu; server charges them and updates DB.
-- ============================================================

RegisterNetEvent('kennels:client:openShots', function()
    ESX.TriggerServerCallback('kennels:server:getMyDogs', function(dogs)
        Kennels.ShowDogPicker(
            'kennels_shots_menu',
            'Vaccinate Dog ($' .. Config.Prices.shots .. ')',
            dogs,
            function(dog)
                return dog.stage == 'adult' and not Kennels.IsTrue(dog.has_shots)
            end,
            function(dog)
                lib.hideContext('kennels_shots_menu')
                TriggerServerEvent('kennels:server:vaccinate', dog.id)
            end
        )
    end)
end)
