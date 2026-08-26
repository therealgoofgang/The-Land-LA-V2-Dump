-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper






fx_version 'cerulean'

game "gta5"

lua54 'yes'

ui_page 'build/index.html'
-- ui_page 'http://localhost:3000/' --for dev

shared_script {
    '@ox_lib/init.lua',
    'shared/*.lua',
}

client_script {
    'client/*.lua',
}

files {
    'build/**',
    'client/modules/*lua',
    'shared/modules/*lua',
}
