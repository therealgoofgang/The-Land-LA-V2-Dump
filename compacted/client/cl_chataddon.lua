-- @desc Client-side /me handling
-- @author Elio
-- @version 3.0

local c = {
    language = 'en',
    color = { r = 230, g = 230, b = 230, a = 255 }, -- Text color
    font = 0, -- Text font
    time = 5000, -- Duration to display the text (in ms)
    scale = 0.5, -- Text scale
    dist = 10.0, -- Min. distance to draw 
}

local lang = {
    commandName = 'me',
    commandDescription = 'Display an action above your head.',
    commandSuggestion = {{ name = 'action', help = '"scratch his nose" for example.'}}
}

local peds = {}

-- Localization
local GetGameTimer = GetGameTimer

-- @desc Draw text in 3d
-- @param coords world coordinates to where you want to draw the text
-- @param text the text to display

local function draw3dText(coords, text, isMe)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    -- Format the text

    local meColor = { r = 230, g = 230, b = 230, a = 255 }
    local doColor = { r = 230, g = 255, b = 130, a = 255 }

    SetTextColour(isMe and meColor.r or doColor.r, isMe and meColor.g or doColor.g, isMe and meColor.b or doColor.b, isMe and meColor.a or doColor.a)
    SetTextScale(0.0, c.scale * scale)
    SetTextFont(c.font)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

-- @desc Display the text above the head of a ped
-- @param ped the target ped
-- @param text the text to display
local function displayText(ped, text, isMe)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local targetPos = GetEntityCoords(ped)
    local dist = #(playerPos - targetPos)
    local los = HasEntityClearLosToEntity(playerPed, ped, 17)

    if dist <= c.dist and los then
        local exists = peds[ped] ~= nil

        peds[ped] = {
            time = GetGameTimer() + c.time,
            text = text
        }

        if not exists then
            local display = true

            while display do
                Wait(0)
                local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 1.0)
                draw3dText(pos, peds[ped].text, isMe)
                display = GetGameTimer() <= peds[ped].time
            end

            peds[ped] = nil
        end

    end
end

-- @desc Trigger the display of teh text for a player
-- @param text text to display
-- @param target the target server id
local function onShareDisplay(text, target, isMe)
    local player = GetPlayerFromServerId(target)
    if player ~= -1 or target == GetPlayerServerId(PlayerId()) then
        local ped = GetPlayerPed(player)
        displayText(ped, text, isMe)
    end
end

-- Register the event
RegisterNetEvent('3dme:shareDisplay', function(text, target, isMe)
    onShareDisplay(text, target, isMe)
end)

-- Add the chat suggestion
TriggerEvent('chat:addSuggestion', '/' .. lang.commandName, lang.commandDescription, lang.commandSuggestion)


TriggerEvent('chat:addSuggestion', '/help', 'Send a message to all staff members', {
    { name="message", help="The message you want to send" }
})

TriggerEvent('chat:addSuggestion', '/report', 'Send a message to all staff members', {
    { name="message", help="The message you want to send" }
})

local MASK_VARIATION = {
    -- 1, -- Mask
}

local function tableContains(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

-- lib.callback.register('hasPlayerGotMaskOn', function()
--     -- if mask number is 1 or above and is not in the mask variation list, return true
--     print(GetPedDrawableVariation(PlayerPedId(), 1))
--     if GetPedDrawableVariation(PlayerPedId(), 1) >= 1 and not tableContains(MASK_VARIATION, GetPedDrawableVariation(PlayerPedId(), 1)) then
--         return true
--     end
--     return false
-- end)

CreateThread(function()
    local CONFIRM_MS = 3000
    local POLL_MS = 1000
    local committedMaskOn
    local pendingMaskOn
    local pendingSince = 0

    while true do
        Wait(POLL_MS)
        local variation = GetPedDrawableVariation(PlayerPedId(), 1)
        local isMaskOn = variation >= 1 and not tableContains(MASK_VARIATION, variation)

        if isMaskOn == committedMaskOn then
            pendingMaskOn = nil
        elseif isMaskOn ~= pendingMaskOn then
            pendingMaskOn = isMaskOn
            pendingSince = GetGameTimer()
        elseif GetGameTimer() - pendingSince >= CONFIRM_MS then
            committedMaskOn = isMaskOn
            pendingMaskOn = nil
            LocalPlayer.state:set('isMaskOn', isMaskOn, true)
        end
    end
end)

RegisterNetEvent('sendStaffchat')
AddEventHandler('sendStaffchat', function(id, gName, name, sName, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)

    ESX.TriggerServerCallback('esx_chatforadmin:GetGroup', function(Group)
        UserGroup = Group
        if pid == myId then
            TriggerEvent('chat:addMessage', {
                template = '<div style="color: #4da6ff; width: fit-content; max-width: 125%; word-break: break-word;">* Staff Chat [{0}] {1} ({2} - {3}): {4}</div>',
                args = { gName, name, id, sName, message }
            })
        elseif Group ~= "user" then
            TriggerEvent('chat:addMessage', {
                template = '<div style="color: #4da6ff; width: fit-content; max-width: 125%; word-break: break-word;">* Staff Chat [{0}] {1} ({2} - {3}): {4}</div>',
                args = { gName, name, id, sName, message }
            })
        end
    end)
end)