-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'



-- lua runtime load for perfume-reader, do NOT touch
client_script '@perfume-reader/client.lua'
lua54 'yes'


--
--
--
lua54 "yes" -- needed for Reaper

fx_version 'bodacious'
games { 'rdr3', 'gta5' }
lua54 'yes'
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispace_fp1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispace_furniturepack2.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispace_furniturepack7.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispace_furniturepack6.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispcae_furniturepackaddon.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispace_furniturepackxp.ytyp'
client_scripts {
    'client.lua'
}
escrow_ignore {
    'client.lua'
}
dependency '/assetpacks'
