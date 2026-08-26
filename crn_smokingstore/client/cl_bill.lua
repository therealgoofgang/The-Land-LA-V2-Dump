local function openBillingMenu()
    local input = lib.inputDialog('Dialog title', {
        {
            type = 'number',
            label = 'Player ID',
            description = 'Enter the Player ID to bill',
            icon = 'fas fa-user',
            value = 0
        }, 
        {
            type = 'number',
            label = 'Amount',
            description = 'Enter the amount to bill the player',
            icon = 'fas fa-dollar-sign',
            value = 0
        },
        {
            type = 'input',
            label = 'Reason',
            description = 'Enter the reason for the bill',
            icon = 'fas fa-comment',
            value = ''
        },
    })

    if not input then
        return
    end

    local playerID = input[1]
    local amount = input[2]
    local reason = input[3]

    if not playerID or not amount or not reason or playerID == 0 or amount == 0 or playerID == PlayerId() or amount <= 0 or reason == '' then
        Config.clientNotify('error', 'Invalid input')
        return
    end

    local job = ESX.GetPlayerData().job.name
    TriggerServerEvent('esx_billing:sendBill', playerID, 'society_'..job, reason, amount)
end

function initBillingLocation()
    for k, v in pairs(Config.billLocations) do
        local point = lib.points.new({
            coords = v,
            distance = 2.5,
        })
        
        function point:onEnter()
            lib.showTextUI('[E] - Bill')
        end
        
        function point:onExit()
            lib.hideTextUI()
        end
        
        function point:nearby()
            if self.currentDistance < 2.5 and IsControlJustReleased(0, 38) then
                openBillingMenu()
            end
        end
    end
end