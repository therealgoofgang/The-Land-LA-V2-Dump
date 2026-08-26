-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'






fx_version 'cerulean'
game 'gta5'
author 'HG_Designs'
description 'HG_WeedShop'
version '2.0'
lua54 'yes'
this_is_a_map 'yes'

client_script 'hg_weedshop_entityset.lua'

escrow_ignore {
    'hg_weedshop_entityset.lua',
    'stream/vanilla/**'
}
dependency '/assetpacks'