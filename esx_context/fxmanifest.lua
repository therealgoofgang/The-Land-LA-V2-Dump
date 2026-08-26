-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

-- Anti Cheat Hooks, do NOT touch [Quantum]











lua54 "yes" -- needed for Reaper






fx_version 'bodacious'

game 'gta5'
author 'ESX-Framework & Brayden'
description 'A simplistic context menu for ESX.'
lua54 'yes'
version '1.10.7'

ui_page 'index.html'

shared_script '@es_extended/imports.lua'

client_scripts {
    'config.lua',
    'main.lua',
}

files {
    'index.html'
}

dependencies {
    'es_extended'
}
