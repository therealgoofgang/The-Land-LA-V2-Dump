function getPedHeadShotUrl(ped)
    DoScreenFadeIn(0)
    Wait(500)
    local ped = ped
    local handler = RegisterPedheadshotTransparent(ped)
    local image
    SetTimeout(300, function ()
        Wait(100)
        local txd = GetPedheadshotTxdString(handler)
        Wait(100)
        SetTimeout(100, function()
            UnregisterPedheadshot(handler)
            local randomNum = math.random(111111, 999999)
            image = 'https://nui-img/'..txd..'/'..txd..'?v='..randomNum
        end)
    end)

    Wait(900)
    return image
end


