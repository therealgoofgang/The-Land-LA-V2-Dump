-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper






fx_version 'cerulean'
game "gta5"
version '0.0.1'
lua54 'yes'

client_script {
  'client/**',
}

server_script {
  '@oxmysql/lib/MySQL.lua', 
  'server/**',
}

shared_scripts {
	'@ox_lib/init.lua',
  'shared/vapeData.lua',
  'shared/**'
}

data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_five_black.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_five_blue.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_five_brown.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_five_green.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_five_grey.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_one_yellow.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_five_purple.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_four_black.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_four_blue.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_four_grey.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_four_mint.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_four_white.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_four_yellow.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_one_blue.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_one_bluepink.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_one_redgreen.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_one_yellow.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_one_yellowpink.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_three_mint.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_three_orange.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_three_yellow.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_two_blue.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_two_green.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_two_grey.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_two_pink.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_two_red.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brum_disvape_two_yellow.ytyp'
