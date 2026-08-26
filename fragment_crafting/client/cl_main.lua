local oxLib = lib
local Config = Config
local clCraftingLocations = GlobalState.fragmentCraftingLocations or {}

-----------------------------------------------------------
-- State
-----------------------------------------------------------
local isBenchOpen = false
local currentBench = nil
local currentWeaponObject = nil
local currentWeaponHash = nil
local currentWeaponSerial = nil
local currentWeaponName = nil
local currentWeaponLabel = nil
local currentTab = "crafting"
local editRot = nil
local hasWeaponEquipped = false

-- Attachment state
local placedAttachmentObjects = {}
local placedAttachmentData = {}
local activeGizmoAttachment = nil

-- Session-scoped state. The client is NOT trusted to track inventory or
-- compute costs — all of that is server-side now. We keep a snapshot of
-- the at-open attachments here purely for UI bookkeeping (e.g. the diff
-- the server will compute and charge is also previewable in the UI).
local sessionOriginal = {}

-- Live weapon attachments (outside bench)
local liveWeaponAttachments = {}
local lastEquippedSerial = nil

-- Forward declarations: these two functions are defined further down the
-- file but referenced from AttemptOpenCraftingBench's close branch.
-- Without these, Lua resolves the names to nil globals at compile time.
local ApplyLiveAttachments
local CleanupLiveAttachments

local weaponOffsetData = {
    position = vector3(0.15, -0.2, 0.25),
    rotation = vector3(20.0, 0.0, -180.0),
}

-----------------------------------------------------------
-- Helpers
-----------------------------------------------------------
local function OffsetFromHeading(base, heading, off)
    local r = math.rad(heading)
    local sinH, cosH = math.sin(r), math.cos(r)
    return vector3(
        base.x + (off.x * cosH - off.y * sinH),
        base.y + (off.x * sinH + off.y * cosH),
        base.z + off.z
    )
end

local function LocalDeltaToWorld(heading, dx, dy, dz)
    local r = math.rad(heading)
    local sinH, cosH = math.sin(r), math.cos(r)
    return dx * cosH - dy * sinH, dx * sinH + dy * cosH, dz
end

local function wrapAngle(deg)
    deg = deg % 360.0
    if deg > 180.0 then deg = deg - 360.0 end
    return deg
end

-----------------------------------------------------------
-- Cleanup bench
-----------------------------------------------------------
local function CleanupBench()
    if currentWeaponObject and DoesEntityExist(currentWeaponObject) then
        DeleteObject(currentWeaponObject)
    end
    currentWeaponObject = nil

    for idx, ent in pairs(placedAttachmentObjects) do
        if DoesEntityExist(ent) then DeleteObject(ent) end
    end
    placedAttachmentObjects = {}
    placedAttachmentData = {}
    activeGizmoAttachment = nil

    RenderScriptCams(false, false, 0, true, true)
    DestroyAllCams(true)
    FreezeEntityPosition(cache.ped, false)
    editRot = nil
end

-----------------------------------------------------------
-- Spawn attachment prop on bench weapon
-----------------------------------------------------------
local function SpawnAttachmentOnBench(attData, attachmentIndex)
    if not currentWeaponObject or not DoesEntityExist(currentWeaponObject) then
        print('[fragment_crafting] No weapon object to attach to')
        return
    end

    -- DEBUG: force every attachment to spawn as a coffee cup so we can
    -- verify the placement/gizmo system without depending on real models.
    -- Set DEBUG_ATTACHMENT_MODEL = nil to restore normal behavior.
    -- local DEBUG_ATTACHMENT_MODEL = 'p_amb_coffeecup_01'

    if attData.type == "model" or (DEBUG_ATTACHMENT_MODEL and attData.type == "barrel") then
        local modelName = DEBUG_ATTACHMENT_MODEL or attData.model
        if not modelName then return end

        local modelHash = GetHashKey(modelName)
        lib.requestModel(modelHash)

        local offset = { x = 0.0, y = 0.0, z = 0.0 }
        local rotation = { x = 0.0, y = 0.0, z = 0.0 }

        local srcOffset = attData.offset or attData.defaultOffset
        if srcOffset then
            offset.x = tonumber(srcOffset.x) or 0.0
            offset.y = tonumber(srcOffset.y) or 0.0
            offset.z = tonumber(srcOffset.z) or 0.0
        end

        local srcRot = attData.rotation or attData.defaultRotation
        if srcRot then
            rotation.x = tonumber(srcRot.x) or 0.0
            rotation.y = tonumber(srcRot.y) or 0.0
            rotation.z = tonumber(srcRot.z) or 0.0
        end

        local wCoords = GetEntityCoords(currentWeaponObject)
        local obj = CreateObjectNoOffset(modelHash, wCoords.x, wCoords.y, wCoords.z, false, false, false)

        if not obj or obj == 0 then
            SetModelAsNoLongerNeeded(modelHash)
            return
        end

        FreezeEntityPosition(obj, true)
        SetEntityCollision(obj, false, false)
        SetEntityCompletelyDisableCollision(obj, true, false)

        AttachEntityToEntity(
            obj, currentWeaponObject, 0,
            offset.x, offset.y, offset.z,
            rotation.x, rotation.y, rotation.z,
            false, false, false, false, 2, true
        )

        placedAttachmentObjects[attachmentIndex] = obj
        placedAttachmentData[attachmentIndex] = {
            index    = attData.index or attachmentIndex,
            label    = attData.label,
            type     = "model",  -- normalize so gizmo/edit treats it as a model
            model    = modelName,
            item     = attData.item,
            category = attData.category,
            offset   = offset,
            rotation = rotation,
        }

        SetModelAsNoLongerNeeded(modelHash)

    elseif attData.type == "barrel" then
        placedAttachmentData[attachmentIndex] = {
            index     = attData.index or attachmentIndex,
            label     = attData.label,
            type      = attData.type,
            component = attData.component,
            item      = attData.item,
            category  = attData.category,
        }

        if attData.component then
            GiveWeaponComponentToEntity(currentWeaponObject, GetHashKey(attData.component))
        end
    end
