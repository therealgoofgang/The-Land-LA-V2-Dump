-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'








lua54 "yes" -- needed for Reaper


--[[ ====================================================================================================================================

	Project: "Enhanced Driveby Animations (EDA)"
	Copyright � 2022 Delta District (deltadistrict.com)

]]-- ====================================================================================================================================

--[[	FXMANIFEST INFO  	]]--

fx_version 'cerulean'
game 'gta5'
version '1.0.0'
lua54 'yes'

--[[	FILES TO LOAD	]]--

client_script 'config.lua'
client_script 'driveby.lua'

escrow_ignore {
  'config.lua',
}

dependency '/assetpacks'
