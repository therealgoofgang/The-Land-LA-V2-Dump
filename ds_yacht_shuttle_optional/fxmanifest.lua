-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

fx_version 'cerulean'
game 'gta5'

author 'DarlingStore'
description 'Standalone yacht shuttle with an NPC captain'
version '1.2.0'

lua54 'yes'

ui_page 'html/prompt.html'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

files {
    'html/prompt.html',
    'html/prompt.css',
    'html/prompt.js'
}

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'