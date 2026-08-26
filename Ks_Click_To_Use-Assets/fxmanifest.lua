-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'

fx_version 'cerulean'
game 'gta5'
description 'Killstore assets 🎁✨🗿'
author 'Killstore'
lua54 'yes'
version '3.1.0.5'

files {
}

shared_scripts {
    'modules/**/*.lua',
    'modules_core/inventory.lua',
}
server_scripts {
    'modules_core/server.lua',
}


escrow_ignore {
    'modules/**/*.lua',
    'modules_core/inventory.lua',
}

-- Killstore eye
data_file "DLC_ITYP_REQUEST" "stream/Killstore/killstore.ytyp"

-- Labu Flower Bag
data_file "DLC_ITYP_REQUEST" "stream/Labus/Labu_Flower_Bag/ks_labu_flower_bag_00.ytyp"

-- Momo Backpack
data_file "DLC_ITYP_REQUEST" "stream/Labus/Momo_Backpack/ks_momo_backpack_00.ytyp"

-- Labu Keychain V1
data_file "DLC_ITYP_REQUEST" "stream/Labus/Labu_Keychain_V1/ks_labu_keychain_v1_00.ytyp"

-- Labu Keychain V2
data_file "DLC_ITYP_REQUEST" "stream/Labus/Labu_Keychain_V2/ks_labu_keychain_v2_00.ytyp"

-- Labus
data_file "DLC_ITYP_REQUEST" "stream/Labus/Labus/ks_labu_00.ytyp"

-- Maternity Package
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_bunnyharness_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_diaperbag_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_dogcarrier_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_doublebabycarrier_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_bearharness_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_minihandthings_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_babystroller_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_doublebabystroller_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_travelcrib_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Maternity_Package/ks_doubletravelcrib_00.ytyp"

-- Staff Sign
data_file "DLC_ITYP_REQUEST" "stream/head/Staff_Sign/ks_adminstaff.ytyp"

-- Samrio Backpacks
data_file "DLC_ITYP_REQUEST" "stream/back/Samrio_Backpacks/ks_samriobackpack_00.ytyp"

-- Sanri♡ Backpack
data_file "DLC_ITYP_REQUEST" "stream/back/Snario_Backpack/ks_snariobackpacks_.ytyp"

-- Spy Set
data_file "DLC_ITYP_REQUEST" "stream/mix/Spy_Set/ks_spystuff_01.ytyp"

-- Christmas Package
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_bearscarf.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_cathood.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_christmas_beanie.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_xmascookies.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_winterheadbands.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_xmaspets_v1.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_xmaspets_v2.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_giftbags.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_santahat_ligths.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_earmuffs.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Christmas_Package/ks_samrioearmuffs_00.ytyp"

-- Killstore 4 RP
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/ks_demons.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/angel_wings_v2.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/ks_animals_in_costume.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/ks_cat_costume.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/ks_cat_paw_bottle.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/ks_dog_bag.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/fairy_wings.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/ks_floating_mood.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/ks_magicalgirlv2_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Killstore_4_RP/ks_sanrio_ears.ytyp"

-- Spooky Package
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_samriobucket_00.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_coffinbag.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_cauldron.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_chibishw.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_witchstick_hw.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_sadghostshw.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_pumpkincat_hw.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_witchhat_hw.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_spellbook_hw.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_creatures_hw.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Spooky_Package/ks_buckethw.ytyp"


-- Beach Package
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_goggles.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_swimfloat.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_camera.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_sunhat.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_cooler.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_headflower.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_popsicles.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_sandbucket.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_summerbag.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_surfboard.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_armfloat_left.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Beach_Package/ks_armfloat_right.ytyp"

-- Winner Awards Full Package
data_file "DLC_ITYP_REQUEST" "stream/mix/Winner_Awards_Package/ks_winnerawards_01.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Winner_Awards_Package/ks_winnerawards_02.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Winner_Awards_Package/ks_winnerawards_03.ytyp"

-- Funky Toys
data_file "DLC_ITYP_REQUEST" "stream/mix/Funky_Toys/ks_funkytoy_v1.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Funky_Toys/ks_funkytoy_v2.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Funky_Toys/ks_funkytoy_v3.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Funky_Toys/ks_funkytoy_v4.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Funky_Toys/ks_funkytoy_v5.ytyp"

-- Fnko Pack
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/ksfu_5.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/ksfu_4.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/ks-funkosv3.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/ks-funkos2.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/funkokuromi.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/kittyland.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/pusheen.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/pushenicorn.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Fnko_Pack/pushmermaid.ytyp"

-- Valocats
data_file "DLC_ITYP_REQUEST" "stream/mix/Valocats/ks_valocats_00.ytyp"

-- Valorant
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_yoru.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_viper.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_sova.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_sage.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_reyna.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_raze.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_phoenix.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_killjoy.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_jett.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Valo_Agents/ks_cypher.ytyp"

