CreateThread(function()
    while true do
        SetDiscordAppId(Config.discordApplicaitonId)
        SetRichPresence(string.format('Players: %d/%d\ndiscord.gg/tlla', GlobalState.activityStatusData.totalConnectedUsers or 1, GlobalState.activityStatusData.maxUsers or 0))
        SetDiscordRichPresenceAsset('maingfx')
        SetDiscordRichPresenceAction(0, 'Connect', 'fivem://connect/')
        SetDiscordRichPresenceAction(1, 'Discord', 'https://discord.gg/tlla')
        Wait(10000)
    end
end)