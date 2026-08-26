-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper






fx_version 'cerulean'
game "gta5"
version '0.0.1'
lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
  'shared/config.lua',
}

client_script {
  'client/**',
}

server_script {
  '@oxmysql/lib/MySQL.lua', 
  'server/**',
}
