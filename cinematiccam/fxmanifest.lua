-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper






--------------------------------------------------
---- CINEMATIC CAM FOR FIVEM MADE BY KIMINAZE ----
--------------------------------------------------

fx_version "cerulean"
games { "gta5" }
author "Kiminaze - Kiminaze`s Script Gems"


client_scripts {
	"@NativeUI/NativeUI.lua", -- Please check that your NativeUI script file is named like this!
	"client/language.lua",
	"localization/*.lua", -- This will load all localization files, no need to add them.
	"config.lua",
	"client/cameraFilter.lua",
	"client/client.lua"
}


server_scripts {
	"server/permission.lua"
}

dependency "NativeUI"
