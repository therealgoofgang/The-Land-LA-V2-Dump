-- ===============================================================
-- CASINO WHEEL — DUI FACE EDITOR
-- Live-tune where each wheel's DUI face sits on its prop.
-- Opened server-side (ACE gated) via /wheeleditor.
-- ===============================================================

local API = nil
local active     = false
local wheelId    = nil
local fieldIndex = 1
local holdTimer  = 0
local holdDir    = 0

local FIELDS = Config.OffsetFields

-- Controls (disabled while the editor is open)
local CTRL = {
    up     = 172,  -- Arrow Up
    down   = 173,  -- Arrow Down
    left   = 174,  -- Arrow Left
    right  = 175,  -- Arrow Right
    fine   = 21,   -- Left Shift  (x0.1)
    coarse = 19,   -- Left Alt    (x10)
    save   = 191,  -- Enter
    cancel = 194,  -- Backspace
    swap   = 47,   -- G — cycle to another wheel
    reset  = 73,   -- X — reset field to its config value
}

-- ---------------------------------------------------------------
-- UI
-- ---------------------------------------------------------------
local function Text(x, y, scale, str, r, g, b, a, centre)
    SetTextFont(4)
    SetTextScale(scale, scale)
    SetTextColour(r or 255, g or 255, b or 255, a or 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre or false)
    SetTextEntry('STRING')
    AddTextComponentString(str)
    DrawText(x, y)
end

local function DrawPanel(w)
    local x, y = 0.015, 0.28
    local lineH = 0.028
    local rows = #FIELDS
    local h = lineH * (rows + 6) + 0.02

    DrawRect(x + 0.115, y + h * 0.5 - 0.012, 0.245, h, 0, 0, 0, 190)

    Text(x + 0.01, y, 0.42, '~y~CASINO WHEEL EDITOR~s~  (wheel ' .. wheelId .. '/' .. #Config.Wheels .. ')')
    y = y + lineH * 1.2

    for i, f in ipairs(FIELDS) do
        local val = w.off[f.key]
        local sel = (i == fieldIndex)
        local prefix = sel and '~g~> ' or '~s~  '
        Text(x + 0.01, y, 0.36, ('%s%-11s ~w~%.4f'):format(prefix, f.label, val))
        y = y + lineH
    end

    y = y + lineH * 0.4
    Text(x + 0.01, y, 0.30, '~b~Up/Down~s~ pick field   ~b~Left/Right~s~ adjust')
    y = y + lineH * 0.8
    Text(x + 0.01, y, 0.30, '~b~Shift~s~ fine x0.1   ~b~Alt~s~ coarse x10')
    y = y + lineH * 0.8
    Text(x + 0.01, y, 0.30, '~b~G~s~ next wheel   ~b~X~s~ reset field')
    y = y + lineH * 0.8
    Text(x + 0.01, y, 0.30, '~g~ENTER~s~ save for everyone   ~r~BACKSPACE~s~ cancel')
end

-- ---------------------------------------------------------------
-- OPEN / CLOSE
-- ---------------------------------------------------------------
local snapshot = nil

local function CopyOff(o)
    local c = {}
    for k, v in pairs(o) do c[k] = v end
    return c
end

local function Close(restore)
    if restore and snapshot and API.wheels[wheelId] then
        API.wheels[wheelId].off = snapshot
    end
    active, snapshot = false, nil
    API.setEditing(nil)
end

local function Open(id)
    wheelId = id
    fieldIndex = 1
    snapshot = CopyOff(API.wheels[wheelId].off)
    active = true
    API.setEditing(wheelId)
end

-- ---------------------------------------------------------------
-- MAIN LOOP
-- ---------------------------------------------------------------
local function Adjust(dir)
    local w = API.wheels[wheelId]
    local f = FIELDS[fieldIndex]
    local step = f.step

    if IsDisabledControlPressed(0, CTRL.fine) then
        step = step * 0.1
    elseif IsDisabledControlPressed(0, CTRL.coarse) then
        step = step * 10.0
    end

    w.off[f.key] = w.off[f.key] + step * dir

    if f.key == 'size' and w.off.size < 0.01 then w.off.size = 0.01 end
end

CreateThread(function()
    while true do
        if not active then
            Wait(250)
        else
            local w = API.wheels[wheelId]
            if not w then Close(false) else
                DrawPanel(w)

                for _, c in pairs(CTRL) do DisableControlAction(0, c, true) end
                DisableControlAction(0, 38, true)  -- E, so we don't spin while tuning

                -- Field selection
                if IsDisabledControlJustPressed(0, CTRL.up) then
                    fieldIndex = fieldIndex - 1
                    if fieldIndex < 1 then fieldIndex = #FIELDS end
                elseif IsDisabledControlJustPressed(0, CTRL.down) then
                    fieldIndex = fieldIndex + 1
                    if fieldIndex > #FIELDS then fieldIndex = 1 end
                end

                -- Value adjust: tap for one step, hold to repeat
                local dir = 0
                if IsDisabledControlPressed(0, CTRL.right) then dir = 1
                elseif IsDisabledControlPressed(0, CTRL.left) then dir = -1 end

                if dir ~= 0 then
                    if dir ~= holdDir then
                        holdDir, holdTimer = dir, 0
                        Adjust(dir)
                    else
                        holdTimer = holdTimer + 1
                        if holdTimer > 25 then Adjust(dir) end
                    end
                else
                    holdDir, holdTimer = 0, 0
                end

                -- Reset current field to its configured value
                if IsDisabledControlJustPressed(0, CTRL.reset) then
                    local f = FIELDS[fieldIndex]
                    local base = (w.cfg.offset and w.cfg.offset[f.key]) or Config.DefaultOffset[f.key]
                    w.off[f.key] = base + 0.0
                end

                -- Jump to the next wheel
                if IsDisabledControlJustPressed(0, CTRL.swap) then
                    local ids = {}
                    for id in pairs(API.wheels) do ids[#ids + 1] = id end
                    table.sort(ids)
                    if #ids > 1 then
                        local cur = 1
                        for i, id in ipairs(ids) do if id == wheelId then cur = i end end
                        local nextId = ids[(cur % #ids) + 1]
                        Close(true)
                        Open(nextId)
                    end
                end

                -- Save / cancel
                if IsDisabledControlJustPressed(0, CTRL.save) then
                    TriggerServerEvent('casino-wheel:saveOffset', wheelId, w.off)
                    Close(false)
                elseif IsDisabledControlJustPressed(0, CTRL.cancel) then
                    Close(true)
                end
            end

            Wait(0)
        end
    end
end)

-- ---------------------------------------------------------------
-- ENTRY POINT (server ACE-gated)
-- ---------------------------------------------------------------
RegisterNetEvent('casino-wheel:openEditor', function()
    API = API or CasinoWheelInternal
    if not API or not API.wheels then return end

    if active then Close(true) return end

    local id, dist = API.nearest()
    if not id then
        TriggerEvent('chat:addMessage', { args = { '^1[Casino Wheel]', 'No wheels spawned yet.' } })
        return
    end
    if API.isSpinning(id) then
        TriggerEvent('chat:addMessage', { args = { '^1[Casino Wheel]', 'That wheel is mid-spin.' } })
        return
    end
    if dist > 60.0 then
        TriggerEvent('chat:addMessage', { args = { '^1[Casino Wheel]', ('Nearest wheel is %.0fm away — go to it first.'):format(dist) } })
        return
    end

    Open(id)
end)

AddEventHandler('onResourceStop', function(r)
    if r == GetCurrentResourceName() and active then Close(false) end
end)
