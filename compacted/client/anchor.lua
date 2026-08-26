-- /anchor — toggle the anchor on the boat you're currently in (boats only).
-- State lives on a replicated entity statebag ('boatAnchor') so every nearby
-- client applies the same anchor and the boat holds position for everyone.

local function applyAnchor(veh, on)
    if not DoesEntityExist(veh) then return end
    SetBoatAnchor(veh, on)
    -- keep it anchored even if the driver nudges the throttle
    if SetBoatRemainsAnchoredWhilePlayerIsDriver then
        SetBoatRemainsAnchoredWhilePlayerIsDriver(veh, on)
    end
end

-- Any client that has the boat streamed re-applies the anchor when it flips.
AddStateBagChangeHandler('boatAnchor', nil, function(bagName, _, value)
    local ent = GetEntityFromStateBagName(bagName)
    if ent and ent ~= 0 then
        applyAnchor(ent, value == true)
    end
end)

RegisterCommand('anchor', function()
    local ped = PlayerPedId()
    if LocalPlayer.state.dead or LocalPlayer.state.isCuffed then return end

    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then
        return lib.notify({ title = 'Anchor', description = "You're not in a boat.", type = 'error' })
    end
    if not IsThisModelABoat(GetEntityModel(veh)) then
        return lib.notify({ title = 'Anchor', description = 'Only boats can be anchored.', type = 'error' })
    end

    -- take control so we can flip the networked state on this entity
    NetworkRequestControlOfEntity(veh)
    local tries = 0
    while not NetworkHasControlOfEntity(veh) and tries < 20 do
        Wait(10)
        NetworkRequestControlOfEntity(veh)
        tries = tries + 1
    end

    local newState = not (Entity(veh).state.boatAnchor == true)
    Entity(veh).state:set('boatAnchor', newState, true)
    applyAnchor(veh, newState) -- immediate local feedback

    lib.notify({
        title = 'Anchor',
        description = newState and 'Anchor dropped — the boat is holding position.'
            or 'Anchor raised — the boat is free to move.',
        type = 'success',
        position = 'center-right',
    })
end, false)

TriggerEvent('chat:addSuggestion', '/anchor', 'Toggle the anchor on the boat you are in')
