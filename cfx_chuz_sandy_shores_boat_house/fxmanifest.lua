-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

fx_version 'bodacious'
game 'gta5'
this_is_a_map 'yes'
author 'Prompt Mods'
version "1.0.0"

escrow_ignore {
    'stream/unlocked/**'
}

-- scripts --
lua54 'yes'


server_scripts{
	'sv_loader.lua'
}
dependency '/assetpacks'