end

-----------------------------------------------------------
-- Remove attachment from bench
-----------------------------------------------------------
local function RemoveAttachmentFromBench(attachmentIndex)
    local data = placedAttachmentData[attachmentIndex]
    if not data then return end

    if data.type == "model" then
        local ent = placedAttachmentObjects[attachmentIndex]
        if ent and DoesEntityExist(ent) then
            DetachEntity(ent, true, true)
            DeleteObject(ent)
        end
        placedAttachmentObjects[attachmentIndex] = nil
    elseif data.type == "barrel" and data.component and currentWeaponObject then
        RemoveWeaponComponentFromEntity(currentWeaponObject, GetHashKey(data.component))
    end

    placedAttachmentData[attachmentIndex] = nil
    if activeGizmoAttachment == attachmentIndex then
        activeGizmoAttachment = nil
    end
end

-----------------------------------------------------------
-- Build the canonical commit payload for the server.
-- The server only needs the attachment INDEX (into Config.Attachments)
-- plus offset/rotation. It enriches the rest from its own config so the
-- client cannot inject custom display fields or item names.
-----------------------------------------------------------
local function BuildCommitPayload()
    local placement = {}
    for _, data in pairs(placedAttachmentData) do
        if type(data.index) == 'number' then
            placement[#placement + 1] = {
                index    = data.index,
                offset   = data.offset   or { x = 0, y = 0, z = 0 },
                rotation = data.rotation or { x = 0, y = 0, z = 0 },
            }
        end
    end
    return {
        serial    = currentWeaponSerial,
        weapon    = currentWeaponName,
        placement = placement,
    }
end

-----------------------------------------------------------
-- Open / Close Crafting Bench
-----------------------------------------------------------
-- Flag set just before re-toggling closed, telling the close branch
-- whether to commit pending changes ('save') or drop them ('discard').
-- Only meaningful when the bench is being closed.
local pendingCloseMode = nil

