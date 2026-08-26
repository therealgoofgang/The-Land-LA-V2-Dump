-- ============================================================
--  File paperwork for a dog. Player picks an unpapered dog,
--  server charges them and flags has_paperwork = 1.
-- ============================================================

RegisterNetEvent('kennels:client:openPaperwork', function()
    ESX.TriggerServerCallback('kennels:server:getMyDogs', function(dogs)
        Kennels.ShowDogPicker(
            'kennels_paperwork_menu',
            'File Paperwork ($' .. Config.Prices.paperwork .. ')',
            dogs,
            function(dog)
                return dog.stage == 'adult' and not Kennels.IsTrue(dog.has_paperwork)
            end,
            function(dog)
                lib.hideContext('kennels_paperwork_menu')
                TriggerServerEvent('kennels:server:filePaperwork', dog.id)
            end
        )
    end)
end)
