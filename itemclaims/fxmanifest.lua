-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'








lua54 "yes" -- needed for Reaper

fx_version 'cerulean'
game 'gta5'

author 'AP'

ui_page 'ui/index.html'
file 'ui/index.html'

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    '/server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    '/client/*.lua'
}