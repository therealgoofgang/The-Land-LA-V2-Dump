-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

fx_version "cerulean"
games { 'gta5' }

author 'Prompt Mods'
description 'Roads+Uni+Corner+Market+Dealer+Cityhall+Houses1+Marina+Boathouse'
version '1.0.0'

this_is_a_map 'yes'

escrow_ignore {
    'stream/**'
}

-- scripts --
lua54 'yes'


client_scripts {
    'client.js'
}

server_scripts{
    'sv_MapDataHandler.lua',
    'server.js'
}