-- Samrio Friends
data_file "DLC_ITYP_REQUEST" "stream/mix/Samrio_Friends/ks_samriofriends_00.ytyp"

-- Sanri♡ Friends
data_file "DLC_ITYP_REQUEST" "stream/mix/Snario_Friends/cinnamorollks.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Snario_Friends/hellokittyks.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Snario_Friends/keropiks.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Snario_Friends/kuromiks.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Snario_Friends/melodyks.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Snario_Friends/pompompuriks.ytyp"

-- Gifts Package V2
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_Basket_With_Teddy_Bears/canastaoso-g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_Basket_With_Teddy_Bears/canastaoso-r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_Basket_With_Teddy_Bears/canastaoso-ro.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Balloons/babe_party_ballons.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Balloons/doll_party_ballons.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Balloons/lover_party_balloons.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Balloons/queen_party_ballons.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Balloons/valentines_ballons2_drv.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_In_A_Box/ludboxb.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_In_A_Box/ludboxbl.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_In_A_Box/ludboxhp.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_In_A_Box/ludboxp.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_In_A_Box/ludboxr.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Giant_Teddy_Bear_With_Balloons/osoconglobo.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Giant_Teddy_Bear_With_Balloons/osoconglobo-d.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Giant_Teddy_Bear_With_Balloons/osoconglobo-r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_And_Money/ramobilletes-n.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_And_Money/ramobilletes-r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_And_Money/ramobilletes-ro.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Roses_And_Money/ramobilletes-rp.ytyp"

-- Gifts Package V1
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Combo_Gift_Box/ks_combovalentine.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Teddy_Bear_Box/osocaja-azu.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Teddy_Bear_Box/osocaja-roj.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Teddy_Bear_Box/osocaja-ros.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Giant_Teddy_Bear/osogrande-b.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Giant_Teddy_Bear/osogrande-c.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Giant_Teddy_Bear/osogrande-g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Shaped_Roses_In_A_Box/ks_ramobox.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Shaped_Roses_In_A_Box/ks_ramobox_g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Shaped_Roses_In_A_Box/ks_ramobox_hp.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Shaped_Roses_In_A_Box/ks_ramobox_r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Shaped_Roses_In_A_Box/ks_ramobox_rb.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Heart_Shaped_Roses_In_A_Box/ks_ramobox_w.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Gifts_Package/Strawberries_Bouquet/ramochocolate.ytyp"

-- Magical Girl Set
data_file "DLC_ITYP_REQUEST" "stream/mix/Magical_Girl_Set/ks_magicalgirl_00.ytyp"

-- Sakura Card Captor Set
data_file "DLC_ITYP_REQUEST" "stream/mix/Sakura_Card_Captor_Set/birdstaff.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Sakura_Card_Captor_Set/cardbook.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Sakura_Card_Captor_Set/kero.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Sakura_Card_Captor_Set/magicstaff.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Sakura_Card_Captor_Set/circle_sakura.ytyp"

-- Magic Circle
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Magic_Circle/circleyellow.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Magic_Circle/circlered.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Magic_Circle/circlegreen.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Magic_Circle/circleblue.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Magic_Circle/circleyingyang.ytyp"

-- Food Fanny Pack
data_file "DLC_ITYP_REQUEST" "stream/back/Food_Fanny_Pack/banana.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Food_Fanny_Pack/cacahuate.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Food_Fanny_Pack/chicharo.ytyp"

-- Shiba Backpack
data_file "DLC_ITYP_REQUEST" "stream/back/Shiba_Backpack/ks_shibabackpack_00.ytyp"

-- Game Backpack
data_file "DLC_ITYP_REQUEST" "stream/back/Game_Backpack/ks_gamebackpack_00.ytyp"

-- Kitsune Mask
data_file "DLC_ITYP_REQUEST" "stream/head/Kitsune_Mask/kitsune-g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Kitsune_Mask/kitsune-p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Kitsune_Mask/kitsune-r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Kitsune_Mask/kitsune-v.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Kitsune_Mask/kitsuneside-g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Kitsune_Mask/kitsuneside-p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Kitsune_Mask/kitsuneside-r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Kitsune_Mask/kitsuneside-v.ytyp"

-- Power-Up Hats
data_file "DLC_ITYP_REQUEST" "stream/head/Power-Up_Hats/ks_poweruphat_00.ytyp"

-- Mario Hats
data_file "DLC_ITYP_REQUEST" "stream/head/Mario_Hats/daisy.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Mario_Hats/mario-y.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Mario_Hats/mario-r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Mario_Hats/mario-p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Mario_Hats/mario-g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Mario_Hats/peach.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Mario_Hats/toad.ytyp"

-- Milk Bag
data_file "DLC_ITYP_REQUEST" "stream/back/Milk_Bag/millk-b.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Milk_Bag/millk-be.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Milk_Bag/millk-p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Milk_Bag/millk-pu.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Milk_Bag/millk-r.ytyp"

