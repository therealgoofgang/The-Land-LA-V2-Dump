-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'





fx_version 'cerulean'
game 'gta5'

author 'BigoZ'
description 'HighNotes'
version '1.0.4'
contact 'https://discord.gg/fyF9UFKPZj'

this_is_a_map 'yes'
lua54 'yes'

dependencies { 
    '/gameBuild:2545',  -- ⚠️ Requires at least GAME build 2545.
    'cfx-bigoz-mapdata'
}

server_script 'bigoz_highnotes_versioncheck.lua'

client_scripts {
    'bigoz_highnotes_elevator.lua',
    'musicrooftop.lua',
    'client.lua',
    'common.lua'
}

file 'sp_manifest.ymt'

data_file 'SCENARIO_POINTS_OVERRIDE_FILE' 'sp_manifest.ymt'
data_file 'DLC_ITYP_REQUEST' 'stream/bigoz_rooftop_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vanilla/int_services.ytyp'

escrow_ignore {
    'stream/[logos]/*.ydr',
    'stream/**/*.ytd'
}
dependency '/assetpacks'