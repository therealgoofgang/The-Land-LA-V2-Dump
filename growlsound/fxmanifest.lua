-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper






fx_version 'cerulean'
game 'gta5'
lua54 'yes'
files {
    'html/ui.html',
    'html/sounds/stomach_growl.ogg'
}

ui_page 'html/ui.html'

client_scripts {
    'config.lua',
    'client/hunger_thirst_alert.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}


escrow_ignore {
    'config.lua'
  }
