local interiors = {
    {
        ipl = 'bigoz_weedshop_mlo', -- PuffPuffPass
        coords = { x = -1550.28833, y = -435.933929, z = 36.5742378 },
        entitySets = {
            { name = 'xmas', enable = false },          -- XMAS DECORATIONS
        },
    },
    {
        ipl = 'bigoz_tunershop_mlo', -- BayShore
        coords = { x = -604.081238, y = -1761.4502, z = 31.260376 },
        entitySets = {
            { name = 'paintingroomdoors', enable = true },
            { name = 'carlifts', enable = true },
            { name = 'basketballdec', enable = true },
            { name = 'xmas', enable = false },          -- XMAS DECORATIONS
        }
    },
    {
        ipl = 'bigoz_rooftop_mlo', -- Rooftop
        coords = { x = -844.434, y = -247.04, z = 63.072 },
        entitySets = {
            { name = 'elevatoroff', enable = true },
            { name = 'xmas', enable = false },          -- XMAS DECORATIONS
        },
    },
    {
        ipl = 'bigoz_bikeshop_mlo', -- BikeShop
        coords = { x = -1350.73, y = -1434.65, z = 5.998015 },
        entitySets = {
            { name = 'xmas', enable = false },          -- XMAS DECORATIONS
        },
    }
}    

CreateThread(function()
    for _, interior in ipairs(interiors) do
        if not interior.ipl or not interior.coords or not interior.entitySets then
            print('^2[BigoZ]^7 Error while loading BigoZ Interiors.')
            return
        end
        RequestIpl(interior.ipl)
        local interiorID = GetInteriorAtCoords(interior.coords.x, interior.coords.y, interior.coords.z)
        if IsValidInterior(interiorID) then
            for __, entitySet in ipairs(interior.entitySets) do
                if entitySet.enable then
                    EnableInteriorProp(interiorID, entitySet.name)
                    if entitySet.color then
                        SetInteriorPropColor(interiorID, entitySet.name, entitySet.color)
                    end
                else
                    DisableInteriorProp(interiorID, entitySet.name)
                end
            end
            RefreshInterior(interiorID)
        end
    end
    print("^2[BigoZ]^7 BigoZ Interiors data loaded.")
end)