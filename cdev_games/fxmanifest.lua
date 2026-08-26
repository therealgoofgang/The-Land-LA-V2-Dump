-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper






fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
ui_page 'html/index.html'

author 'cDev Development Team'
description 'Interactive games like spin the bottle'
version '1.1.4'

shared_script {
  'config.lua',
}

client_script {
  -- Escrowed scripts
  'client/utils.lua',
  'client/modules/**',
  'client/init.lua',
  'client/callbacks.lua',
  -- Public scripts
  'data/languages/*.lua',
}
server_script {
  -- Dependencies
  '@cdev_lib/shared/external.lua',
  -- Escrowed scripts
  'server/**.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/cdev_games.ytyp'

files {
  'html/**'
}

escrow_ignore {
  'config.lua',
  'data/languages/*.lua'
}

dependencies {
  '/server:4752',
  'cdev_lib',
}

dependency '/assetpacks'