local function AttemptOpenCraftingBench(benchLocationData)
    local result = oxLib.callback.await('fragment_crafting:server:attemptToOpenCrafting', false)
    if not result then
        print('[fragment_crafting] Server refused to open crafting bench.')
        TriggerEvent('ox_lib:notify', { type = 'error', description = 'You do not have access to fragment crafting.' })
        return
    end

    isBenchOpen = not isBenchOpen
    print(('[fragment_crafting] AttemptOpenCraftingBench: isBenchOpen=%s, hasLocation=%s'):format(tostring(isBenchOpen), tostring(benchLocationData ~= nil)))

    if isBenchOpen and benchLocationData then
        currentBench = benchLocationData.coords
        currentTab = "crafting"

        -- Check if player has a weapon equipped
        local _, weap = GetCurrentPedWeapon(cache.ped)
        hasWeaponEquipped = weap and weap ~= `WEAPON_UNARMED`
        print(('[fragment_crafting] bench-open: hasWeaponEquipped=%s'):format(tostring(hasWeaponEquipped)))

        -- Get weapon serial only if weapon equipped
        currentWeaponSerial = nil
        currentWeaponName = nil
        currentWeaponLabel = nil

        if hasWeaponEquipped then
            local weaponData = oxLib.callback.await('fragment_crafting:server:getWeaponSerial')
            if weaponData then
                currentWeaponSerial = weaponData.serial
                currentWeaponName = weaponData.name
                currentWeaponLabel = weaponData.label
            end
        end

        -- Camera
        local newCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        local bench = benchLocationData.coords
        local benchPos = vector3(bench.x, bench.y, bench.z)
        local heading = bench.w

        local camOffset = vector3(0.0, -0.85, 0.6)
        local camPos = OffsetFromHeading(benchPos, heading, camOffset)
        SetCamCoord(newCam, camPos.x, camPos.y, camPos.z)
        SetCamRot(newCam, -30.0, 0.0, heading)
        SetCamFov(newCam, 50.0)
        RenderScriptCams(true, false, 0, true, true)
        SetCamUseShallowDofMode(newCam, false)
        SetCamNearDof(newCam, 0.3)
        SetCamFarDof(newCam, 1.0)
        SetCamDofStrength(newCam, 1.0)

        CreateThread(function()
            SetEntityVisible(cache.ped, true)
            while isBenchOpen do
                SetEntityLocallyInvisible(cache.ped)
                DisablePlayerFiring(cache.playerId, true)
                SetUseHiDof()
                Wait(0)
            end
        end)

        FreezeEntityPosition(cache.ped, true)

        -- Helper: spawn a weapon prop on the bench from a hash
        local function SpawnBenchWeapon(weaponHash)
            -- cleanup any previously spawned bench weapon (and its attachments)
            if currentWeaponObject and DoesEntityExist(currentWeaponObject) then
                for idx, ent in pairs(placedAttachmentObjects) do
                    if DoesEntityExist(ent) then DeleteObject(ent) end
                end
                placedAttachmentObjects = {}
                placedAttachmentData = {}
                activeGizmoAttachment = nil
                DeleteObject(currentWeaponObject)
                currentWeaponObject = nil
            end

            if not weaponHash or weaponHash == 0 then return end

            -- Try the weapon-asset path first (vanilla weapons), then fall back to
            -- the model path (custom weapons registered as props). Both wrapped in
            -- short timeouts so a missing asset can't hang the bench-open flow.
            local function awaitWithTimeout(asyncFn, isLoaded, label, timeoutMs)
                local done = false
                CreateThread(function()
                    asyncFn()
                    done = true
                end)
                local started = GetGameTimer()
                while not done do
                    if GetGameTimer() - started > timeoutMs then
                        print(('[fragment_crafting] %s timed out for hash %s'):format(label, weaponHash))
                        return false
                    end
                    Wait(50)
                end
                return isLoaded()
            end

            local weaponAssetReady = awaitWithTimeout(
                function() lib.requestWeaponAsset(weaponHash) end,
                function() return HasWeaponAssetLoaded(weaponHash) end,
                'requestWeaponAsset',
                1500
            )

            local modelReady = false
            if not weaponAssetReady then
                -- Custom weapons (skrill packs, etc.) aren't real weapon-assets — try as a model.
                modelReady = awaitWithTimeout(
                    function() lib.requestModel(weaponHash) end,
                    function() return HasModelLoaded(weaponHash) end,
                    'requestModel (custom weapon fallback)',
                    1500
                )
            end

            if not weaponAssetReady and not modelReady then
                print(('[fragment_crafting] could not load weapon/model %s — skipping bench weapon spawn'):format(weaponHash))
                return
            end

            local weaponPos = OffsetFromHeading(benchPos, heading, weaponOffsetData.position)
            currentWeaponHash = weaponHash

            if weaponAssetReady then
                currentWeaponObject = CreateWeaponObject(
                    weaponHash, 1,
                    weaponPos.x, weaponPos.y, weaponPos.z,
                    true, 1.0, 0
                )
            end

            if not currentWeaponObject or currentWeaponObject == 0 then
                -- fallback: spawn as a regular prop
                currentWeaponObject = CreateObjectNoOffset(
                    weaponHash,
                    weaponPos.x, weaponPos.y, weaponPos.z,
                    false, false, false
                )
            end

            if currentWeaponObject and currentWeaponObject ~= 0 then
                FreezeEntityPosition(currentWeaponObject, true)
                local r = weaponOffsetData.rotation
                SetEntityRotation(currentWeaponObject, r.x, r.y, (heading + r.z) % 360.0, 2, true)
                SetEntityCompletelyDisableCollision(currentWeaponObject, true, false)
                SetEntityDynamic(currentWeaponObject, false)
                SetEntityCollision(currentWeaponObject, false, false)
            else
                print(('[fragment_crafting] CreateWeaponObject/CreateObject both returned 0 for hash %s'):format(weaponHash))
            end

            if modelReady then SetModelAsNoLongerNeeded(weaponHash) end
        end

        -- Spawn weapon object on bench
        -- 1) If player is holding a weapon, use that one
        -- 2) Otherwise, spawn the first unlocked recipe's weapon as a preview
        local initialHash = nil
        if hasWeaponEquipped then
            local currentWeaponEntity = GetCurrentPedWeaponEntityIndex(cache.ped)
            if currentWeaponEntity and currentWeaponEntity ~= 0 then
                initialHash = GetEntityModel(currentWeaponEntity)
            end
        end
        if not initialHash and Config.WeaponRecipes[1] then
            initialHash = GetHashKey(Config.WeaponRecipes[1].spawnName)
        end
        if initialHash then SpawnBenchWeapon(initialHash) end

        -- Expose helper to NUI callback below (close-scoped via upvalue)
        _G.fragment_SpawnBenchWeapon = SpawnBenchWeapon

        -- Fetch recipes
        print('[fragment_crafting] bench-open: fetching unlocked recipes...')
        local unlocked = oxLib.callback.await('fragment_crafting:server:getUnlockedRecipes') or {}
        print(('[fragment_crafting] bench-open: got unlocked, type=%s'):format(type(unlocked)))

        print('[fragment_crafting] bench-open: fetching fragment count...')
        local fragCount = oxLib.callback.await('fragment_crafting:server:getFragmentCount', false, 'tbx_fragments') or 0
        print(('[fragment_crafting] bench-open: got fragCount=%s'):format(tostring(fragCount)))

        -- "Has any blueprint": gates both installing AND removing attachments
        -- in the UI. The server enforces the same rule on commit.
        local hasAnyBlueprint = false
        for _, isUnlocked in pairs(unlocked) do
            if isUnlocked then hasAnyBlueprint = true break end
        end
        print(('[fragment_crafting] bench-open: hasAnyBlueprint=%s'):format(tostring(hasAnyBlueprint)))

        -- Per-recipe cost comes straight from the shared config so the UI
        -- always shows whatever the server will actually charge. The server
        -- still validates on commit using ITS OWN copy of the same config —
        -- so a tampered client can lie about the displayed cost but cannot
        -- influence what's actually deducted.
        local recipes = {}
        for i, recipe in ipairs(Config.WeaponRecipes) do
            local cost = tonumber(recipe.fragmentCost) or 0
            -- Weapon image is the ox_inventory item name, which equals
            -- the weapon's spawnName (lowercased). No separate image field.
            local imgName = string.lower(recipe.spawnName or '')
            recipes[#recipes + 1] = {
                label              = recipe.label,
                spawnName          = recipe.spawnName,
                category           = recipe.category,
                subtitle           = recipe.subtitle,
                unlocked           = unlocked[i] or false,
                costItem           = 'tbx_fragments',
                costAmount         = cost,
                image              = imgName,
                bigImage           = imgName,
                requiredComponents = {},  -- legacy field, UI may key off it; empty in new model
            }
        end

        -- Always fetch attachment list so the right grid shows even without a weapon equipped
        print('[fragment_crafting] bench-open: fetching available attachments...')
        local attachments = oxLib.callback.await('fragment_crafting:server:getAvailableAttachments', false, currentWeaponName) or {}
        print(('[fragment_crafting] bench-open: got %d attachments'):format(#attachments))

        -- Load saved attachments
        if currentWeaponSerial and hasWeaponEquipped then
            local savedData = oxLib.callback.await('fragment_crafting:server:loadAttachments', false, currentWeaponSerial)
            if savedData and savedData.attachments then
                print(('[fragment_crafting] bench-open: loaded %d saved attachments for serial %s'):format(#savedData.attachments, tostring(currentWeaponSerial)))
                for _, att in ipairs(savedData.attachments) do
                    -- Newer server writes 'index'; older rows may have 'configIndex'.
                    -- Fall back to a unique sequential key as a last resort.
                    local uniqueKey = att.index or att.configIndex or (#placedAttachmentData + 1)
                    -- Make sure attData has 'index' for downstream gizmo/commit logic.
                    att.index = uniqueKey
                    pcall(SpawnAttachmentOnBench, att, uniqueKey)
                end
            else
                print(('[fragment_crafting] bench-open: no saved attachments for serial %s'):format(tostring(currentWeaponSerial)))
            end
        end

        -- Snapshot the original placed-attachments state (deep copy) so we can
        -- diff against it on Save & Close (commit) or just drop it on Discard.
        sessionOriginal = {}
        for idx, data in pairs(placedAttachmentData) do
            sessionOriginal[idx] = {
                item      = data.item,
                label     = data.label,
                category  = data.category,
                type      = data.type,
                model     = data.model,
                component = data.component,
            }
        end

        -- Build placed list for NUI
        local placedForNUI = {}
        for idx, data in pairs(placedAttachmentData) do
            placedForNUI[#placedForNUI + 1] = {
                benchIndex = idx,
                label      = data.label,
                type       = data.type,
                category   = data.category,
            }
        end

        local weaponCoords = currentWeaponObject and GetEntityCoords(currentWeaponObject) or benchPos
        local _, sx, sy = GetHudScreenPositionFromWorldPosition(weaponCoords.x, weaponCoords.y, weaponCoords.z)

        print('[fragment_crafting] bench-open: sending setVisible to UI, opening NUI focus')
        SendNUIMessage({
            action = "setVisible",
            data = {
                visible = true,
                tab = "crafting",
                screenCoordsOfWeapon = { x = sx * 100, y = sy * 100 },
                WeaponRecipes = recipes,
                fragmentCount = fragCount,
                fragmentItem = "tbx_fragments",
                weaponName = currentWeaponLabel or currentWeaponName or "No Weapon",
                weaponSerial = currentWeaponSerial,
                hasWeapon = hasWeaponEquipped,
                hasBlueprint = hasAnyBlueprint,
                availableAttachments = attachments,
                placedAttachments = placedForNUI,
                inventoryImagePath = Config.InventoryImagePath or 'ox_inventory',
            }
        })

        SetNuiFocus(true, true)

        -- Update weapon + attachment screen coords loop
        CreateThread(function()
            while isBenchOpen do
                if currentWeaponObject and DoesEntityExist(currentWeaponObject) then
                    local wc = GetEntityCoords(currentWeaponObject)
                    local _, x, y = GetHudScreenPositionFromWorldPosition(wc.x, wc.y, wc.z)
                    SendNUIMessage({
                        action = "updateWeaponScreenCoords",
                        data = { x = x * 100, y = y * 100 }
                    })

                    -- Track active gizmo attachment position + weapon rotation
                    if activeGizmoAttachment then
                        local ent = placedAttachmentObjects[activeGizmoAttachment]
                        if ent and DoesEntityExist(ent) then
                            local ac = GetEntityCoords(ent)
                            local _, ax, ay = GetHudScreenPositionFromWorldPosition(ac.x, ac.y, ac.z)
                            local weapRot = GetEntityRotation(currentWeaponObject, 2)
                            SendNUIMessage({
                                action = "updateGizmoScreenCoords",
                                data = {
                                    x = ax * 100,
                                    y = ay * 100,
                                    weaponRotX = weapRot.x,
                                    weaponRotY = weapRot.y,
                                    weaponRotZ = weapRot.z,
                                }
                            })
                        end
                    end
                end
                Wait(16)
            end
        end)
    else
        -- Commit or discard pending changes based on how we got here.
        -- Default to 'discard' if no mode was set (safer: never write changes
        -- the player didn't explicitly ask for).
        local mode = pendingCloseMode or 'discard'
        pendingCloseMode = nil

        -- Snapshot identity BEFORE the bench teardown wipes our locals. We
        -- need these to refresh the live weapon afterward.
        local savedSerial = currentWeaponSerial
        local savedName   = currentWeaponName

        local committedAttachments = nil  -- server-authoritative list, set only on success

        if mode == 'save' then
            -- ONE atomic server call. The server validates ownership,
            -- diffs against the DB, charges fragments for new attachments,
            -- and writes the new state. We don't touch inventory ourselves.
            local payload = BuildCommitPayload()

            -- Defensive: only attempt the commit if we have both serial
            -- and weapon — otherwise the server would reject anyway.
            if payload.serial and payload.weapon then
                local ok, msg, data = oxLib.callback.await(
                    'fragment_crafting:server:commitAttachments', false, payload
                )
                if ok and data and data.attachments then
                    committedAttachments = data.attachments
                    if msg then print(('[fragment_crafting] %s'):format(msg)) end
                else
                    -- Server refused (not enough fragments, ownership, etc).
                    -- We deliberately do NOT save anything. Live attachments
                    -- will be re-loaded from DB on next equip.
                    print(('[fragment_crafting] commitAttachments refused: %s'):format(tostring(msg)))
                    if msg then
                        TriggerEvent('ox_lib:notify', { type = 'error', description = tostring(msg) })
                    end
                end
            end
        end
        -- 'discard' path: do nothing. Inventory and DB are untouched.

        sessionOriginal = {}

        CleanupBench()
        isBenchOpen = false
        currentBench = nil
        currentWeaponSerial = nil
        currentWeaponName = nil
        currentWeaponLabel = nil
        currentWeaponHash = nil
        currentTab = "crafting"
        hasWeaponEquipped = false

        -- Refresh the live attachments on the player's actual weapon so
        -- the saved configuration is visible immediately. We trust ONLY
        -- the server-returned attachment list — never the client's local
        -- view, because the server may have rejected/edited the request.
        if mode == 'save' and savedSerial and committedAttachments then
            CleanupLiveAttachments(savedSerial)
            CreateThread(function()
                Wait(200)
                local ped = cache.ped
                local weaponEntity = GetCurrentPedWeaponEntityIndex(ped)
                local started = GetGameTimer()
                while (not weaponEntity or weaponEntity == 0) and GetGameTimer() - started < 1500 do
                    Wait(50)
                    weaponEntity = GetCurrentPedWeaponEntityIndex(ped)
                end
                if weaponEntity and weaponEntity ~= 0 then
                    ApplyLiveAttachments(savedSerial, {
                        serial      = savedSerial,
                        weapon      = savedName,
                        attachments = committedAttachments,
                    })
                end
            end)
        end
    end
end

-----------------------------------------------------------
-- Init bench points (no weapon required to open)
-----------------------------------------------------------
local function init()
    for i = 1, #clCraftingLocations do
        local location = clCraftingLocations[i]
        local craftingZone = oxLib.points.new({
            coords = vec3(location.coords.x, location.coords.y, location.coords.z),
            distance = location.spawnDistance,
            spawnedModel = nil
        })

        function craftingZone:onEnter()
            if not self.spawnedModel then
                lib.requestModel(location.model)
                self.spawnedModel = CreateObjectNoOffset(GetHashKey(location.model), location.coords.x, location.coords.y, location.coords.z - 1, false, false, false)
                SetEntityHeading(self.spawnedModel, location.coords.w)
                FreezeEntityPosition(self.spawnedModel, true)
            end
        end

        function craftingZone:onExit()
            if self.spawnedModel then
                DeleteObject(self.spawnedModel)
                self.spawnedModel = nil
            end
        end

        function craftingZone:nearby()
            if self.currentDistance < 2.0 then
                if IsControlJustReleased(0, 51) then
                    AttemptOpenCraftingBench(location)
                    lib.hideTextUI()
                end

                if not self.promptShown then
                    lib.showTextUI('[E] - Open Crafting Menu')
                    self.promptShown = true
                end
            end
        end
    end
end

CreateThread(init)

-----------------------------------------------------------
-- NUI Callbacks
-----------------------------------------------------------
-- Close paths. The UI explicitly chooses whether to commit (Save & Close)
-- or drop (Discard & Close) pending changes. `hideUI` is kept as a backward-
-- compat alias and defaults to DISCARD — never auto-commit silently.
local function _closeBench(mode)
    pendingCloseMode = mode
    AttemptOpenCraftingBench(nil)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "setVisible",
        data = { visible = false }
    })
end

RegisterNUICallback('closeAndSave', function(_, cb)
    _closeBench('save')
    cb('ok')
end)

RegisterNUICallback('closeAndDiscard', function(_, cb)
    _closeBench('discard')
    cb('ok')
end)

RegisterNUICallback('hideUI', function(_, cb)
    -- Back-compat path: any caller that just says "hide" defaults to discard.
    _closeBench('discard')
    cb('ok')
end)

RegisterNUICallback('switchTab', function(data, cb)
    currentTab = data.tab or "crafting"
    cb({ ok = true })
end)

-- Print a clickable store URL in chat so the player can click through.
-- CEF (FiveM's NUI browser) blocks plain window.open, so the cleanest way
-- to surface an external link is via the standard chat resource — it
-- auto-detects http URLs and renders them clickable.
RegisterNUICallback('openStoreLink', function(data, cb)
    local url = tostring(data and data.url or '')
    -- Whitelist: only allow our store domain to be opened this way, so
    -- a tampered NUI bundle can't pass an arbitrary URL through.
    if not url:find('^https://store%.thelandla%.net/') then
        cb({ ok = false, reason = 'blocked' })
        return
    end

    -- CEF blocks window.open, so we surface the URL in chat. The chat
    -- resource auto-detects http(s) URLs and makes them clickable.
    TriggerEvent('chat:addMessage', {
        color  = { 59, 130, 246 },
        multiline = true,
        args   = { 'Crafting Bench', 'Top up fragments here: ^4' .. url .. '^0' },
    })

    -- Close the bench so the chat message is visible and the link is
    -- clickable. Treat it as a discard close — the player didn't ask
    -- to save and shouldn't be charged just because they opened the store.
    _closeBench('discard')

    cb({ ok = true })
end)

-- Swap the bench preview weapon when user selects a different recipe in the UI
RegisterNUICallback('previewRecipe', function(data, cb)
    if not isBenchOpen then cb({ ok = false }) return end

    local recipeIndex = data.recipeIndex
    local recipe = recipeIndex and Config.WeaponRecipes[recipeIndex] or nil
    if not recipe then cb({ ok = false }) return end

    if _G.fragment_SpawnBenchWeapon then
        local h = GetHashKey(recipe.spawnName)
        _G.fragment_SpawnBenchWeapon(h)
    end
    cb({ ok = true })
end)

RegisterNUICallback('rotateWeaponScreenCoords', function(data, cb)
    local r = data.rotation or {}
    local rx = tonumber(r.x) or 0.0
    local ry = tonumber(r.y) or 0.0
    local rz = tonumber(r.z) or 0.0

    if currentWeaponObject and DoesEntityExist(currentWeaponObject) then
        if not editRot then
            local cur = GetEntityRotation(currentWeaponObject, 2)
            editRot = { x = cur.x + 0.0, y = cur.y + 0.0, z = cur.z + 0.0 }
        end
        editRot.x = wrapAngle(editRot.x + rx)
        editRot.y = wrapAngle(editRot.y + ry)
        editRot.z = wrapAngle(editRot.z + rz)
        SetEntityRotation(currentWeaponObject, editRot.x, editRot.y, editRot.z, 2, true)
    end
    cb({ ok = true })
end)

RegisterNUICallback('moveWeaponScreenCoords', function(data, cb)
    local d = data.delta or {}
    local dx = tonumber(d.x) or 0.0
    local dy = tonumber(d.y) or 0.0
    local dz = tonumber(d.z) or 0.0

    if currentWeaponObject and DoesEntityExist(currentWeaponObject) and currentBench then
        local heading = currentBench.w
        local wx, wy, wz = LocalDeltaToWorld(heading, dx, dy, dz)
        local cx, cy, cz = table.unpack(GetEntityCoords(currentWeaponObject))
        SetEntityCoordsNoOffset(currentWeaponObject, cx + wx, cy + wy, cz + wz, false, false, false)
    end
    cb({ ok = true })
end)

RegisterNUICallback('craftWeapon', function(data, cb)
    local recipeIndex = data.recipeIndex
    if not recipeIndex then
        cb({ success = false, message = 'Invalid recipe' })
        return
    end

    local success, message = oxLib.callback.await('fragment_crafting:server:attemptCraft', false, recipeIndex)
    local fragCount = oxLib.callback.await('fragment_crafting:server:getFragmentCount', false, 'tbx_fragments')

    cb({ success = success, message = message, fragmentCount = fragCount })
end)

RegisterNUICallback('placeAttachment', function(data, cb)
    -- This callback is now purely client-side. We spawn the visual prop on
    -- the bench weapon and let the user position it with the gizmo. Nothing
    -- is removed from inventory and nothing is sent to the server.
    -- The server validates and charges everything atomically on Save & Close
    -- via the commitAttachments callback. This way:
    --   - Placing isn't a trust event (no inventory mutation here)
    --   - Removing isn't a trust event either (still no inventory mutation)
    --   - The only trust point is the one atomic commit at the end
    local attData = data.attachment
    if not attData then
        cb({ success = false, message = 'No attachment data' })
        return
    end

    if not hasWeaponEquipped then
        cb({ success = false, message = 'No weapon on bench to attach to.' })
        return
    end

    if type(attData.index) ~= 'number' then
        cb({ success = false, message = 'Bad attachment.' })
        return
    end

    -- Prevent placing the same attachment twice in one session (client-side
    -- UX only — the server also enforces this on commit).
    for _, existing in pairs(placedAttachmentData) do
        if existing.index == attData.index then
            cb({ success = false, message = 'Already installed.' })
            return
        end
    end

    local benchIdx = attData.index

    local spawnOk, spawnErr = pcall(SpawnAttachmentOnBench, attData, benchIdx)
    if not spawnOk then
        cb({ success = false, message = 'Failed to spawn: ' .. tostring(spawnErr) })
        return
    end

    cb({
        success = true,
        message = 'Attachment placed (unsaved).',
        benchIndex = benchIdx,
        label = attData.label,
        type = attData.type,
        category = attData.category,
    })
end)

RegisterNUICallback('removeAttachment', function(data, cb)
    -- Same idea: pure local state. Inventory is untouched. The server diff
    -- on commit determines whether anything actually changed in DB.
    local benchIdx = data.benchIndex
    local attData = placedAttachmentData[benchIdx]

    if not attData then
        cb({ success = false, message = 'Attachment not found' })
        return
    end

    RemoveAttachmentFromBench(benchIdx)
    cb({ success = true, message = 'Attachment removed (unsaved).' })
end)

RegisterNUICallback('selectGizmoAttachment', function(data, cb)
    activeGizmoAttachment = data.benchIndex
    cb({ ok = true })
end)

-----------------------------------------------------------
-- GIZMO: Drag-based movement (mouse delta from NUI)
-- NO database save per tick — only local entity update
-----------------------------------------------------------
RegisterNUICallback('moveGizmoAttachment', function(data, cb)
    if not activeGizmoAttachment then cb({ ok = false }) return end

    local attData = placedAttachmentData[activeGizmoAttachment]
    local ent = placedAttachmentObjects[activeGizmoAttachment]

    if not attData or attData.type ~= "model" or not ent or not DoesEntityExist(ent) then
        cb({ ok = false })
        return
    end

    local d = data.delta or {}
    local dx = tonumber(d.x) or 0.0
    local dy = tonumber(d.y) or 0.0
    local dz = tonumber(d.z) or 0.0

    local maxOff = Config.Gizmo.maxOffset
    attData.offset.x = math.max(-maxOff, math.min(maxOff, attData.offset.x + dx))
    attData.offset.y = math.max(-maxOff, math.min(maxOff, attData.offset.y + dy))
    attData.offset.z = math.max(-maxOff, math.min(maxOff, attData.offset.z + dz))

    DetachEntity(ent, true, true)
    AttachEntityToEntity(
        ent, currentWeaponObject, 0,
        attData.offset.x, attData.offset.y, attData.offset.z,
        attData.rotation.x, attData.rotation.y, attData.rotation.z,
        false, false, false, false, 2, true
    )

    cb({ ok = true })
end)

RegisterNUICallback('rotateGizmoAttachment', function(data, cb)
    if not activeGizmoAttachment then cb({ ok = false }) return end

    local attData = placedAttachmentData[activeGizmoAttachment]
    local ent = placedAttachmentObjects[activeGizmoAttachment]

    if not attData or attData.type ~= "model" or not ent or not DoesEntityExist(ent) then
        cb({ ok = false })
        return
    end

    local r = data.rotation or {}
    attData.rotation.x = wrapAngle(attData.rotation.x + (tonumber(r.x) or 0.0))
    attData.rotation.y = wrapAngle(attData.rotation.y + (tonumber(r.y) or 0.0))
    attData.rotation.z = wrapAngle(attData.rotation.z + (tonumber(r.z) or 0.0))

    DetachEntity(ent, true, true)
    AttachEntityToEntity(
        ent, currentWeaponObject, 0,
        attData.offset.x, attData.offset.y, attData.offset.z,
        attData.rotation.x, attData.rotation.y, attData.rotation.z,
        false, false, false, false, 2, true
    )

    cb({ ok = true })
end)

-----------------------------------------------------------
-- LIVE WEAPON: Apply saved attachments on equip
-----------------------------------------------------------
local function _impl_ApplyLiveAttachments(serial, weaponData)
    if not weaponData or not weaponData.attachments then return end

    local ped = cache.ped
    local weaponEntity = GetCurrentPedWeaponEntityIndex(ped)
    if not weaponEntity or weaponEntity == 0 then return end

    local handles = {}

    for _, att in ipairs(weaponData.attachments) do
        if att.type == "model" and att.model then
            local ok, obj = pcall(function()
                local modelHash = GetHashKey(att.model)
                lib.requestModel(modelHash)

                local offset = att.offset or { x = 0, y = 0, z = 0 }
                local rotation = att.rotation or { x = 0, y = 0, z = 0 }

                local o = CreateObject(modelHash, 0.0, 0.0, 0.0, false, false, false)
                SetEntityCollision(o, false, false)
                SetEntityCompletelyDisableCollision(o, true, false)

                AttachEntityToEntity(
                    o, weaponEntity, 0,
                    tonumber(offset.x) or 0, tonumber(offset.y) or 0, tonumber(offset.z) or 0,
                    tonumber(rotation.x) or 0, tonumber(rotation.y) or 0, tonumber(rotation.z) or 0,
                    false, false, false, false, 2, true
                )

                SetModelAsNoLongerNeeded(modelHash)
                return o
            end)

            if ok and obj then
                handles[#handles + 1] = obj
            end

        elseif att.type == "barrel" and att.component then
            local _, weapHash = GetCurrentPedWeapon(ped)
            if weapHash then
                GiveWeaponComponentToPed(ped, weapHash, GetHashKey(att.component))
            end
        end
    end

    liveWeaponAttachments[serial] = {
        entityHandles = handles,
        data          = weaponData,
        -- Snapshot the weapon entity the props are attached to. When the
        -- engine destroys this entity (vault/swim/climb anim system temporarily
        -- un-renders the weapon), the props go with it. A watchdog thread
        -- compares the current weapon entity to this one and re-applies on mismatch.
        weaponEntity  = weaponEntity,
    }
end

local function _impl_CleanupLiveAttachments(serial)
    local live = liveWeaponAttachments[serial]
    if not live then return end

    for _, ent in ipairs(live.entityHandles or {}) do
        if DoesEntityExist(ent) then
            DetachEntity(ent, true, true)
            DeleteObject(ent)
        end
    end

    liveWeaponAttachments[serial] = nil
end

-- Hook the implementations into the forward-declared locals so any earlier
-- references (e.g. from AttemptOpenCraftingBench's close branch) resolve.
ApplyLiveAttachments   = _impl_ApplyLiveAttachments
CleanupLiveAttachments = _impl_CleanupLiveAttachments

-----------------------------------------------------------
-- Weapon equip listener (event-based)
-----------------------------------------------------------
AddEventHandler('ox_inventory:currentWeapon', function(currentWeapon)
    if currentWeapon and currentWeapon.metadata and currentWeapon.metadata.serial then
        local serial = currentWeapon.metadata.serial
        print(('[fragment_crafting] equip event: serial=%s lastSerial=%s benchOpen=%s'):format(
            tostring(serial), tostring(lastEquippedSerial), tostring(isBenchOpen)))

        if serial ~= lastEquippedSerial then
            if lastEquippedSerial then
                CleanupLiveAttachments(lastEquippedSerial)
            end
            lastEquippedSerial = serial

            if not isBenchOpen then
                print(('[fragment_crafting] equip: requesting attachments for %s'):format(serial))
                TriggerServerEvent('fragment_crafting:server:requestAttachments', serial)
            end
        end
    else
        if lastEquippedSerial then
            CleanupLiveAttachments(lastEquippedSerial)
            lastEquippedSerial = nil
        end
    end
end)

RegisterNetEvent('fragment_crafting:client:applyAttachments', function(weaponData)
    print(('[fragment_crafting] applyAttachments received: serial=%s attachCount=%s'):format(
        tostring(weaponData and weaponData.serial),
        tostring(weaponData and weaponData.attachments and #weaponData.attachments or 'nil')))
    if not weaponData or not weaponData.serial then return end
    Wait(200)
    ApplyLiveAttachments(weaponData.serial, weaponData)
end)

-----------------------------------------------------------
-- Weapon-entity watchdog
--
-- Vault / swim / climb / parachute animations make GTA destroy the held
-- weapon entity and create a new one when the action ends. Anything we
-- attached to the old entity goes with it. Detect that, clean up any
-- stale handles, and re-attach using the cached weaponData (no server
-- round-trip needed).
-----------------------------------------------------------
CreateThread(function()
    while true do
        Wait(500)
        if not isBenchOpen and lastEquippedSerial then
            local live = liveWeaponAttachments[lastEquippedSerial]
            if live and live.data and live.data.attachments and #live.data.attachments > 0 then
                local current = GetCurrentPedWeaponEntityIndex(cache.ped)
                if current and current ~= 0 and current ~= live.weaponEntity then
                    -- Entity changed: prop handles parented to the old one are
                    -- already destroyed by the engine. Clear and re-apply.
                    print(('[fragment_crafting] weapon entity changed (vault/swim?), re-attaching attachments for %s'):format(
                        tostring(lastEquippedSerial)))

                    -- Drop any leftover handles. We don't call DeleteObject
                    -- since GTA already cleaned them up; we just clear the
                    -- table so cleanup later doesn't no-op-loop over dead refs.
                    live.entityHandles = {}
                    liveWeaponAttachments[lastEquippedSerial] = nil

                    ApplyLiveAttachments(lastEquippedSerial, live.data)
                end
            end
        end
    end
end)

-----------------------------------------------------------
-- Cleanup on resource stop
-----------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    if isBenchOpen then
        CleanupBench()
        SetNuiFocus(false, false)
    end

    for serial, _ in pairs(liveWeaponAttachments) do
        CleanupLiveAttachments(serial)
    end
end)