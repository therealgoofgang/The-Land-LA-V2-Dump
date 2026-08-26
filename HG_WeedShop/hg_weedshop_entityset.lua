local EntitySets = {
    {
        name = "weedshop_plants",
        enabled = true,
        ipl = "hg_weedshop_garage_milo",
        coords = vector3(1122.15247, -986.9039, 46.6305656)
    }
}

-- #######################################################################
-- HOW TO TOGGLE ENTITY SETS ON OR OFF
--
-- This script controls the weed props entity set.
--
-- ▶ To toggle weed props ON or OFF:
--    Just change true or false for that set’s enabled flag, for example:
--
--    EntitySet.enabled = true   -- weedprops
--
-- ▶ After changing it, restart the script or the server to apply it.
--
-- That’s it!
-- #######################################################################

Citizen.CreateThread(function()
    for _, set in ipairs(EntitySets) do
        RequestIpl(set.ipl)
    end

    Citizen.Wait(500) -- small delay to make sure IPLs load

    for _, set in ipairs(EntitySets) do
        local interiorID = GetInteriorAtCoords(set.coords.x, set.coords.y, set.coords.z)

        if IsValidInterior(interiorID) then
            if set.enabled then
                ActivateInteriorEntitySet(interiorID, set.name)
            else
                DeactivateInteriorEntitySet(interiorID, set.name)
            end

            RefreshInterior(interiorID)
        else
            print("Invalid interior for IPL:", set.ipl, "EntitySet:", set.name)
        end
    end
end)
