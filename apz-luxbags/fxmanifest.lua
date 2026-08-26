-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'




lua54 "yes" -- needed for Reaper





fx_version 'cerulean'






game 'gta5'

client_scripts {
    'client/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server/*.lua'
}

data_file 'DLC_ITYP_REQUEST' 'stream/monroesbags.ytyp'
