-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'






lua54 "yes" -- needed for Reaper

-- resource bypass & lua runtime load for anti-cheat, do NOT touch
shared_script '@internalac/bypass.lua'
lua54 'yes'

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

version '3.0.0'
description 'Fragment Crafting + Weapon Attachments System'

dependencies {
    'ox_lib',
    'ox_inventory',
    'oxmysql',
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/**'
}
