fx_version 'cerulean'
game 'gta5'
author 'kiiya'
description 'Bolingbroke Prison'
version '1.0.0'
lua54 'yes'
this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' 'kiiya_timecycle.xml'

files {
  'prison_game.dat151.rel',
  'kiiya_timecycle.xml',
}


data_file 'AUDIO_GAMEDATA' 'prison_game.dat'

escrow_ignore {
  'stream/prison_exterior/**.ydr',
  'stream/prison_exterior/**.ydd',
  'stream/prison_interior/ydr/unlocked/**.ydr',
    }

dependency '/assetpacks'