Config = {}

Config.Debug = false

Config.ClothingCost = 100
Config.BarberCost = 100
Config.TattooCost = 100
Config.SurgeonCost = 100

Config.ChargePerTattoo = true -- Charge players per tattoo. Config.TattooCost will become the cost of 1 tattoo. The cost can be overridden by adding `cost` key in shared/tattoos.lua for specific tattoos

-- Only set this to true if you're using rcore_tattoos
Config.RCoreTattoosCompatibility = true

Config.AsynchronousLoading = false -- Change this to false if you want the NUI data to load before displaying the appearance UI

Config.UseTarget = false

Config.TextUIOptions = {
    position = "left-center"
}

Config.NotifyOptions = {
    position = "top-right"
}

Config.OutfitCodeLength = 10

Config.UseRadialMenu = false
Config.UseOxRadial = false -- Set to true to use ox_lib radial menu, both this and UseRadialMenu must be true 

Config.EnablePedsForShops = true
Config.EnablePedsForClothingRooms = true
Config.EnablePedsForPlayerOutfitRooms = true

Config.EnablePedMenu = true
Config.PedMenuGroup = "group.support"

Config.EnableJobOutfitsCommand = false -- Enables /joboutfits and /gangoutfits commands

Config.ShowNearestShopOnly = false
Config.HideRadar = false -- Hides the minimap while the appearance menu is open
Config.NearestShopBlipUpdateDelay = 10000

Config.InvincibleDuringCustomization = true

Config.PreventTrackerRemoval = true -- Disables "Scarf and Chains" section if the player has tracker
Config.TrackerClothingOptions = {
    drawable = 13,
    texture = 0
}

Config.NewCharacterSections = {
    Ped = true,
    HeadBlend = true,
    FaceFeatures = true,
    HeadOverlays = true,
    Components = true,
    Props = true,
    Tattoos = true
}

Config.GenderBasedOnPed = true

Config.AlwaysKeepProps = false

Config.PersistUniforms = false -- Keeps Job / Gang Outfits on player reconnects / logout
Config.OnDutyOnlyClothingRooms = false -- Set to `true` to make the clothing rooms accessible only to players who are On Duty

Config.BossManagedOutfits = false -- Allows Job / Gang bosses to manage their own job / gang outfits

Config.ReloadSkinCooldown = 5000

Config.AutomaticFade = true -- Enables automatic fading and hides the Fade section from Hair

Config.DisableComponents = {
    Masks = false,
    UpperBody = false,
    LowerBody = false,
    Bags = false,
    Shoes = false,
    ScarfAndChains = false,
    BodyArmor = false,
    Shirts = false,
    Decals = false,
    Jackets = false
}

Config.DisableProps = {
    Hats = false,
    Glasses = false,
    Ear = false,
    Watches = false,
    Bracelets = false
}

---@type string[]
Config.Aces = {} -- list of ace permissions used for blacklisting

Config.Blips = {
    ["clothing"] = {
        Show = true,
        Sprite = 73,
        Color = 5,
        Scale = 0.6,
        Name = "Clothing Store",
    },
    ["barber"] = {
        Show = true,
        Sprite = 71,
        Color = 0,
        Scale = 0.6,
        Name = "Barber",
    },
    ["tattoo"] = {
        Show = true,
        Sprite = 75,
        Color = 0,
        Scale = 0.6,
        Name = "Tattoo Shop",
    },
    ["surgeon"] = {
        Show = false,
        Sprite = 102,
        Color = 0,
        Scale = 0.7,
        Name = "Plastic Surgeon",
    }
}

