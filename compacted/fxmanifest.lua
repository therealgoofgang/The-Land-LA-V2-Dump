-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper






fx_version 'adamant'
game 'gta5'
lua54 'yes'

client_scripts {
    'client/**.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/**.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua'
}

ui_page "index.html"

files {
    'server/blockplaytimedb.json',
    "index.html",
    "filter.svg",
}