-- Virtual Pet
data_file "DLC_ITYP_REQUEST" "stream/back/Virtual_Pet/ks_virtualpet_00.ytyp"

-- Pocketmon
data_file "DLC_ITYP_REQUEST" "stream/mix/Pocketmon/ks_pocketmon.ytyp"

-- Pokemon
data_file "DLC_ITYP_REQUEST" "stream/mix/Pokemon/bulbasaur.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Pokemon/charmander.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Pokemon/jigglypuff.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Pokemon/pikachu.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Pokemon/squirtle.ytyp"

-- Gigavice
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Gigavice/ks_gigavice_00.ytyp"

-- Digivice
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-ro.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-o.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-l.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-f.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-b1.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Digivice/digivice-b.ytyp"

-- Gigamon
data_file "DLC_ITYP_REQUEST" "stream/mix/Gigamon/ks_gigamon.ytyp"

-- Digimon
data_file "DLC_ITYP_REQUEST" "stream/mix/Digimon/veemon.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Digimon/tanemon.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Digimon/patamon.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Digimon/lopmon.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Digimon/biyomon.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/mix/Digimon/agumon.ytyp"

-- Teddy Bear Bag
data_file "DLC_ITYP_REQUEST" "stream/back/Teddy_Bear_Bag/bearbag-1.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Teddy_Bear_Bag/bearbag-2.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Teddy_Bear_Bag/bearbag-3.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Teddy_Bear_Bag/bearbag-4.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Teddy_Bear_Bag/bearbag-5.ytyp"

-- Angel Heart Backpack
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Heart_Backpack/angelheart-v.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Heart_Backpack/angelheart-ro.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Heart_Backpack/angelheart-r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Heart_Backpack/angelheart-ne.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Heart_Backpack/angelheart-n.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Heart_Backpack/angelheart-m.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Heart_Backpack/angelheart-az.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Heart_Backpack/angelheart-a.ytyp"

-- Pocketball
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pocketball/ks_pocketball_00.ytyp"

-- Pokeball
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pokeball/Greatball.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pokeball/Healball.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pokeball/Loveball.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pokeball/Masterball.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pokeball/Pokeball.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pokeball/Premierball.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pokeball/Safariball.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pelvis/Pokeball/Ultraball.ytyp"

-- Angel Wings
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Wings/Angelwings-y.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Wings/Angelwings-w.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Wings/Angelwings-p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Wings/Angelwings-c.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Angel_Wings/Angelwings-b.ytyp"

--BetweenUs
data_file "DLC_ITYP_REQUEST" "stream/back/Between_Us_Backpack/ks_betweenus_00.ytyp"

-- Among Us Backpack
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_l.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_b.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_c.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_o.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_w.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Among_Us_Backpack/among_us_y.ytyp"

-- Angel Halo
data_file "DLC_ITYP_REQUEST" "stream/head/Angel_Halo/halo_b.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Angel_Halo/halo_c.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Angel_Halo/halo_r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Angel_Halo/halo_w.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Angel_Halo/halo_y.ytyp"

-- Devil Wings
data_file "DLC_ITYP_REQUEST" "stream/back/Devil_Wings/batwings_b.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Devil_Wings/batwings_p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Devil_Wings/batwings_pk.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Devil_Wings/batwings_r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Devil_Wings/batwings_w.ytyp"

-- Corgi Backpack
data_file "DLC_ITYP_REQUEST" "stream/back/Corgi_Backpack/corgi_b.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Corgi_Backpack/corgi_c.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Corgi_Backpack/corgi_g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Corgi_Backpack/corgi_gd.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Corgi_Backpack/corgi_p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/back/Corgi_Backpack/corgi_r.ytyp"

--Samrio Headband
data_file "DLC_ITYP_REQUEST" "stream/head/Samrio_Headband/ks_samrioheadband_00.ytyp"

-- My Mel♡dy and Kur♡mi Ears
data_file "DLC_ITYP_REQUEST" "stream/head/My_Melody_And_Kuromi_Ears/kuromiears.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/My_Melody_And_Kuromi_Ears/melodyEars.ytyp"

-- Cat Headset
data_file "DLC_ITYP_REQUEST" "stream/head/Cat_Headset/headsetGato_b.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Cat_Headset/headsetGato_gn.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Cat_Headset/headsetGato_p.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Cat_Headset/headsetGato_pk.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Cat_Headset/headsetGato_r.ytyp"

-- Prismorb
data_file "DLC_ITYP_REQUEST" "stream/head/Prismorb/ks_prismorb_00.ytyp"

-- Plumbob
data_file "DLC_ITYP_REQUEST" "stream/head/Plumbob/plumbob_g.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Plumbob/plumbob_o.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Plumbob/plumbob_r.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/head/Plumbob/plumbob_y.ytyp"




data_file "DLC_ITYP_REQUEST" "stream/Ks_Mystic_Spells/ks_mysticspells_props.ytyp"

dependency '/assetpacks'