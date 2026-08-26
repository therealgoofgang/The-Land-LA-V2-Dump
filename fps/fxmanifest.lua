-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

fx_version "cerulean"
game "gta5"
lua54 "yes"

ui_page "web/index.html"

client_scripts {
	"client/config.lua",
	"client/client.lua",
}

files {
	"web/index.html",
	"web/app.js",
	"web/style.css",
}
