local openState = false

-- Config.BUNDLES is the list; Config.BUNDLE is the legacy single-bundle field.
local function getBundles()
    if type(Config.BUNDLES) == 'table' and #Config.BUNDLES > 0 then
        return Config.BUNDLES
    end
    if type(Config.BUNDLE) == 'table' then
        return { Config.BUNDLE }
    end
    return {}
end

local currentMarketItems = GlobalState.donor_blackmarket_items or {}
local nextRotateAt = GlobalState.donor_blackmarket_nextRotateAt or 0

AddStateBagChangeHandler('donor_blackmarket_items', 'global', function(_, _, value)
    if type(value) ~= 'table' then return end

    currentMarketItems = value

    if not openState then return end

    SendNUIMessage({
        action = "updateMarketData",
        data = {
            marketItems = currentMarketItems,
            nextRotateAt = nextRotateAt
        }
    })
end)

AddStateBagChangeHandler('donor_blackmarket_nextRotateAt', 'global', function(_, _, value)
    if type(value) ~= 'number' then return end
    
    nextRotateAt = value

    if not openState then return end

    SendNUIMessage({
        action = "updateMarketData",
        data = {
            marketItems = currentMarketItems,
            nextRotateAt = nextRotateAt
        }
    })

    print(nextRotateAt, 'nextRotateAt updated')
end)

local function openDonorMarket()
    lib.callback('donor_blackmarket:getGender', false, function(gender)
        lib.callback('donor_blackmarket:getDailyStats', false, function(dailyStats)
            openState = true

            SetNuiFocus(true, true)
            SendNUIMessage({
                action = "setVisible",
                data = {
                    visible = true,
                    server = Config.server,
                    gender = gender,
                    marketItems = currentMarketItems,
                    nextRotateAt = nextRotateAt,
                    categories = Config.CATEGORIES,
                    bundles = getBundles(),
                    sections = Config.SECTIONS or {},
                    dailyStats = dailyStats or {},
                    dynamicBadges = Config.DYNAMIC_BADGES,
                    notifications = Config.NOTIFICATIONS,
                    cart = Config.CART,
                }
            })
        end)
    end)
end

-- live purchased-today update pushed by the server after each confirmed
-- purchase; only forwarded to the NUI while this player has the store open
RegisterNetEvent('donor_blackmarket:updateDailyPurchaseCount', function(productId, count)
    if not openState then return end

    SendNUIMessage({
        action = 'updateDailyPurchaseCount',
        data = { productId = productId, count = count }
    })
end)

-- Config.BLACK_MARKET_LOCATIONS is the list; BLACK_MARKET_LOCATION is the
-- legacy single-location field.
local function getMarketLocations()
    if type(Config.BLACK_MARKET_LOCATIONS) == 'table' and #Config.BLACK_MARKET_LOCATIONS > 0 then
        return Config.BLACK_MARKET_LOCATIONS
    end
    if Config.BLACK_MARKET_LOCATION then
        return { Config.BLACK_MARKET_LOCATION }
    end
    return {}
end

local function createBlackmarketPed(location)
    exports.svdden_dialog:createDialogPed({
        coords = vector4(location.x, location.y, location.z + 1, location.w),
        pedData = {
            coords = location,
            pedModel = 'Ghost',
            animation = 'WORLD_HUMAN_STAND_IMPATIENT_FACILITY',
            extraData = {
                freezeEntity = true,
                invincible = true,
                blockingEvents = true,
            }
        },
        radius = 4.0,
        key = 'E',
        label = 'Speak with Viper',
        dialogData = {
            icon = 'fas fa-gem',
            title = 'Black Market',
            description = 'Interested in some exclusive underground deals?',
            overRideLeaveConversation = 'I\'ll be back for sure, but gotta go now.',
            buttons = {
                {
                    label = 'Show me the goods, I’m ready to deal!',
                    onSelect = function()
                        openDonorMarket()
                    end,
                },
            },
        }
    })
end

CreateThread(function()
    for _, location in ipairs(getMarketLocations()) do
        createBlackmarketPed(location)
    end
end)

local function dbgPurchase(stage, payload)
    if not Config.DebugStorePurchases then return end
    print(('[donor_blackmarket] %s %s'):format(stage, json.encode(payload or {})))
end

RegisterNUICallback('donor_blackmarket:attemptPurchase', function(payload, cb)
    dbgPurchase('client: purchase request from NUI', payload)
    local result = lib.callback.await('donor_blackmarket:attemptPurchase', false, payload)
    dbgPurchase('client: purchase result from server', result)
    SendNUIMessage({
        action = "purchaseResult",
        data = result or { success = false, message = "Purchase failed" }
    })
    cb('ok')
end)

RegisterNUICallback('donor_blackmarket:attemptPurchaseBundle', function(payload, cb)
    dbgPurchase('client: bundle request from NUI', payload)
    local result = lib.callback.await('donor_blackmarket:attemptPurchaseBundle', false, payload)
    dbgPurchase('client: bundle result from server', result)
    SendNUIMessage({
        action = "purchaseResult",
        data = result or { success = false, message = "Purchase failed" }
    })
    cb('ok')
end)

RegisterNUICallback('hideUI', function(payload, cb)
    SetNuiFocus(false, false)
    openState = false
    cb('ok')

    -- batch delivery: cartable items queued while browsing are checked out in
    -- ONE server transaction now that the store is closed
    local cart = type(payload) == 'table' and payload.cart or nil
    if type(cart) ~= 'table' or #cart == 0 then return end

    CreateThread(function()
        dbgPurchase('client: cart checkout on close', payload)
        local result = lib.callback.await('donor_blackmarket:checkoutCart', false, {
            items = cart,
            requestId = payload.requestId,
        })
        dbgPurchase('client: cart result', result)

        if result and result.message then
            lib.notify({
                type = result.success and 'success' or 'error',
                description = result.message,
                duration = 7500,
            })
        end
    end)
end)