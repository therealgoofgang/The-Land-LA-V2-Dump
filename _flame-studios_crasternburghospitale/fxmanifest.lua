fx_version 'cerulean'
game 'gta5'
this_is_a_map 'yes'

version '1.3'
author 'Flame Studios - https://flame-studios.tebex.io/'
description 'Flame - Crastenburg Hospital'

files {
    'audio/2067762180.ymt',
    'audio/c_hospital.dat151.rel',
}

data_file 'AUDIO_GAMEDATA' 'audio/c_hospital.dat'

data_file 'DLC_IYTP_REQUEST' 'stream/int_retail.ytyp'
data_file 'DLC_IYTP_REQUEST' 'stream/int_residential.ytyp'
data_file 'DLC_IYTP_REQUEST' 'stream/v_int_53.ytyp'

escrow_ignore 'stream/EDITABLE/**.ytd'
escrow_ignore 'stream/EDITABLE**.ydr'

dependency '/assetpacks'