-- ============================================================
--  Reusable dog-picker menu. Each activity (shots, paperwork,
--  breeding, selling, transfer) calls this with:
--    - menuId    : unique context id
--    - title     : menu title
--    - dogs      : list of dog rows from the server
--    - filterFn  : (dog) -> bool, whether the dog is selectable
--    - onPick    : (dog) -> nothing, called when player picks one
-- ============================================================

Kennels = Kennels or {}

local function describeDog(dog)
    local breed = Config.Breeds[dog.breed]
    local breedLabel = breed and breed.label or 'Unknown'
    return ('Breed: %s\nTimes Bred: %d\nShots: %s\nPaperwork: %s'):format(
        breedLabel,
        dog.breeding_count or 0,
        Kennels.IsTrue(dog.has_shots) and 'Yes' or 'No',
        Kennels.IsTrue(dog.has_paperwork) and 'Yes' or 'No'
    )
end

function Kennels.ShowDogPicker(menuId, title, dogs, filterFn, onPick)
    local options = {}

    if not dogs or #dogs == 0 then
        options[#options + 1] = {
            title       = 'No Dogs Registered',
            description = 'You do not have any dogs to use here.',
            disabled    = true
        }
    else
        for _, dog in ipairs(dogs) do
            local selectable = (not filterFn) or filterFn(dog)
            options[#options + 1] = {
                title       = dog.dog_name,
                description = describeDog(dog),
                disabled    = not selectable,
                onSelect    = function()
                    if selectable and onPick then onPick(dog) end
                end
            }
        end
    end

    options[#options + 1] = {
        title  = 'Close',
        icon   = 'fas fa-times',
        onSelect = function() lib.hideContext(menuId) end
    }

    lib.registerContext({
        id      = menuId,
        title   = title,
        options = options
    })
    lib.showContext(menuId)
end

function Kennels.Notify(msg, type)
    lib.notify({ description = msg, type = type or 'inform' })
end
