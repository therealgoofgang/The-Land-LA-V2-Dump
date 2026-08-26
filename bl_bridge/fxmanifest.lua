-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

-- Anti Cheat Hooks, do NOT touch [Quantum]











lua54 "yes" -- needed for Reaper





fx_version "cerulean"
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
version '1.3.1'

dependencies {
  '/onesync',
}

shared_scripts {
  'require.lua',
  'init.lua',
}

files {
  'utils.lua',
  'client/**/*.lua',
  'imports/client.lua',
}
