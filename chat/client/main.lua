local show3DText = false
local ownerPed = 0

local GENDER_COLORS = {
    ['male'] = { r = 52, g = 125, b = 253, a = 255 },
    ['female'] = { r = 251, g = 0, b = 255, a = 255 },
}

-- local function draw3dText(coords, text)
--     local camCoords = GetGameplayCamCoord()
--     local dist = #(coords - camCoords)
--     local scale = 200 / (GetGameplayCamFov() * dist)

--     local isFemale = LocalPlayer.state.isFemale or false
--     local color = isFemale and GENDER_COLORS.female or GENDER_COLORS.male

--     SetTextColour(color.r, color.g, color.b, color.a)
--     -- SetTextScale(0.0, Config.TextScale * scale)
--     -- SetTextFont(Config.TextFont)
--     SetTextDropshadow(0, 0, 0, 0, 55)
--     SetTextDropShadow()
--     SetTextCentre(true)
--     SetTextOutline()

--     BeginTextCommandDisplayText("STRING")
--     AddTextComponentSubstringPlayerName(text)
--     SetDrawOrigin(coords, 0)
--     EndTextCommandDisplayText(0.0, 0.0)
--     ClearDrawOrigin()
-- end

local function fetchPlayer()
    local p = promise.new()

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    local players = GetActivePlayers()
    local selectedPlayers = {}

    table.insert(selectedPlayers, GetPlayerServerId(PlayerId()))

    for _, player in ipairs(players) do
        if player ~= PlayerId() then
            table.insert(selectedPlayers, GetPlayerServerId(player))
        end
    end

    p:resolve(selectedPlayers)

	return Citizen.Await(p)
end