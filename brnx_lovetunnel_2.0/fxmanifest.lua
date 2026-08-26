fx_version 'cerulean'
game 'gta5'
lua54 'yes'

this_is_a_map "yes"

files {
    'data/**/*.meta',
    'gtxd.meta',
    'stream/*',
    'audio/lovetunnel_audiodoors_game.dat151.rel'
}

data_file 'GTXD_PARENTING_DATA' 'gtxd.meta'
data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/dlctext.meta'
data_file 'AUDIO_GAMEDATA' 'audio/lovetunnel_audiodoors_game.dat'

escrow_ignore {
    'stream/*.ytd',
    'audio/*',
}
dependency '/assetpacks'