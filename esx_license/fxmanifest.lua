-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'






lua54 "yes" -- needed for Reaper

fx_version 'adamant'

game 'gta5'

description 'Handles for logic for player licenses, such as: Driving License, gun license and more'
lua54 'yes'
version '1.0'
legacyversion '1.13.4'

server_scripts {
	'@es_extended/imports.lua',
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}
