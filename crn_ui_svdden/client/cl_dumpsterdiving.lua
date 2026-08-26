local diving = false
local onCooldown = false
local alreadySearchedBins = {}

local function LoadAnimDict(dict)
    lib.requestAnimDict(dict, 2000)
end

RegisterNetEvent('dumpsterdive:goDiving', function(entity)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
	local items_found = false
    if not diving then
        diving = true
        alreadySearchedBins[#alreadySearchedBins+1] = entity
        if lib.progressBar({
            duration = Config.dumpsterDiving.SearchDuration * 1000,
            label = 'Searching Bin',
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
                sprint = true,
            },
            anim = {
                dict = 'amb@prop_human_bum_bin@idle_b',
                clip = 'idle_d',
            },
        }) then
            diving = false
            local luck = math.random(1, 20)
            if luck >= 8 then
                if not onCooldown then
                    TriggerServerEvent('dumpsterdive:rewards', luck)
                    onCooldown = true
                    items_found = true
                end
            end
        else 
            diving = false
        end
	end
    if not items_found then
        lib.notify({ type = 'error', description = 'You found nothing of value.' })
    end
    SetTimeout(Config.dumpsterDiving.SearchCooldown * 1000, function()
        local entityIndex = 0
        for i=1, #alreadySearchedBins do
            if alreadySearchedBins[i] == entity then
                entityIndex = i
                break
            end
        end

        if entityIndex ~= 0 then
            table.remove(alreadySearchedBins, entityIndex)
        end
    end)
    Wait(Config.dumpsterDiving.Cooldown * 1000)
    onCooldown = false
end)

function initDumpsterDiving()
    local dumpsterdive = {
        {
            name = 'ox_target:diveIn',
            icon = 'fa-solid fa-dumpster',
            label = "Search Bin",
            event = 'dumpsterdive:goDiving',
            canInteract = function(entity, distance, coords)
                local targetCoords = GetEntityCoords(entity)
                local playerCoords = GetEntityCoords(PlayerPedId())
                if targetCoords.z < playerCoords.z and not diving and not onCooldown and not alreadySearchedBins[entity] then
                    return true
                end
                return false
            end,
        }
    }

    exports.ox_target:addModel(Config.dumpsterDiving.binModels, dumpsterdive)
end