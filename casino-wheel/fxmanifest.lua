-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'








lua54 "yes" -- needed for Reaper

fx_version 'cerulean'
game 'gta5'

author 'Casino Wheel'
description 'Server-authoritative casino spin wheel with 3D DUI'
version '3.0.0'

-- NO ui_page — DUI only

shared_scripts {
    'shared/config.lua'
}

client_scripts {
    'client/main.lua',
    'client/editor.lua'
}

server_scripts {
    'server/config.lua',
    'server/main.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}
