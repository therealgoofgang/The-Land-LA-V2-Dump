-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper

fx_version 'cerulean'

author 'Envi-Scripts'
description 'Envi-FoodTrucks - Mobile Restaurants'
version '1.3.3'

game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

 
client_scripts {
    'client/*.lua',
}
shared_scripts {
    '@envi-bridge/bridge.lua',
	'shared/*.lua',
}

server_scripts {
    'server/*.lua',
}

escrow_ignore {
    'shared/*.lua',
}

dependencies {
    'ox_lib',
    'envi-bridge',
    'envi-cooking-props',
}

bridge 'envi-bridge'
dependency '/assetpacks'
