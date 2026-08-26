-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'



fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Svdden / NullNetwork'
description 'Car Jacking job - target an NPC, find a locked vehicle, bypass it with the Autel tablet minigame, and deliver it for a reward.'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/script.js',
    'web/assets/*.png',
}

-- dependencies {
--     'ox_lib',
--     'ox_target',
-- }
