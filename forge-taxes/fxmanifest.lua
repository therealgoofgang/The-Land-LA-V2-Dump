-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'







version '2.9.0'
author 'Code-Forge'
description 'Advanced Taxes System'




lua54 "yes" -- needed for Reaper


fx_version 'cerulean'
game 'gta5'
lua54 'yes'

ui_page 'html/index.html'

shared_scripts {
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

server_script '@oxmysql/lib/MySQL.lua'

files {
	'html/index.html',
    'html/js/*.js',
    'html/css/*.css',
    'html/css/*.scss',
    'html/assets/images/*.png'
}

escrow_ignore {
    'shared/config.lua',
    'client/open.lua',
    'server/open.lua'
}

file 'data.json'
dependency '/assetpacks'