Config.TargetConfig = {
    ["clothing"] = {
        model = "s_f_m_shop_high",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-tshirt",
        label = "Open Clothing Store",
        distance = 3
    },
    ["barber"] = {
        model = "s_m_m_hairdress_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scissors",
        label = "Open Barber Shop",
        distance = 3
    },
    ["tattoo"] = {
        model = "u_m_y_tattoo_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-pen",
        label = "Open Tattoo Shop",
        distance = 3
    },
    ["surgeon"] = {
        model = "s_m_m_doctor_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scalpel",
        label = "Open Surgeon",
        distance = 3
    },
    ["clothingroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Job / Gang Clothes Menu",
        distance = 3
    },
    ["playeroutfitroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Outfits Menu",
        distance = 3
    },
}

Config.Stores = {
    {-- blacklabel
    type = "clothing",
    coords = vector4(-275.6561, 221.8727, 90.3041, 13.2361),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- pearls
    type = "clothing",
    coords = vector4( -1836.3516, -1178.2850, 14.2372, 254.8414),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- random
    type = "clothing",
    coords = vector4(1140.8706, -992.4507, 46.1132, 104.7047),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- sandbox
    type = "clothing",
    coords = vector4(-746.3021, -71.8351, 37.4023, 108.1196),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- hookah
    type = "clothing",
    coords = vector4(-419.0314, 273.2571, 83.3941, 86.2956),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- white widow
    type = "clothing",
    coords = vector4(171.3640, -234.1757, 50.0252, 172.7292),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- monroescoffee
    type = "clothing",
    coords = vector4(-148.0046, -113.6628, 55.3752, 163.5564),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- moneysidevapes
    type = "clothing",
    coords = vector4(-3187.6882, 1071.7877, 20.7290, 251.5571),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- not sure
    type = "clothing",
    coords = vector4(-222.5478, -1341.0325, 30.7794, 5.5014),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- not sure
    type = "clothing",
    coords = vector4(250.8253, -1099.0635, 33.3731, 102.9050),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- bahama
    type = "clothing",
    coords = vector4(-1365.5074, -620.6864, 30.3185, 95.4241),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- ladyd
    type = "clothing",
    coords = vector4(-681.6096, 5813.9258, 18.6190, 138.2231),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- ladyd
    type = "clothing",
    coords = vector4(-684.7555, 5808.5664, 18.6190, 168.0390),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- bahama
    type = "clothing",
    coords = vector4(-1388.2938, -600.2187, 30.1000, 126.6199),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- bahama
    type = "clothing",
    coords = vector4(-1380.1234, -635.5777, 30.1000, 36.7946),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- glitzngears
    type = "clothing",
    coords = vector4(-802.0342, -199.1152, 37.3583, 129.6651),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- pier76
    type = "clothing",
    coords = vector4(536.4033, -3090.9885, 5.9270, 354.5765),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- harmony
    type = "clothing",
    coords = vector4(1185.7777, 2626.2180, 38.2238, 84.0272),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- palace
    type = "clothing",
    coords = vector4(338.3360, 221.3391, 101.3129, 269.7966),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- fusionfeast
    type = "clothing",
    coords = vector4(1271.8431, -344.8059, 76.9073, 251.8584),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- playhouse
    type = "clothing",
    coords = vector4(781.8477, -1654.9736, 30.3118, 354.7831),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- vbmech
    type = "clothing",
    coords = vector4(-1626.8334, -829.9473, 10.2476, 331.4596),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- ghostchambers
    type = "clothing",
    coords = vector4(-703.3081, -1120.9537, 0.0917, 18.7542),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- topgear
    type = "clothing",
    coords = vector4(104.6592, 6524.7969, 31.4704, 239.7255),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {
    type = "clothing",
    coords = vector4(108.8176, 6528.7881, 31.4704, 229.2073),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- neptum
    type = "clothing",
    coords = vector4(870.3998, -2387.3457, 30.1973, 21.8780),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- aquabar
    type = "clothing",
    coords = vector4(14.8879, -1017.8771, 29.1496, 59.8887),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- cfmech
    type = "clothing",
    coords = vector4(-198.1642, -1165.2778, 18.7660, 0.4774),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- icylic
    type = "clothing",
    coords = vector4(-225.7263, -20.2849, 49.3654, 297.1809),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- wvmech
    type = "clothing",
    coords = vector4(-646.3878, 302.4036, 88.0091, 268.6062),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- lady dallas
    type = "clothing",
    coords = vector4(-670.1234, 5809.0674, 18.6190, 148.4770),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- aldente
    type = "clothing",
    coords = vector4(87.7558, 15.3451, 68.4422, 156.3120),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {-- the towns
    type = "clothing",
    coords = vector4(-1357.2323, -1086.7776, 6.7893, 281.3642),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    {
    type = "clothing",
    coords = vector4(-1356.6049, -1096.2550, 6.7893, 45.4102),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    -- the towns^
    {
    type = "clothing",
    coords = vector4(1158.5775, -447.7627, 67.3742, 344.6292),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    { -- PD
    type = "clothing",
    coords = vector4(-1052.0317, -816.8571, 10.9516, 29.6168),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(460.9033, -996.5274, 30.6896)
      }
    },
    { -- Trey Baker
    type = "clothing",
    coords = vector4(59.4436, -121.4474, 55.4522, 102.6375),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(-646.8298, -1242.1953, 11.8252)
      }
    },
    { -- LD Organics
    type = "clothing",
    coords = vector4(-1138.9329, -1424.3433, 5.1477, 307.1994),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(1686.9018554688, 4829.8330078125, 42.07),
        vector3(1698.8566894531, 4831.4604492188, 42.07),
        vector3(1700.2448730469, 4817.7734375, 42.07),
        vector3(1688.3682861328, 4816.2954101562, 42.07)
      }
    },
    { -- SmoKing
    type = "clothing",
    coords = vector4(-502.1533, 295.6979, 83.2860, 170.0385),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(1686.9018554688, 4829.8330078125, 42.07),
        vector3(1698.8566894531, 4831.4604492188, 42.07),
        vector3(1700.2448730469, 4817.7734375, 42.07),
        vector3(1688.3682861328, 4816.2954101562, 42.07)
      }
    },
    { --Mirror
    type = "clothing",
    coords = vector4(-1343.9388, -1059.0486, 11.4669, 232.8692),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(1686.9018554688, 4829.8330078125, 42.07),
        vector3(1698.8566894531, 4831.4604492188, 42.07),
        vector3(1700.2448730469, 4817.7734375, 42.07),
        vector3(1688.3682861328, 4816.2954101562, 42.07)
      }
    },
    { -- High Notes
    type = "clothing",
    coords = vector4(-851.3751, -227.0521, 37.2276, 111.3037),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
    showBlip = false, -- overrides the blip visibilty configured above for the group
    --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
    --targetScenario = "" -- overrides the target scenario configure for the group
    points = {
        vector3(1686.9018554688, 4829.8330078125, 42.07),
        vector3(1698.8566894531, 4831.4604492188, 42.07),
        vector3(1700.2448730469, 4817.7734375, 42.07),
        vector3(1688.3682861328, 4816.2954101562, 42.07)
      }
    },
    {
        type = "clothing",
        coords = vector4(-1311.6953, -395.6777, 36.6958, 340.0094),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
        showBlip = false, -- overrides the blip visibilty configured above for the group
        --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
        --targetScenario = "" -- overrides the target scenario configure for the group
        points = {
            vector3(1686.9018554688, 4829.8330078125, 42.07),
            vector3(1698.8566894531, 4831.4604492188, 42.07),
            vector3(1700.2448730469, 4817.7734375, 42.07),
            vector3(1688.3682861328, 4816.2954101562, 42.07)
          }
    },
    { -- blockbudz
        type = "clothing",
        coords = vector4(230.7462, -1961.5393, 22.8533, 45.1165),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
        showBlip = false, -- overrides the blip visibilty configured above for the group
        --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
        --targetScenario = "" -- overrides the target scenario configure for the group
        points = {
            vector3(1686.9018554688, 4829.8330078125, 42.07),
            vector3(1698.8566894531, 4831.4604492188, 42.07),
            vector3(1700.2448730469, 4817.7734375, 42.07),
            vector3(1688.3682861328, 4816.2954101562, 42.07)
        }
    },
    {
        type = "clothing",
        coords = vector4(1693.2, 4828.11, 42.07, 188.66),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
        showBlip = true, -- overrides the blip visibilty configured above for the group
        --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
        --targetScenario = "" -- overrides the target scenario configure for the group
        points = {
            vector3(1686.9018554688, 4829.8330078125, 42.07),
            vector3(1698.8566894531, 4831.4604492188, 42.07),
            vector3(1700.2448730469, 4817.7734375, 42.07),
            vector3(1688.3682861328, 4816.2954101562, 42.07)
        }
    },
    {
        type = "clothing",
        coords = vector4(-705.5, -149.22, 37.42, 122),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-719.86212158203, -147.83151245117, 37.42),
            vector3(-709.10491943359, -141.53076171875, 37.42),
            vector3(-699.94342041016, -157.44494628906, 37.42),
            vector3(-710.68774414062, -163.64665222168, 37.42)
        }
    },
    
    { -- Super Mechanic
        type = "clothing",
        coords = vector4(835.9584, -981.2377, 31.9670, 272.0688),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-719.86212158203, -147.83151245117, 37.42),
            vector3(-709.10491943359, -141.53076171875, 37.42),
            vector3(-699.94342041016, -157.44494628906, 37.42),
            vector3(-710.68774414062, -163.64665222168, 37.42)
        }
    },

    {
        type = "clothing",
        coords = vector4(-1192.61, -768.4, 17.32, 216.6),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1206.9552001953, -775.06304931641, 17.32),
            vector3(-1190.6080322266, -764.03198242188, 17.32),
            vector3(-1184.5672607422, -772.16949462891, 17.32),
            vector3(-1199.24609375, -783.07928466797, 17.32)
        }
    },
    {
        type = "clothing",
        coords = vector4(425.91, -801.03, 29.49, 177.79),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(419.55020141602, -798.36547851562, 29.49),
            vector3(431.61773681641, -798.31909179688, 29.49),
            vector3(431.19784545898, -812.07122802734, 29.49),
            vector3(419.140625, -812.03594970703, 29.49)
        }
    },
    { -- palace
        type = "clothing",
        coords = vector4(343.3828, 238.7418, 97.7035, 353.1147),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-160.82145690918, -313.85919189453, 39.73),
            vector3(-172.56513977051, -309.82858276367, 39.73),
            vector3(-166.5775604248, -292.48077392578, 39.73),
            vector3(-154.84906005859, -296.51647949219, 39.73)
        }
    },
    {
        type = "clothing",
        coords = vector4(-168.73, -301.41, 39.73, 238.67),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-160.82145690918, -313.85919189453, 39.73),
            vector3(-172.56513977051, -309.82858276367, 39.73),
            vector3(-166.5775604248, -292.48077392578, 39.73),
            vector3(-154.84906005859, -296.51647949219, 39.73)
        }
    },
    {
        type = "clothing",
        coords = vector4(75.39, -1398.28, 29.38, 6.73),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(81.406135559082, -1400.7791748047, 29.38),
            vector3(69.335029602051, -1400.8251953125, 29.38),
            vector3(69.754981994629, -1387.078125, 29.38),
            vector3(81.500122070312, -1387.3002929688, 29.38)
        }
    },
    {
        type = "clothing",
        coords = vector4(-827.39, -1075.93, 11.33, 294.31),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-826.26251220703, -1082.6293945312, 11.33),
            vector3(-832.27856445312, -1072.2819824219, 11.33),
            vector3(-820.16442871094, -1065.7727050781, 11.33),
            vector3(-814.08953857422, -1076.1878662109, 11.33)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1445.86, -240.78, 49.82, 36.17),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1448.4829101562, -226.39401245117, 49.82),
            vector3(-1439.2475585938, -234.70428466797, 49.82),
            vector3(-1451.5389404297, -248.33193969727, 49.82),
            vector3(-1460.7554931641, -240.02815246582, 49.82)
        }
    },
    {
        type = "clothing",
        coords = vector4(9.22, 6515.74, 31.88, 131.27),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(6.4955291748047, 6522.205078125, 31.88),
            vector3(14.737417221069, 6513.3872070312, 31.88),
            vector3(4.3691010475159, 6504.3452148438, 31.88),
            vector3(-3.5187695026398, 6513.1538085938, 31.88)
        }
    },
    {
        type = "clothing",
        coords = vector4(615.35, 2762.72, 42.09, 170.51),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(612.58312988281, 2747.2814941406, 42.09),
            vector3(612.26214599609, 2767.0520019531, 42.09),
            vector3(622.37548828125, 2767.7614746094, 42.09),
            vector3(623.66833496094, 2749.5180664062, 42.09)
        }
    },
    {
        type = "clothing",
        coords = vector4(1191.61, 2710.91, 38.22, 269.96),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1188.7923583984, 2704.2021484375, 38.22),
            vector3(1188.7498779297, 2716.2661132812, 38.22),
            vector3(1202.4979248047, 2715.8479003906, 38.22),
            vector3(1202.3558349609, 2703.9294433594, 38.22)
        }
    },
    {
        type = "clothing",
        coords = vector4(-3171.32, 1043.56, 20.86, 334.3),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-3162.0075683594, 1056.7303466797, 20.86),
            vector3(-3170.8247070312, 1039.0412597656, 20.86),
            vector3(-3180.0979003906, 1043.1201171875, 20.86),
            vector3(-3172.7292480469, 1059.8623046875, 20.86)
        }
    },
    {
        type = "clothing",
        coords = vector4(1213.8488, -483.1502, 65.3064, 88.2164),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-3162.0075683594, 1056.7303466797, 20.86),
            vector3(-3170.8247070312, 1039.0412597656, 20.86),
            vector3(-3180.0979003906, 1043.1201171875, 20.86),
            vector3(-3172.7292480469, 1059.8623046875, 20.86)
        }
    },
    -- Uwu Cafe
    {
        type = "clothing",
        coords = vector4(-585.4680, -1068.4066, 26.3947, 287.1506),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    {
        type = "clothing",
        coords = vector4(-588.1373, -1041.6222, 22.3324, 180.3552),
        size = vector3(2.8, 2.8, 2.8),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },

    {
        type = "clothing",
        coords = vector4(-665.6942, -790.5032, 33.0904, 17.9190),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },

    {
        type = "clothing",
        coords = vector4(-660.0618, -943.0849, 21.8292, 73.3009),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },

    {
        type = "clothing",
        coords = vector4(-1105.52, 2707.79, 19.11, 317.19),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
----------- PIZZA CRUST
    {
        type = "clothing",
        coords = vector4(549.9891, 109.5255, 96.5599, 348.6045),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },

    ----------- WEEDLAND
    {
        type = "clothing",
        coords = vector4(-1329.6118, -1221.9352, 5.6164, 192.0134),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },

    ----------- DCUSTOMS
    {
        type = "clothing",
        coords = vector4(105.3764, -1579.4069, 29.5191, 54.4919),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },


    {
        type = "clothing",
        coords = vector4(1520.2291, 3790.2456, 38.2566, 303.0479),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    ----------- HOOKAH LOUNGE -----------
    {
        type = "clothing",
        coords = vector4(-448.0935, -18.7095, 40.8751, 159.4758),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },

    {
        type = "clothing",
        coords = vector4(1759.4489, 3700.8777, 34.2019, 123.6165),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = true,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },

    {
        type = "clothing",
        coords = vector4(-440.2703, -18.2001, 40.8751, 153.9074),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    
------ AMMO IN PALETO
    {
        type = "clothing",
        coords = vector4(-324.7477, 6081.9302, 31.4548, 282.3814),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    {
        type = "clothing",
        coords = vector4(-3068.6541, 460.1911, 3.0361, 70.6454),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    {--shiners
        type = "clothing",
        coords = vector4(-1399.4375, -271.4876, 43.3556, 229.0494),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    {--baddies garage
        type = "clothing",
        coords = vector4(-787.9934, -195.6940, 37.4883, 115.6230),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    {--baddies garage
        type = "clothing",
        coords = vector4(-684.5278, 5811.6094, 18.6191, 317.5437),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    {----- bahama
        type = "barber",
        coords = vector4(-1362.9015, -618.9714, 30.3186, 309.1120),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    {----- playhouse
        type = "barber",
        coords = vector4(777.6655, -1654.9388, 30.3118, 0.4047),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    {----- palace
        type = "barber",
        coords = vector4(344.1573, 234.8319, 97.5535, 345.5129),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    {
        type = "barber",
        coords = vector4(341.5005, 235.6839, 97.5535, 345.3429),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = true,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    ---------
    {
        type = "barber",
        coords = vector4(-814.22, -183.7, 37.57, 116.91),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = true,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    {
        type = "barber",
        coords = vector4(1747.48, 3700.78, 34.18, 218.59),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = true,
        points = {
            vector3(1932.4931640625, 3725.3374023438, 32.84),
            vector3(1927.2720947266, 3733.7663574219, 32.84),
            vector3(1931.4379882812, 3736.5327148438, 32.84),
            vector3(1936.0697021484, 3727.2839355469, 32.84)
        }
    },
    { -- Postal 8105
        type = "barber",
        coords = vector4(-1282.3982, -1117.5463, 6.9901, 177.8132),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = true,
        points = {
            vector3(-1124.5535888672, -1444.5367431641, 5.23),
            vector3(-1118.7023925781, -1441.0450439453, 5.23),
            vector3(-1121.2891845703, -1434.8474121094, 5.23),
            vector3(-1128.4727783203, -1439.8254394531, 5.23)
        }
    },
    {
        type = "clothing",
        coords = vector4(124.82, -224.36, 54.56, 335.41),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(133.60948181152, -210.31390380859, 54.56),
            vector3(125.8349609375, -228.48097229004, 54.56),
            vector3(116.3140335083, -225.02020263672, 54.56),
            vector3(122.56930541992, -207.83396911621, 54.56)
        }
    },
    { -- Frontline Arsenal
        type = "clothing",
        coords = vector4(247.2962, -49.7281, 69.9410, 256.4104),
        size = vector3(3, 3, 3),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(133.60948181152, -210.31390380859, 54.56),
            vector3(125.8349609375, -228.48097229004, 54.56),
            vector3(116.3140335083, -225.02020263672, 54.56),
            vector3(122.56930541992, -207.83396911621, 54.56)
        }
    },
    { -- EMS
        type = "clothing",
        coords = vector4(-855.7668, -2129.5623, 9.9222, 5.8717),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(133.60948181152, -210.31390380859, 54.56),
            vector3(125.8349609375, -228.48097229004, 54.56),
            vector3(116.3140335083, -225.02020263672, 54.56),
            vector3(122.56930541992, -207.83396911621, 54.56)
        }
    },
    { -- LSGUN2
        type = "clothing",
        coords = vector4(813.1720, -2178.2393, 27.5454, 187.6565),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(133.60948181152, -210.31390380859, 54.56),
            vector3(125.8349609375, -228.48097229004, 54.56),
            vector3(116.3140335083, -225.02020263672, 54.56),
            vector3(122.56930541992, -207.83396911621, 54.56)
        }
    },
    {
        type = "surgeon",
        coords = vector4(-843.0963, -2138.9053, 9.9222, 145.6293),
        size = vector3(3, 3, 3),
        rotation = 45,
        usePoly = false,
        showBlip = true,
        points = {
            vector3(298.84417724609, -572.92205810547, 43.26),
            vector3(296.39556884766, -575.65942382812, 43.26),
            vector3(293.56317138672, -572.60675048828, 43.26),
            vector3(296.28656005859, -570.330078125, 43.26)
        }
    },
    -- AmmuGun 1
    {
        type = "clothing",
        coords = vector4(839.7002, -1028.7250, 27.9949, 271.7646),
        size = vector3(3, 3, 3),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(298.84417724609, -572.92205810547, 43.26),
            vector3(296.39556884766, -575.65942382812, 43.26),
            vector3(293.56317138672, -572.60675048828, 43.26),
            vector3(296.28656005859, -570.330078125, 43.26)
        }
    },
    -- end sakura
    -- luxx
    {
        type = "clothing",
        coords = vector4(-37.8623, -1282.8162, 20.2115, 356.0262),
        size = vector3(3, 3, 3),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(298.84417724609, -572.92205810547, 43.26),
            vector3(296.39556884766, -575.65942382812, 43.26),
            vector3(293.56317138672, -572.60675048828, 43.26),
            vector3(296.28656005859, -570.330078125, 43.26)
        }
    },
    {
        type = "barber",
        coords = vector4(-37.9733, -1276.2749, 20.2115, 185.2982),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    -- Energy Hospital
    {
        type = "clothing",
        coords = vector4(-833.1561, -2153.3198, 9.9222, 131.8771),
        size = vector3(3, 3, 3),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(298.84417724609, -572.92205810547, 43.26),
            vector3(296.39556884766, -575.65942382812, 43.26),
            vector3(293.56317138672, -572.60675048828, 43.26),
            vector3(296.28656005859, -570.330078125, 43.26)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1559.2258, -453.1429, 35.8868, 310.7214),
        size = vector3(3, 3, 3),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(298.84417724609, -572.92205810547, 43.26),
            vector3(296.39556884766, -575.65942382812, 43.26),
            vector3(293.56317138672, -572.60675048828, 43.26),
            vector3(296.28656005859, -570.330078125, 43.26)
        }
    },
    {
        type = "clothing",
        coords = vector4(1950.5181, 3829.0068, 32.4725, 302.5043),
        size = vector3(3, 3, 3),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(298.84417724609, -572.92205810547, 43.26),
            vector3(296.39556884766, -575.65942382812, 43.26),
            vector3(293.56317138672, -572.60675048828, 43.26),
            vector3(296.28656005859, -570.330078125, 43.26)
        }
    },
    --vinewood
    {
        type = "clothing",
        coords = vector4(-647.8904, 299.6585, 87.8904, 7.0046),
        size = vector3(3, 3, 3),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(298.84417724609, -572.92205810547, 43.26),
            vector3(296.39556884766, -575.65942382812, 43.26),
            vector3(293.56317138672, -572.60675048828, 43.26),
            vector3(296.28656005859, -570.330078125, 43.26)
        }
    },  
}


Config.ClothingRooms = {
    {
        job = "police",
        coords = vector4(604.46, -6.85, 87.81, 311.62), 
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(460.41918945312, -993.11444091797, 30.69),
            vector3(449.39508056641, -993.60614013672, 30.69),
            vector3(449.88696289062, -990.23779296875, 30.69),
            vector3(450.97882080078, -989.71411132812, 30.69),
            vector3(451.0325012207, -987.89904785156, 30.69),
            vector3(453.47863769531, -987.76928710938, 30.69),
            vector3(454.35513305664, -988.46459960938, 30.69),
            vector3(460.4231262207, -987.94573974609, 30.69)
        }
    }
}


Config.PlayerOutfitRooms = {
    -- Sample outfit room config
--[[    {
        job = "police",
        coords = vector4(287.28, -573.41, 43.16, 79.61),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(284.83, -574.01, 43.16),
            vector3(286.33, -570.03, 43.16),
            vector3(290.33, -571.74, 43.16),
            vector3(289.0, -574.75, 43.16)
        },
        citizenIDs = {
            "BHH65156"
        }
    }]]--
}

Config.Outfits = {
    ["police"] = {
        ["Male"] = {
            {
                name = "Short Sleeve",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 19, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 55, texture = 0}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = -1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Trooper Tan",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 3}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 58, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Long Sleeve",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 0}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = -1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1, 2, 3, 4},
            },
            {
                name = "Trooper Black",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 8}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 58, texture = 3}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2, 3, 4},
            },
            {
                name = "SWAT",
                outfitData = {
                    ["pants"] = {item = 130, texture = 1}, -- Pants
                    ["arms"] = {item = 172, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 15, texture = 0}, -- T Shirt
                    ["vest"] = {item = 15, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 336, texture = 3}, -- Jacket
                    ["shoes"] = {item = 24, texture = 0}, -- Shoes
                    ["accessory"] = {item = 133, texture = 0}, -- Neck Accessory
                    ["hat"] = {item = 150, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 52, texture = 0} -- Mask
                },
                grades = {3, 4},
            }
        },
        ["Female"] = {
            {
                name = "Short Sleeve",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 48, texture = 0}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Trooper Tan",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 3}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Long Sleeve",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 0}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1, 2, 3, 4},
            },
            {
                name = "Trooper Black",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2, 3, 4},
            },
            {
                name = "SWAT",
                outfitData = {
                    ["pants"] = {item = 135, texture = 1}, -- Pants
                    ["arms"] = {item = 213, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 0, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 102, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 149, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 35, texture = 0} -- Mask
                },
                grades = {3, 4},
            }
        }
    },
    ["realestate"] = {
        ["Male"] = {
            {
                -- Outfits
                name = "Worker",
                outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        },
        ["Female"] = {
            {
                name = "Worker",
                outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        }
    },
    ["ambulance"] = {
        ["Male"] = {
            {
                name = "T-Shirt",
                outfitData = {
                    ["arms"] = {item = 85, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 129, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 250, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 58, texture = 0}, -- Decals
                    ["accessory"] = {item = 127, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 96, texture = 0}, -- Pants
                    ["shoes"] = {item = 54, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 122, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Polo",
                outfitData = {
                    ["arms"] = {item = 90, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 249, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 57, texture = 0}, -- Decals
                    ["accessory"] = {item = 126, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 96, texture = 0}, -- Pants
                    ["shoes"] = {item = 54, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 122, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            },
            {
                name = "Doctor",
                outfitData = {
                    ["arms"] = {item = 93, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 32, texture = 3}, -- T-Shirt
                    ["torso2"] = {item = 31, texture = 7}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 126, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 28, texture = 0}, -- Pants
                    ["shoes"] = {item = 10, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {3, 4},
            }
        },
        ["Female"] = {
            {
                name = "T-Shirt",
                outfitData = {
                    ["arms"] = {item = 109, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 159, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 258, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 66, texture = 0}, -- Decals
                    ["accessory"] = {item = 97, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 99, texture = 0}, -- Pants
                    ["shoes"] = {item = 55, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 121, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Polo",
                outfitData = {
                    ["arms"] = {item = 105, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 13, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 257, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 65, texture = 0}, -- Decals
                    ["accessory"] = {item = 96, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 99, texture = 0}, -- Pants
                    ["shoes"] = {item = 55, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 121, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            },
            {
                name = "Doctor",
                outfitData = {
                    ["arms"] = {item = 105, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 39, texture = 3}, -- T-Shirt
                    ["torso2"] = {item = 7, texture = 1}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 96, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 34, texture = 0}, -- Pants
                    ["shoes"] = {item = 29, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {3, 4},
            }
        }
    }
}

Config.InitialPlayerClothes = {
    Male = {
        Model = "mp_m_freemode_01",
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    },
    Female = {
        Model = "mp_f_freemode_01",
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    }
}
