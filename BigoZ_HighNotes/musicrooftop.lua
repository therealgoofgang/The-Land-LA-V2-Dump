local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = exports
L1_1 = "GetMpSecurityMusicRoofTopObject"
function L2_1()
  local L0_2, L1_2
  L0_2 = MpSecurityMusicRoofTop
  return L0_2
end
L0_1(L1_1, L2_1)
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = "sf_musicrooftop"
L3_1[1] = L4_1
L2_1.ipl = L3_1
L1_1.Interior = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = EnableIpl
  L1_2 = MpSecurityMusicRoofTop
  L1_2 = L1_2.Ipl
  L1_2 = L1_2.Interior
  L1_2 = L1_2.ipl
  L2_2 = true
  L0_2(L1_2, L2_2)
end
L1_1.Load = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = EnableIpl
  L1_2 = MpSecurityMusicRoofTop
  L1_2 = L1_2.Ipl
  L1_2 = L1_2.Interior
  L1_2 = L1_2.ipl
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L1_1.Remove = L2_1
L0_1.Ipl = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = MpSecurityMusicRoofTop
  L0_2 = L0_2.Ipl
  L0_2 = L0_2.Load
  L0_2()
end
L0_1.LoadDefault = L1_1
MpSecurityMusicRoofTop = L0_1
