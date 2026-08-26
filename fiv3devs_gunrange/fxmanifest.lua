fx_version 'cerulean'
game 'gta5'
this_is_a_map 'yes'
author 'Fiv3Devs'
version '1.1.6'
lua54 'yes'

-- ui_page 'html/index.html'

-- files {
-- 	'html/index.html',
--     'html/challenge_tv.html',
--     'html/challenge_tv.css',
--     -- PERF: 'stream/poligono.ytd' rimosso da qui (era ~188 KB scaricati DUE volte da ogni
--     -- client). I file dentro stream/ sono gia' registrati automaticamente nello streamer del
--     -- gioco: e' cosi' che RequestStreamedTextureDict('poligono') li trova. Elencarli anche in
--     -- files{} li pubblica in piu' sul file-server NUI, dove pero' nessuno li richiede.
--     -- PERF: le due immagini di sfondo sono in WebP lossless invece che PNG.
--     -- Alpha bit-identico e pixel visibili identici (verificato pixel per pixel):
--     -- tablethome 1011 -> 647 KB, 5d_elevator_panel 134 -> 71 KB = -427 KB per client.
--     'tablethome.webp',
-- 	'nui/5d_elevator.mp3',
-- 	'nui/5d_elevator_panel.webp'
-- }

-- shared_scripts {
--     'config.lua'
-- }

-- client_scripts {
--     'client.lua',
-- 	'client-side/main.lua'
-- }

-- server_scripts {
--     'server.lua'
-- }

-- escrow_ignore {
-- 	'config.lua'
-- }
dependency '/assetpacks'