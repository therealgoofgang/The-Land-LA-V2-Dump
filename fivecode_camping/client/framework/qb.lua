CORE = nil

CreateThread(function()
    if Framework.type == 'qbcore' then
        CORE = exports[Framework.export]:GetCoreObject()

        function GetPlayerInfo()
            return CORE.Functions.GetPlayerData()
        end

        function UpdatePlayerFoodStatus(type, value)
            -- type: hunger, thirst, alcohol
            if type == 'hunger' then
                TriggerServerEvent('consumables:server:addHunger', value)
            elseif type == 'thirst' then
                TriggerServerEvent('consumables:server:addThirst', value)
            elseif type == 'alcohol' then
                TriggerEvent('evidence:client:SetStatus', 'alcohol', value/100)
            end
        end

        RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
            DeleteObjectUponLogout()
        end)
    end
end)