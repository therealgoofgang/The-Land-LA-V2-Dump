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
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispace_simplefp1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispace_simplefp2.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kawaiispace_simplefp3.ytyp'
client_scripts {
    'client.lua'
}
dependency '/assetpacks'
dependency '/assetpacks-redm'
