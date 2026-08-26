lua54 'yes'

fx_version 'cerulean'
game 'gta5'

this_is_a_map 'yes'

files {
    'stream/k4_starter_pack.ytyp',
    'stream/starter_shells_k4mb1.ytyp',
}

-- Register both typ packs (furnished / extra shells live in starter_shells_k4mb1.ytyp)
data_file 'DLC_ITYP_REQUEST' 'stream/k4_starter_pack.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/starter_shells_k4mb1.ytyp'


dependency '/assetpacks'