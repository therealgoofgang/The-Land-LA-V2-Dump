local L0_1, L1_1, L2_1, L3_1
L0_1 = GetInteriorAtCoords
L1_1 = 357.34
L2_1 = 214.29
L3_1 = 98.59
L0_1 = L0_1(L1_1, L2_1, L3_1)
L1_1 = 0
L2_1 = Citizen
L2_1 = L2_1.CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetInteriorFromEntity
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = L0_1
    if L1_2 == L2_2 then
      L1_2 = GetEntityCoords
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      L2_2 = GetClosestObjectOfType
      L3_2 = L1_2.x
      L4_2 = L1_2.y
      L5_2 = L1_2.z
      L6_2 = 30.0
      L7_2 = GetHashKey
      L8_2 = "prop_speaker_05"
      L7_2 = L7_2(L8_2)
      L8_2 = false
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
      L1_1 = L2_2
      L2_2 = DoesEntityExist
      L3_2 = L1_1
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L2_2 = LinkStaticEmitterToEntity
        L3_2 = "se_nc_01"
        L4_2 = L1_1
        L2_2(L3_2, L4_2)
        L2_2 = SetEmitterRadioStation
        L3_2 = "se_nc_01"
        L4_2 = "radio_22_dlc_battle_mix1_radio"
        L2_2(L3_2, L4_2)
        L2_2 = SetStaticEmitterEnabled
        L3_2 = "se_nc_01"
        L4_2 = true
        L2_2(L3_2, L4_2)
      end
    end
  end
end
L2_1(L3_1)
