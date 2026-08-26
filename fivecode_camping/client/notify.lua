RegisterNetEvent(TriggerName('notify'))
AddEventHandler(TriggerName('notify'), function(title, txt, type)
    if Notify == 'ox' then
        lib.notify({
            title = title,
            description = txt,
            duration = 6500,
            type = type,
        })
    elseif Notify == 'esx' then
        TriggerEvent('esx:showNotification', txt, type, 6500)
    elseif Notify == 'qb' then
        CORE.Functions.Notify(txt, type, 6500)
    end
    -- Sound for notifications.
    if Config.Sounds then
        TriggerEvent(TriggerName('playSound'), type)
    end
end)

function ShowHelpNotification(txt)
    if HelpNotify == 'ox' or ActionMenu == 'helpox' then
        lib.showTextUI(txt)
    elseif HelpNotify == 'esx' or ActionMenu == 'helpesx' then
        CORE.ShowHelpNotification(txt)
    elseif HelpNotify == 'qb' or ActionMenu == 'helpqb' then
        exports['qb-core']:DrawText(txt, 'right')
    end
end

function StopHelpNotification()
    if HelpNotify == 'ox' or ActionMenu == 'helpox' then
        lib.hideTextUI()
    elseif HelpNotify == 'esx' or ActionMenu == 'helpesx' then
        --
    elseif HelpNotify == 'qb' or ActionMenu == 'helpqb' then
        exports['qb-core']:HideText()
    end
end