-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper






fx_version 'bodacious'
game 'gta5'

author 'Randolio'

shared_scripts {
    '@ox_lib/init.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'bridge/server/**.lua',
    'sv_dropped.lua',
    'sv_config.lua',
}

client_scripts {
    'bridge/client/**.lua',
    'cl_dropped.lua',
}

lua54 'yes'
