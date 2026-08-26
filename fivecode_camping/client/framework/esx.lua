CORE = nil

CreateThread(function()
    if Framework.type == 'esx' then
        CORE = exports[Framework.export]:getSharedObject()

        function GetPlayerInfo()
            return CORE.GetPlayerData()
        end

        function UpdatePlayerFoodStatus(type, value)
            -- type: hunger, thirst, alcohol
            TriggerEvent('esx_status:add', type, value)
            TriggerEvent('esx_status:add', type, value)
        end

        RegisterNetEvent('esx:onPlayerLogout', function()
            DeleteObjectUponLogout()
        end)
    end
end)