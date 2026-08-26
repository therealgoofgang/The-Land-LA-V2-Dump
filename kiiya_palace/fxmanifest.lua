-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'





fx_version 'bodacious'
game 'gta5'
description 'The Palace: Nightclub'

this_is_a_map 'yes'
lua54 'yes'

data_file 'TIMECYCLEMOD_FILE' 'kiiya_lust.xml'

files {
  'nc_game.dat151.rel',
  'kiiya_lust.xml',
}

client_scripts {
  'client.lua',
}

data_file 'AUDIO_GAMEDATA' 'nc_game.dat'

escrow_ignore {
  'stream/ydr/ba_hw1_02_graffiti.ydr',
  'stream/ydr/hw1_02_bld3x.ydr',
  'stream/ydr/hw1_02_grnd1.ydr',
  'stream/ydr/kiiya_nc_prop_palace_logo_entry_emm.ydr',
  'stream/ydr/kiiya_nc_prop_palace_logo_entry.ydr',
  'stream/ydr/kiiya_nc_prop_palace_logo_bar_2_emm.ydr',
  'stream/ydr/kiiya_nc_prop_palace_logo_bar_2.ydr',
  'stream/ydr/kiiya_nc_prop_palace_logo_bar_1_emm.ydr',
  'stream/ydr/kiiya_nc_prop_palace_logo_bar_1.ydr',
  }

dependency '/assetpacks'