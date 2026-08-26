-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'








lua54 "yes" -- needed for Reaper

fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'GRINDHARD KENNELS'
description 'Unified Exotic Dog Script'
version '5.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'shared/util.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

files {
    'stream/kennelzas_snap.ydr',
    'stream/zakennelsgh.ytyp',
    'stream/bzzz_doghouse_house.ydr',
    'stream/bzzz_doghouse_convert.ytyp',
    'peds.meta',
    'peds2.meta',
    'peds3.meta',
    'pedstan.meta',
    'pedswh.meta',
    'pedsbr.meta'
}

data_file 'DLC_ITYP_REQUEST' 'stream/zakennelsgh.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_doghouse_convert.ytyp'
data_file 'PED_METADATA_FILE' 'peds.meta'
data_file 'PED_METADATA_FILE' 'peds2.meta'
data_file 'PED_METADATA_FILE' 'peds3.meta'
data_file 'PED_METADATA_FILE' 'pedstan.meta'
data_file 'PED_METADATA_FILE' 'pedswh.meta'
data_file 'PED_METADATA_FILE' 'pedsbr.meta'

dependencies {
    'es_extended',
    'ox_lib',
    'ox_target',
    'oxmysql'
}
