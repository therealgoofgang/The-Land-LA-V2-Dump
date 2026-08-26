local cooldown = false
local scoreboardState = false

RegisterCommand('toggleScoreboard', function()
    if cooldown then return end
    cooldown = true
    SetTimeout(2000, function() cooldown = false end)
    
    scoreboardState = not scoreboardState
    local scoreboardData = lib.callback.await('crn_uilib:fetchScoreboard', false)

    SendNuiMessage(json.encode({
        action = 'scoreboardToggle',
        data = {
            police = scoreboardData.police,
            ems = scoreboardData.ems,
            players = scoreboardData.players,
            staff = scoreboardData.staff,
            visable = scoreboardState
        }
    }))
end)

RegisterKeyMapping('toggleScoreboard', 'Toggle Scoreboard', 'keyboard', 'F10')