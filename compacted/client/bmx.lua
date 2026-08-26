local lastUsed = 0
local cooldown = 300

RegisterCommand("bmx", function()
    local now = GetGameTimer()

    if LocalPlayer.state.dead or LocalPlayer.state.isCuffed then
        return
    end

    if now - lastUsed < cooldown * 1000 and lastUsed ~= 0 then
        local remaining = math.ceil((cooldown * 1000 - (now - lastUsed)) / 1000)
        lib.notify({
            title = 'Cooldown',
            description = 'You are on a cooldown of ' .. remaining .. ' seconds before using /bmx again!',
            type = 'error',
        })
        return
    end

    lastUsed = now

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    RequestModel('bmx')
    while not HasModelLoaded('bmx') do
        Wait(0)
    end

    local bike = CreateVehicle('bmx', coords.x, coords.y, coords.z, heading, true, false)
    SetVehicleOnGroundProperly(bike)
    SetPedIntoVehicle(playerPed, bike, -1)
    SetModelAsNoLongerNeeded('bmx')

    lib.notify({
        title = 'BMX Spawned',
        description = 'You have spawned a bmx bike!',
        type = 'success',
        position = 'center-right',
    })
end, false)
