-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'








lua54 "yes" -- needed for Reaper

fx_version 'cerulean'
games { 'gta5' }

author 'Theo'
description 'Labubu Crafting Resource with Shop System (crafting overhauled)'
version '1.2.0'
lua54 'yes'

dependencies {
    'ox_lib',
    'ox_inventory',
    'ox_target'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_scripts {
    'bridge/client/esx.lua',
    'bridge/client/qb.lua',
    'bridge/client/qbx.lua',
    'client/shops.lua',
    'client/delivery.lua',
    'client/sales.lua',
    'client/client.lua',
    'client/table.lua'
}

server_scripts {
    'bridge/server/esx.lua',
    'bridge/server/qb.lua',
    'bridge/server/qbx.lua',
    -- Anti-cheat validation must register BEFORE the real sale handler so its
    -- ownership check sees pre-sale inventory and it fires ahead of the payout.
    'server_hooks.lua',
    'server/shops.lua',
    'server/delivery.lua',
    'server/sales.lua',
    'server/discord.lua',
    'server/table.lua'
}

ui_page 'web/build/index.html'

files {
    'web/build/index.html',
    'web/build/assets/*.js',
    'web/build/assets/*.css',
    'web/build/images/*.png',
    'web/build/crafting/*.css',
    'web/build/crafting/*.js',
    'web/build/**/*'
}

-- Our replacement crafting files (client/table.lua + server/table.lua)
-- are plaintext — keep them out of the escrow build, along with the
-- custom crafting UI files.
escrow_ignore {
    'bridge/**/*',
    'shared/**/*',
    'server/discord.lua',
    'client/table.lua',
    'server/table.lua',
    'web/build/crafting/**/*',
    'web/build/index.html'
}

data_file 'DLC_ITYP_REQUEST' 'stream/theo_labu.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/theo_remixlabu.ytyp'
dependency '/assetpacks'
