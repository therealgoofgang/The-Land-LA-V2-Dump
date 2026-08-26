-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper

fx_version   'cerulean'
game         'gta5'
lua54        'true'

author         'Forcng'
description 'discord.gg/forcng'
version      '1.0'

client_scripts {
  'client/*.lua'
}

shared_scripts{
  '@ox_lib/init.lua',
  'config/config.lua'
}

server_scripts {
  'server/*.lua',
  '@oxmysql/lib/MySQL.lua',
}

escrow_ignore {
  'config/config.lua'
}
dependency '/assetpacks'
