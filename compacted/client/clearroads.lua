local Props = {
    [729253480] = true,
    [-655644382] = true,
    [589548997] = true,
    [793482617] = true,
    [1502931467] = true,
    [1803721002] = true,
    [-1651641860] = true,
    [-156356737] = true,
    [1043035044] = true,
    [862871082] = true,
    [-1798594116] = true,
    [865627822] = true,
    [840050250] = true,
    [1821241621] = true,
    [-797331153] = true,
    [-949234773] = true,
    [1191039009] = true,
    [-463994753] = true,
    [-276539604] = true,
    [1021745343] = true,
    [-1063472968] = true,
    [1441261609] = true,
    [-667908451] = true,
    [-365135956] = true,
    [-157127644] = true,
    [-1057375813] = true,
    [-639994124] = true,
    [173177608] = true,
    [-879318991] = true,
    [-1529663453] = true,
    [267702115] = true,
    [1847069612] = true,
    [1452666705] = true,
    [681787797] = true,
    [1868764591] = true,
    [-1648525921] = true,
    [-1114695146] = true,
    [-943634842] = true,
    [-331378834] = true,
    [431612653] = true,
    [-97646180] = true,
    [1437508529] = true,
    [-2007495856] = true,
    [-16208233304] = true,
    [2122387284] = true,
    [1411103374] = true,
    [-216200273] = true,
    [1322893877] = true,
    [93794225] = true,
    [373936410] = true,
    [-872399736] = true,
    [-1178167275] = true,
    [1327054116] = true,
}

Citizen.CreateThread(function()
    while true do
        local PropsToDelete = {}
        local ped = PlayerPedId()
        local idle, success = 1000
        local handle, prop = FindFirstObject()
        repeat               
            if Props[GetEntityModel(prop)] then
                if GetObjectFragmentDamageHealth(prop,true) < 1.0 or (GetObjectFragmentDamageHealth(prop,true) ~= nil and GetEntityHealth(prop) < GetEntityMaxHealth(prop)) then
                    PropsToDelete[#PropsToDelete+1] = prop
                end
            end
            
            success, prop = FindNextObject(handle)
        until not success
        EndFindObject(handle)
        Citizen.Wait(500)
        for i = 1, #PropsToDelete do
            DeleteObject(PropsToDelete[i])
        end
        Citizen.Wait(500)
    end
end)