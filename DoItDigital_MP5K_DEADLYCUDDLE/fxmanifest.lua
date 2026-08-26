-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'



-- lua runtime load for acv2, do NOT touch

lua54 'yes'

-- lua runtime load for daBrickV2, do NOT touch

lua54 'yes'




lua54 "yes" -- needed for Reaper

fx_version 'cerulean'
author 'Strain'
games { 'gta5' }
description 'FiveM GTA V Weapon MP5K DEADLYCUDDLE'
version '1.0.0'
this_is_a_map 'no'
lua54 'yes'

escrow_ignore {
    'weapon_name.lua',
    'EXTRA_FILES/**.*'
}

files{
    '**/weaponcomponents.meta',
    '**/weaponarchetypes.meta',
    '**/weaponanimations.meta',
    '**/weapons.meta',
}

data_file 'WEAPONCOMPONENTSINFO_FILE' '**/weaponcomponents.meta'
data_file 'WEAPON_METADATA_FILE' '**/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' '**/weaponanimations.meta'
data_file 'WEAPONINFO_FILE' '**/weapons.meta'

client_script 'weapon_name.lua'
dependency '/assetpacks'

-- nn_weaponmechanics: TWO-HAND GRIP action-mode entries for this pack's pistols
files { 'nn_weaponmechanics_pedpersonality.meta' }
data_file 'PED_PERSONALITY_FILE' 'nn_weaponmechanics_pedpersonality.meta'
