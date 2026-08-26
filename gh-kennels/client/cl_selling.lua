-- ============================================================
--  Sell a dog at the buyer NPC. Price comes from the server
--  (calculated based on breed, shots/paperwork, breed count).
-- ============================================================

RegisterNetEvent('kennels:client:openSelling', function()
    ESX.TriggerServerCallback('kennels:server:getMyDogs', function(dogs)
        Kennels.ShowDogPicker(
            'kennels_selling_menu',
            'Sell Dog (requires shots + paperwork)',
            dogs,
            function(dog)
                return dog.stage == 'adult'
                   and Kennels.IsTrue(dog.has_shots)
                   and Kennels.IsTrue(dog.has_paperwork)
            end,
            function(dog)
                lib.hideContext('kennels_selling_menu')
                local confirm = lib.alertDialog({
                    header  = 'Sell ' .. dog.dog_name .. '?',
                    content = 'This will remove the dog from your records.',
                    centered = true,
                    cancel  = true
                })
                if confirm == 'confirm' then
                    TriggerServerEvent('kennels:server:sellDog', dog.id)
                end
            end
        )
    end)
end)
