-- Several add-on vehicles in tlla_donor_v2 have their bodywork split off into
-- vehicle "mods" (see each model's carcols.meta). Their carvariations declare no
-- default mod loadout, so on a raw spawn those slots sit at -1 and the parts are
-- missing/invisible. We apply the body mods here; because the change replicates
-- through OneSync, only the client holding entity control has to do it, and a
-- "is it already applied?" check stops every other client once it has.
--
-- We handle both new spawns (entityCreated) and vehicles that already exist when
-- this resource (re)starts (a sweep of the vehicle pool).
--
-- modType/modIndex come from each carcols.meta <visibleMods> block, verified in
-- game with /kitinfo. Decorative shared template parts (calavasawei_/gweldsnake_
-- animated fans & LED tails) are left off on purpose.
--
--   slot 3 = VMT_SKIRT   5 = VMT_CHASSIS   6 = VMT_GRILL   9 = VMT_WING_R
--   10 = VMT_ROOF   32 = VMT_SEATS   42-45 = VMT_CHASSIS2..5

-- model name -> { {modType, modIndex}, ... }. Empty list = no mod-based bodywork
-- (nothing this script can restore; any invisibility there is a stream/ytd issue).
local FIXES = {
    clappedcaston  = { { 45, 0 }, { 44, 0 } },                                        -- Clappedcaston_a / _b (body halves)
    kg1smg         = { { 42, 0 } },                                                   -- kg1smg_parts
    raptor700r     = { { 5, 0 }, { 3, 0 }, { 9, 0 }, { 6, 0 }, { 10, 0 }, { 32, 0 } }, -- bodyshell, block, widebody, wire grille, roof_1, starlight seats
    swueypreraptor = { { 3, 0 }, { 6, 0 } },                                          -- seats, grill
    dillkx250f     = {},                                                              -- no carcols
    excf250        = {},                                                              -- empty <visibleMods>
    placox3        = {},                                                              -- no carcols
}

-- hash -> mods list, so the per-entity check is a single table read
local targets = {}
for name, mods in pairs(FIXES) do
    targets[GetHashKey(name)] = mods
end

local function isApplied(veh, mods)
    for _, m in ipairs(mods) do
        if GetVehicleMod(veh, m[1]) ~= m[2] then return false end
    end
    return true
end

-- Take control (SetVehicleMod only sticks + replicates from the controller),
-- then set the kit and apply the mods. Returns whether we actually had control.
local function applyMods(veh, mods)
    NetworkRequestControlOfEntity(veh)
    local tries = 0
    while not NetworkHasControlOfEntity(veh) and tries < 20 do
        NetworkRequestControlOfEntity(veh)
        Wait(50)
        tries = tries + 1
    end
    if not NetworkHasControlOfEntity(veh) then return false end

    SetVehicleModKit(veh, 0) -- 0 = the vehicle's own kit; required before SetVehicleMod
    for _, m in ipairs(mods) do
        SetVehicleMod(veh, m[1], m[2], false)
    end
    return true
end

local function ensureMods(veh, mods)
    if #mods == 0 then return end -- nothing mod-based to restore

    local deadline = GetGameTimer() + 8000
    while DoesEntityExist(veh) do
        if isApplied(veh, mods) then return end -- already done (by us or another client)
        applyMods(veh, mods)
        if GetGameTimer() > deadline then return end
        Wait(500)
    end
end

local function fixIfTarget(veh)
    local mods = targets[GetEntityModel(veh)]
    if mods then
        CreateThread(function() ensureMods(veh, mods) end)
    end
end

-- New spawns: fires on every client that streams the entity in.
AddEventHandler('entityCreated', function(entity)
    if IsEntityAVehicle(entity) then fixIfTarget(entity) end
end)

-- Vehicles that already exist when this resource (re)starts.
CreateThread(function()
    for _, veh in ipairs(GetGamePool('CVehicle')) do
        fixIfTarget(veh)
    end
end)

-- ---- debug helpers -------------------------------------------------------
-- /kitinfo : dump the mod slots the game exposes for the vehicle you're in.
RegisterCommand('kitinfo', function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh == 0 then return print('[modkits] you are not in a vehicle') end
    SetVehicleModKit(veh, 0)
    print(('[modkits] model hash %d -- slots with parts:'):format(GetEntityModel(veh)))
    for t = 0, 49 do
        local n = GetNumVehicleMods(veh, t)
        if n > 0 then
            print(('  slot %d : %d option(s), current = %d'):format(t, n, GetVehicleMod(veh, t)))
        end
    end
end, false)

-- /fixmykit : force the configured mods onto the vehicle you're in and report
--             whether control was obtained + the resulting slot values.
RegisterCommand('fixmykit', function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh == 0 then return print('[modkits] you are not in a vehicle') end
    local mods = targets[GetEntityModel(veh)]
    if not mods then return print('[modkits] this model is not in the fix list') end

    applyMods(veh, mods)

    local after = {}
    for _, m in ipairs(mods) do after[#after + 1] = ('%d=%d'):format(m[1], GetVehicleMod(veh, m[1])) end
    print(('[modkits] control=%s | slots after apply: %s'):format(
        tostring(NetworkHasControlOfEntity(veh)), table.concat(after, ' ')))
end, false)
