local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L1_1 = {}
L1_1.label = "Underground Floor"
L2_1 = vector4
L3_1 = -844.24
L4_1 = -241.03
L5_1 = 30.98
L6_1 = 26.79
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
L1_1.coords = L2_1
L2_1 = {}
L2_1.label = "Ground Floor"
L3_1 = vector4
L4_1 = -844.18
L5_1 = -241.35
L6_1 = 37.23
L7_1 = 20.87
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
L2_1.coords = L3_1
L3_1 = {}
L3_1.label = "Rooftop"
L4_1 = vector4
L5_1 = -844.14
L6_1 = -241.44
L7_1 = 62.18
L8_1 = 205.15
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L3_1.coords = L4_1
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L1_1 = 1
L2_1 = 2.5
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = SetTextComponentFormat
  L2_2 = "STRING"
  L1_2(L2_2)
  L1_2 = AddTextComponentString
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = DisplayHelpTextFromStringLabel
  L2_2 = 0
  L3_2 = 0
  L4_2 = 1
  L5_2 = -1
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
ShowHelpNotification = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = SetEntityCoords
  L3_2 = L1_2
  L4_2 = A0_2.x
  L5_2 = A0_2.y
  L6_2 = A0_2.z
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetEntityHeading
  L3_2 = L1_2
  L4_2 = A0_2.w
  L2_2(L3_2, L4_2)
end
TeleportPlayer = L3_1
L3_1 = Citizen
L3_1 = L3_1.CreateThread
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 0
    L0_2(L1_2)
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = false
    L3_2 = ipairs
    L4_2 = L0_1
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = vector3
      L10_2 = L8_2.coords
      L10_2 = L10_2.x
      L11_2 = L8_2.coords
      L11_2 = L11_2.y
      L12_2 = L8_2.coords
      L12_2 = L12_2.z
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L9_2 = L1_2 - L9_2
      L9_2 = #L9_2
      L10_2 = L2_1
      if L9_2 < L10_2 then
        L2_2 = true
        break
      end
    end
    if L2_2 then
      L3_2 = ShowHelpNotification
      L4_2 = "Press ~INPUT_CONTEXT~ to teleport to "
      L6_2 = L1_1
      L5_2 = L0_1
      L5_2 = L5_2[L6_2]
      L5_2 = L5_2.label
      L6_2 = " | Press ~INPUT_CELLPHONE_UP~ or ~INPUT_CELLPHONE_DOWN~ to change location"
      L4_2 = L4_2 .. L5_2 .. L6_2
      L3_2(L4_2)
      L3_2 = IsControlJustReleased
      L4_2 = 1
      L5_2 = 172
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 then
        L3_2 = L1_1
        L3_2 = L3_2 - 1
        L1_1 = L3_2
        L3_2 = L1_1
        if L3_2 < 1 then
          L3_2 = L0_1
          L3_2 = #L3_2
          L1_1 = L3_2
        end
      else
        L3_2 = IsControlJustReleased
        L4_2 = 1
        L5_2 = 173
        L3_2 = L3_2(L4_2, L5_2)
        if L3_2 then
          L3_2 = L1_1
          L3_2 = L3_2 + 1
          L1_1 = L3_2
          L3_2 = L1_1
          L4_2 = L0_1
          L4_2 = #L4_2
          if L3_2 > L4_2 then
            L3_2 = 1
            L1_1 = L3_2
          end
        end
      end
      L3_2 = IsControlJustReleased
      L4_2 = 1
      L5_2 = 51
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 then
        L3_2 = TeleportPlayer
        L5_2 = L1_1
        L4_2 = L0_1
        L4_2 = L4_2[L5_2]
        L4_2 = L4_2.coords
        L3_2(L4_2)
      end
    else
      L3_2 = Citizen
      L3_2 = L3_2.Wait
      L4_2 = 500
      L3_2(L4_2)
    end
  end
end
L3_1(L4_1)
