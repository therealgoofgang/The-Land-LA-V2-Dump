-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper

--[[ FX Information ]]--
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'
--[[ Resource Information ]]--
name         'fivecode_camping'
version      'v0.1.0'
description  'Script for camping.'
author       'Fivecode Scripts'
shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'usableItems.lua',
	'locales.lua',
	'locales/*.lua',
	'shared/*.lua',
}
client_scripts {
	'client/framework/*.lua',
	'client/inventory/*.lua',
	'cl_utils.lua',
	'client/*.lua',
	'modules/*.lua',
	'modules/**/client.lua',
}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/framework/*.lua',
	'server/inventory/*.lua',
	'sv_utils.lua',
	'server/*.lua',
	'modules/**/server.lua',
}
escrow_ignore {
	'config.lua',
	'usableItems.lua',
	'client/framework/*.lua',
	'client/inventory/*.lua',
	'cl_utils.lua',
	'client/menu.lua',
	'client/notify.lua',
	'client/progressBar.lua',
	'server/framework/*.lua',
	'server/inventory/*.lua',
	'sv_utils.lua',
	'locales/*.lua',
}
data_file 'DLC_ITYP_REQUEST' 'stream/fivecode_campfire.ytyp'
dependency '/assetpacks'
