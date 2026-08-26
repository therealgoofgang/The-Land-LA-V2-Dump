-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

-- Anti Cheat Hooks, do NOT touch [Quantum]




-- resource bypass & lua runtime load for anti-cheat, do NOT touch
shared_script '@internalac/bypass.lua'
lua54 'yes'




lua54 "yes" -- needed for Reaper


fx_version 'cerulean'

game 'gta5'
version '1.1.5'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

ui_page 'html/index.html'

files {
    'html/**'
}

-- Uses the 'Ghost' ped model, which is only registered (via PED_METADATA_FILE) by crn_ui_svdden.
dependency 'crn_ui_svdden'
