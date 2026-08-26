-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'





fx_version 'cerulean'
game 'gta5'

author 'BigoZ'
description 'Mapdata'
version '1.0.0'
contact 'https://discord.gg/fyF9UFKPZj'

this_is_a_map 'yes'
lua54 'yes'

server_script 'bigoz_mapdata_versioncheck.lua'

client_script 'bigoz_entitysets.lua'

data_file 'DLC_ITYP_REQUEST' 'stream/bigoz-props/bigoz_general_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bigoz-props/christmas/bigoz_xmas_props.ytyp'
-- data_file 'DLC_ITYP_REQUEST' 'stream/bigoz-props/easter/bigoz_easter_props.ytyp'
-- data_file 'DLC_ITYP_REQUEST' 'stream/bigoz-props/halloween/bigoz_halloween_props.ytyp'

escrow_ignore {
    'stream/**/*.ytd',
    'bigoz_entitysets.lua'
}
dependency '/assetpacks'