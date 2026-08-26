fx_version 'cerulean'
game 'gta5'

author 'YTYP Insert Generator'
description 'Combined YTYP and props - letters_combined'
version '1.0.0'

files {
    'stream/*.ydr',
    'stream/*.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/letters_combined.ytyp'

-- inserts/ folder contains copy-paste Lua for Nolag, Quasar, AK47 (not loaded by FiveM)

dependency '/assetpacks'