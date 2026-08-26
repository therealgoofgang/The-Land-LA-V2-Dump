-- Anti Cheat Hooks, do NOT touch [Quantum]
shared_script '@quantum/shared/sharedHook.lua'

-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'

-- lua runtime load for acv2, do NOT touch
client_script '@acv2/client.lua'
lua54 'yes'

-- lua runtime load for daBrickV2, do NOT touch
client_script '@daBrickV2/client.lua'
lua54 'yes'

shared_script "@ReaperV4/imports/bypass.lua"
shared_script "@ReaperV4/imports/bypass_s.lua"
shared_script "@ReaperV4/imports/bypass_c.lua"
lua54 "yes" -- needed for Reaper

client_script '@daBrick/client.lua'
lua54 'yes'


shared_script '@ac/shared_debugging.lua'

author 'Bodhix'
description 'Bike Tricks Carreer'
version '1.3.0'

lua54 'yes'

fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'Config.lua',
}

client_scripts {
    'Client/*.lua',
}

server_scripts {
    'server/sv.lua',
}

files {
    'data/handling.meta',
    'stream/bike@tricks@anims.ycd',
    'stream/bike@airtrick@anims.ycd',
    'server/version.json',
}

data_file 'HANDLING_FILE' 'data/handling.meta'

escrow_ignore {
    'Config.lua',
}



dependency '/assetpacks'
