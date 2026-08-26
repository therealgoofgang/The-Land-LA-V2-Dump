-- FX Information --
fx_version   'cerulean'
lua54        'yes'
game         'gta5'


file 'sp_manifest.ymt'

data_file 'GTXD_PARENTING_DATA' 'stream/data/gtxd.meta'
data_file 'SCENARIO_POINTS_OVERRIDE_FILE' 'sp_manifest.ymt'

data_file 'DLC_ITYP_REQUEST' 'stream/request/beverly_metadata_002_strm.ytyp'

files {
    'stream/data/gtxd.meta'
}

-- Manifest --
dependencies {
  '/server:5181',
  '/onesync'
}

dependency '/assetpacks'