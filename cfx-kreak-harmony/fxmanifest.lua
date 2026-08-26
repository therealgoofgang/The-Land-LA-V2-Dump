-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

fx_version "cerulean"

game "gta5"

lua54 "yes"

this_is_a_map "yes"

data_file 'DLC_ITYP_REQUEST' 'stream/v_int_24.ytyp' 
data_file 'DLC_ITYP_REQUEST' 'stream/gr_grdlc_int_02.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_corporate.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_stock.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_services.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/int_retail.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/v_kitchen.ytyp'

client_scripts {
    'client.lua'
  }

escrow_ignore {
    'stream/ydr/k_harmony_ext_textlogo.ydr',
    'stream/ydr/k_harmonylogo_base.ydr',
    'stream/ydr/k_harmonylogo_em.ydr',
    }
dependency '/assetpacks'