local L0_1, L1_1
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2
  L0_2 = GetGameBuildNumber
  L0_2 = L0_2()
  L1_2 = 2545
  if L0_2 >= L1_2 then
    L0_2 = MpSecurityMusicRoofTop
    L0_2 = L0_2.LoadDefault
    L0_2()
  end
end
L0_1(L1_1)
