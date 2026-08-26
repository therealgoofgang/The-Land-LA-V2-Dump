-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'






lua54 "yes" -- needed for Reaper

fx_version 'cerulean'
game 'gta5'

name 'BodhixBall'
description 'Ultimate BasketBall Script'
author 'Bodhix'
version '2.0.1'

lua54 'yes'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua'
}

files {
    'html/index.html',
    'html/style.css', 
    'html/images/*.png', 
    'html/images/ball_png/*.png', 
    'html/images/iconos/*.png',
    'html/sounds/*.mp3',
    'html/fonts/*.ttf',
    'html/fonts/*.otf',
    'server/version.json',
}

ui_page 'html/index.html'

nui_page 'html/index.html'

data_file('DLC_ITYP_REQUEST')('stream/balls/Basketballs.ytyp')

escrow_ignore {
    'config.lua',
    'client/Store-Cl.lua',
    'server/Store-Sv.lua'
}
dependency '/assetpacks'