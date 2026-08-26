-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper

fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name 'Envi-Bridge'
author 'Envi-Scripts'
version '0.4.0.0b'

client_scripts {
    'runtime/**/client.lua',
}

server_scripts {
    'runtime/**/server.lua',
}

files {
    '**/**/client.lua',
    '**/*.lua',
}

escrow_ignore {
    'bridge.lua',
    '**/*.lua',
}

dependency '/assetpacks'
dependency '/assetpacks'
