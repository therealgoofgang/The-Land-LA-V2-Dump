-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

fx_version 'cerulean'
game 'gta5'

author 'Aura Studio'
description 'LUMA Beach'
version '1.2.0'

lua54 'yes'

this_is_a_map 'yes'

client_script "config.lua"
client_script "client.lua"

escrow_ignore "config.lua"




-- License Notice
-- © 2024 Aura Studio. All rights reserved.
-- This product is exclusively owned by Aura Studio.
-- Redistribution, resale, or unauthorized sharing of this product is strictly prohibited.
-- Unauthorized use, modification, or distribution will result in legal action.
-- Any attempt to resell, modify, or distribute this product without explicit permission from Aura Studio will be met with DMCA takedown requests and legal actions.
dependency '/assetpacks'