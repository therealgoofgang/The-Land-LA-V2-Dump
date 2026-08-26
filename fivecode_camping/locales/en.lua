Locales['en'] = {
    -- [[ Object Interactions ]]--
    ['interact_campfire'] = 'Interact with this campfire',
    ['interact_chair'] = 'Interact with this chair',
    ['interact_tent'] = 'Interact with this tent',
    ['interact_sleepingbag'] = 'Interact with this sleeping bag',
    ['interact_shower'] = 'Interact with this shower',
    ['interact_cooler'] = 'Interact with this cooler',
    ['interact_barrel'] = 'Interact with this barrel',

    --[[ Admin Ojects Menu ]]--
    ['admin_menu_header'] = 'Admin Object Menu',
    ['admin_menu_title'] = 'Object Id - %s',
    ['admin_menu_description'] = 'Item: %s\nDistance: %sm\nOutline: %s',
    ['admin_menu_description_codelock'] = '\nCodelock: %s',
    ['admin_menu_teleport'] = 'Teleport',
    ['admin_menu_teleport_description'] = 'Teleport to this object.',
    ['admin_menu_destroy'] = 'Destroy',
    ['admin_menu_destroy_description'] = 'Destroy this object.',
    ['admin_menu_outline'] = 'Draw Outline',
    ['admin_menu_outline_description'] = 'Draw an outline around this object for yourself.',
    ['admin_menu_outlineremove'] = 'Remove Outline',
    ['admin_menu_outlineremove_description'] = 'Remove outline from this object.',
    -- (notifications)
    ['admin_nopermissions'] = 'You don\'t have enough permissions to use this command!',

    --[[ Campfire ]]--
    ['campfire'] = 'campfire',
    ['campfire_menu_header'] = 'Campfire',
    ['campfire_menu_light'] = 'Light campfire',
    ['campfire_menu_lightup'] = 'Light up',
    ['campfire_menu_light_description'] = 'Light this campfire.',
    ['campfire_lighting'] = 'Lighting campfire...',
    ['campfire_menu_cooking'] = 'Cook',
    ['campfire_menu_cooking_description'] = 'Cook in this campfire.',
    ['campfire_menu_cooking_ingredients_description'] = 'Cooking time: %ss\n\n Ingredients Needed:\n%s',
    ['campfire_cooking'] = 'Cooking %s...',
    ['campfire_menu_destroy'] = 'Destroy',
    ['campfire_menu_destroy_description'] = 'Destroy this campfire.',
    ['campfire_destroying'] = 'Destroying campfire...',
    -- (notifications)
    ['campfire_full'] = 'This campfire is full!',
    ['campfire_playeralreadylighting'] = 'Someone is already lighting up this campfire!',
    ['campfire_somebodycooking'] = 'You cannot destroy a campfire somebody is cooking on!',
    ['campfire_noitem'] = 'You don\'t have the right item to light this campfire with!',

    --[[ Camping Chair ]]--
    ['chair'] = 'chair',
    ['chair_control_exit'] = '[E] - Exit Chair',
    ['chair_menu_header'] = 'Camping Chair',
    ['chair_menu_sitdown'] = 'Sit down',
    ['chair_menu_sitdown_description'] = 'Sit down on the chair.',
    -- (notifications)
    ['chair_playeralreadysitting'] = 'You cannot pick up a chair someone is sitting on!',

    --[[ Sleeping Bag ]]--
    ['sleepingbag'] = 'sleeping bag',
    ['sleepingbag_control_exit'] = '[E] - Exit Sleeping Bag',
    ['sleepingbag_menu_header'] = 'Sleeping Bag',
    ['sleepingbag_menu_laydown'] = 'Lay down',
    ['sleepingbag_menu_laydown_description'] = 'Lay down on this sleeping bag.',
    -- (notifications)
    ['sleepingbag_somebodylayingin'] = 'You cannot pick up a sleeping bag someone is laying in!',

    --[[ Camping Shower ]]--
    ['shower'] = 'shower',
    ['shower_control_exit'] = '[E] - Exit Shower',
    ['shower_menu_header'] = 'Camping Shower',
    ['shower_menu_turnon'] = 'Turn on',
    ['shower_menu_turnon_description'] = 'Turn on this shower.',
    ['shower_menu_turnoff'] = 'Turn off',
    ['shower_menu_turnoff_description'] = 'Turn off this shower.',
    ['shower_menu_showeryourself'] = 'Shower',
    ['shower_menu_showeryourself_description'] = 'Take a shower and clean yourself.',
    -- (notifications)
    ['shower_turnedon'] = 'You cannot pick up a shower that is turned on!',
    ['shower_full'] = 'There is no space for you in this shower!',
    ['shower_toofar'] = 'You are too far away from the shower!',
    ['shower_somebodyshowering'] = 'You cannot turn off a shower somebody is showering with!',

    --[[ Camping Tent ]]--
    ['tent_controls'] = '[E] - Exit Tent, [G] - Open Stash',
    ['tent'] = 'tent',
    ['tent_menu_header'] = 'Camping Tent',
    ['tent_menu_getinside'] = 'Get inside',
    ['tent_menu_getinside_description'] = 'Get inside this tent.',
    -- (notifications)
    ['tent_full'] = 'This tent is full!',
    ['tent_somebodyin'] = 'You cannot pick up a tent someone is in!',

    --[[ Camping Cooler ]]--
    ['cooler'] = 'cooler',
    ['cooler_menu_header'] = 'Camping Cooler',
    ['cooler_menu_open'] = 'Open',
    ['cooler_menu_open_description'] = 'Open this cooler.',

    --[[ Camping Beer Barrel ]]--
    ['beerbarrel'] = 'beer barrel',
    ['beerbarrel_menu_header'] = 'Camping Beer Barrel',
    ['beerbarrel_menu_fill'] = 'Fill',
    ['beerbarrel_menu_fill_description'] = 'Fill your cup with beer.',
    --[[ Camping Beer Barrel ]]--
    ['beerbarrel_donthavecup'] = 'You dont have a cup to fill!',
    ['beerbarrel_somebodyfilling'] = 'You cannout take a beer barrel somebody is filling their cup from!',
    ['beerbarrel_empty'] = 'This barrel is empty!',

    --[[ Npc Store ]]--
    ['npcstore_menu_header'] = 'Shop',
    ['npcstore_menu_description'] = 'Purchase %s for $%s.',
    ['npcstore_menu_paymentchoise'] = 'Shop - Payment Choice',
    ['npcstore_payment_no_method'] = 'No payment method available',
    ['npcstore_menu_amount'] = 'Amount to buy',
    ['npcstore_menu_bank'] = 'Bank',
    ['npcstore_menu_bank_description'] = 'Pay $%s with your bank.',
    ['npcstore_menu_cash'] = 'Cash',
    ['npcstore_menu_cash_description'] = 'Pay $%s with your cash.',
    ['npcstore_menu_confirm'] = 'Confirm your purchase of $%s',
    ['npcstore_menu_confirm_description'] = 'Payment: %s. \n Basket: %s - %sx.',
    ['npcstore_menu_purchase_title'] = 'Shop - %s',
    -- (notifications)
    ['npcstore_amount_too_low'] = 'Amount needs to be more than 0!',
    ['npcstore_purchased'] = 'You just purchased %s(%sx) for $%s.',
    ['npcstore_npcenough'] = 'You dont have enough money, you are missing $%s.',

    --[[ Codelock ]]--
    ['codelock_menu_lock'] = 'Add codelock',
    ['codelock_menu_lock_description'] = 'Add codelock.',
    ['codelock_menu_unlock'] = 'Remove codelock',
    ['codelock_menu_unlock_description'] = 'Remove codelock.',
    ['codelock_menu_locked'] = ' - (locked)',
    ['codelock_menu_unlocked'] = ' - (unlocked)',
    ['codelock_menu_add_lock'] = 'Add codelock',
    ['codelock_menu_add_lock_description'] = 'Code',
    ['codelock_menu_remove_lock'] = 'Unlock Codelock',
    ['codelock_menu_remove_lock_description'] = 'Code',
    -- (notifications)
    ['codelock_menu_wrong_code'] = 'Wrong code!',
    ['codelock_menu_pick_locked'] = 'You cannot pick up a locked tent!',
    ['codelock_menu_4digits'] = 'Number must have 4 digits!',
    ['codelock_menu_already_locked'] = 'This tent already has a codelock!',
    ['codelock_menu_already_unlocked'] = 'This tent does not have a codelock!',
    ['codelock_menu_not_ablt_to_lock'] = 'You are not able to lock this tent!',
    ['codelock_menu_no_codelock'] = 'You dont have a code lock!',

    --[[ Usable Food Items ]]--
    ['usableitem_progressbar_eating'] = 'Eating',
    ['usableitem_progressbar_drinking'] = 'Drinking',

    --[[ Discord Logs ]]--
    ['discord_logs_player_name'] = 'Player Name:',
    ['discord_logs_player_discord'] = 'Player Discord:',
    ['discord_logs_player_char'] = 'Player Char:',
        -- Npc shop
    ['discord_logs_supply_shop'] = 'Npc shop purchase',
    ['discord_logs_supply_shop_desc'] = 'Item: **%s** \n Amount: **%s** \n Price **$%s** \n Payment type: **%s**',
        -- Admin menu
    ['discord_logs_admin_menu_destroyed'] = 'Destroyed object',
    ['discord_logs_admin_menu_destroyed_desc'] = 'Admin destroyed an object(**#%s**).',
    ['discord_logs_admin_menu_teleport'] = 'Object teleport',
    ['discord_logs_admin_menu_teleport_desc'] = 'Admin teleported to an object(**#%s**).',
        -- Locks
    ['discord_logs_locks_used'] = 'Player used a codelock',
    ['discord_logs_locks_used_desc'] = 'Player used a codelock on an object(**#%s**).',
    ['discord_logs_locks_removed'] = 'Player removed a codelock',
    ['discord_logs_locks_removed_desc'] = 'Player removed a codelock on an object(**#%s**).',

    --[[ Other ]]--
    ['pickup'] = 'Pick up',
    ['pickup_description'] = 'Pick up this %s.',
    ['pickingobject'] = 'Picking up %s...',
    ['placingobject'] = 'Placing %s...',
    ['fillingbeercup'] = 'Filling cup...',
    ['objectpacing_controls'] = '[E] - Place object, [SCROLLPRESS] - Cancel, [SCROLLUP/SCROLLDOWN] - Rotate',
    -- (notifications)
    ['cannottake'] = 'You cannot take this item.',
    ['missingitem'] = 'You are missing: %s.',
    ['itembroke'] = 'Your item broke!',
    ['donthaveitem'] = 'You don\'t have the selected item.',
    ['actioncanceled'] = 'Action was canceled!',
    ['itemcannotbeplaced'] = 'Item cannot be placed here!',
    ['cannotwhileinvehicle'] = 'You cannot do this while you are in a vehicle!',
    ['player_busy'] = 'You cannot do this right now!',
    ['occupied'] = 'This %s is occupied!',
    ['blacklistedzone'] = 'You are not allowed to place objects in your current location!',
}