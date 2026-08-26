local L0_1, L1_1, L2_1
L0_1 = exports
L1_1 = "EnableIpl"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = EnableIpl
  L3_2 = A0_2
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = IsTable
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = pairs
    L3_2 = A0_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = EnableIpl
      L9_2 = L7_2
      L10_2 = A1_2
      L8_2(L9_2, L10_2)
    end
  elseif A1_2 then
    L2_2 = IsIplActive
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = RequestIpl
      L3_2 = A0_2
      L2_2(L3_2)
    end
  else
    L2_2 = IsIplActive
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = RemoveIpl
      L3_2 = A0_2
      L2_2(L3_2)
    end
  end
end
EnableIpl = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = "table" == L1_2
  return L1_2
end
IsTable = L0_1
