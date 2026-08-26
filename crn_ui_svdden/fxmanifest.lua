-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

-- Anti Cheat Hooks, do NOT touch [Quantum]











lua54 "yes" -- needed for Reaper






fx_version 'cerulean'
game "gta5"
version '0.0.1'
lua54 'yes'
author 'discord.gg/svdden'

ui_page 'build/index.html'
-- ui_page 'http://localhost:3000/'

client_script {
  'client/**',
}

server_script {
  'server/sv_main.lua', -- This is the main server script that will be loaded first
  '@oxmysql/lib/MySQL.lua', 
  'server/**', -- This is the rest of the server scripts since you keep reverting my changes dumbass make sure sv_main is started first!!
}

shared_script {
  '@ox_lib/init.lua',
  'shared/config.lua',
  'shared/**',
}

files {
  'build/**',
  'stream/Ghost.ydd',
  'stream/Ghost.yft',
  'stream/Ghost.ymt',
  'stream/Ghost.ytd',
  'stream/peds.meta',
}

-- Registers the custom "Ghost" ped (donor_blackmarket's pedModel) so IsModelValid/CreatePed
-- can actually resolve it; without this the model never streams in, CreatePed times out
-- waiting for the entity and returns handle 0, and the ped never spawns.
data_file 'PED_METADATA_FILE' 'stream/peds.meta'