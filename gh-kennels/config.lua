Config = {}

-- ============================================================
--  BREEDS
--  Each breed defines its own valid models and breeding reward
--  items (model -> puppy item). The `breed` column on the
--  player_dogs table will be one of the keys below.
-- ============================================================
Config.Breeds = {
    pitbull = {
        label = 'Pitbull',
        -- Models considered pitbulls when registering / verifying a dog
        models = {
            ['a_c_husky']      = true,
            ['a_c_retriever']  = true,
            ['a_c_chop']       = true,
            ['a_c_rottweiler'] = true
        },
        -- Puppy item rewarded on successful breeding, keyed by parent model
        breedingRewards = {
            ['a_c_husky']      = 'pitpuppy1',
            ['a_c_retriever']  = 'pitpuppy2',
            ['a_c_chop']       = 'pitpuppy3',
            ['a_c_rottweiler'] = 'pitpuppy4'
        },
        -- When the player USES a puppy item, it spawns the matching adult model
        puppyToAdult = {
            ['pitpuppy1'] = 'a_c_husky',
            ['pitpuppy2'] = 'a_c_retriever',
            ['pitpuppy3'] = 'a_c_chop',
            ['pitpuppy4'] = 'a_c_rottweiler'
        },
        -- Sell prices
        sellPrice = {
            base    = 2500,  -- with shots + paperwork (now always required to sell)
            reduced = 1000   -- legacy fallback (unused since shots+paperwork are required)
        },
        -- Max times a dog of this breed can be bred
        maxBreedings = 5
    },

    frenchie = {
        label = 'French Bulldog',
        models = {
            ['a_c_fdpuppy_tan']     = true,
            ['a_c_fdpuppy_white']   = true,
            ['a_c_fdpuppy_brindle'] = true,
            ['bulldog']             = true,
            ['bulldog2']            = true,
            ['bulldog3']            = true
        },
        -- Random reward pool when breeding a frenchie
        breedingRewards = {
            'frenchypup', 'frenchypup2', 'frenchypup3',
            'frenchypup4', 'frenchypup5', 'frenchypup6'
        },
        puppyToAdult = {
            ['frenchypup']  = 'bulldog',
            ['frenchypup2'] = 'bulldog2',
            ['frenchypup3'] = 'bulldog3',
            ['frenchypup4'] = 'a_c_fdpuppy_tan',
            ['frenchypup5'] = 'a_c_fdpuppy_white',
            ['frenchypup6'] = 'a_c_fdpuppy_brindle'
        },
        sellPrice = {
            base    = 4000,
            reduced = 1500,
            highEnd = {
                base    = 6000,   -- trained frenchies
                reduced = 3000    -- when bred more than 2 times
            }
        },
        maxBreedings = 5
    }
}

-- ============================================================
--  CARE (feeding / watering)
-- ============================================================
Config.Care = {
    maxFeeding   = 4,
    maxWatering  = 4,
    maxTotal     = 8,         -- feeding + watering combined
    kneelEmote   = 'e kneel3',
    cancelEmote  = 'e c'
}

-- ============================================================
--  LIFECYCLE: puppy kennel
--  The kennel is a temporary, client-only prop that exists while
--  the dog is a puppy. It is NOT saved to the database; it is
--  spawned next to the player on use, and removed once the puppy
--  grows up. Adults are breeding/selling stock only - summoning
--  them as companions was removed (companions = nn_petshop).
-- ============================================================
Config.Lifecycle = {
    -- Kennel cage prop (the puppy lives in here while growing up)
    kennelProp    = 'kennelzas_snap',
    -- Distance the dog will follow at
    followOffset  = vector3(0.0, -1.0, 0.0)
}

-- ============================================================
--  ONE NPC PER ACTIVITY (handles both breeds)
--  Set the coords/heading/model for each location you want.
-- ============================================================
Config.Locations = {
    shots = {
        coords  = vector4(405.3652, -341.2274, 46.9740, 160.1456),
        model   = 'a_m_m_business_01',
        blip    = { sprite = 273, color = 5, scale = 0.8, label = 'Dog Vaccinations' }
    },

    paperwork = {
        coords  = vector4(407.2726, -341.9226, 46.9801, 165.5491),
        model   = 'a_m_m_business_01',
        blip    = { sprite = 273, color = 3, scale = 0.8, label = 'Dog Paperwork' }
    },

    breeding = {
        -- NOTE: original config had X=4400.3676 which is in the ocean,
        -- almost certainly a typo. Using 400.3676 to keep the NPC near
        -- the others. Change back if you really meant 4400.
        coords  = vector4(400.3676, -344.3795, 46.8954, 245.3069),
        model   = 'a_f_m_fatcult_01',
        blip    = { sprite = 273, color = 26, scale = 0.8, label = 'Dog Breeding' }
    },

    selling = {
        coords  = vector4(407.2344, -349.5496, 46.8776, 128.3714),
        model   = 'a_m_m_business_01',
        blip    = { sprite = 273, color = 1, scale = 0.8, label = 'Dog Buyer' }
    },

    transfer = {
        coords  = vector4(408.3372, -355.1888, 46.8283, 10.9423),
        model   = 'a_m_m_business_01',
        blip    = { sprite = 273, color = 27, scale = 0.8, label = 'Dog Transfer' }
    },

    -- Vendor that sells starter puppy items so players can begin
    vendor = {
        coords  = vector4(407.6514, -357.8105, 46.8526, 99.0794),
        model   = 'a_m_m_business_01',
        blip    = { sprite = 273, color = 2, scale = 0.8, label = 'Puppy Vendor' }
    }
}

-- Puppies the vendor sells. Pick what you want available + the price.
Config.VendorStock = {
    { item = 'pitpuppy1',  label = 'Husky Puppy',           price = 5000 },
    { item = 'pitpuppy2',  label = 'Retriever Puppy',       price = 5000 },
    { item = 'pitpuppy3',  label = 'Chop Puppy',            price = 5000 },
    { item = 'pitpuppy4',  label = 'Rottweiler Puppy',      price = 5000 },
    { item = 'frenchypup', label = 'Bulldog Puppy',         price = 7500 },
    { item = 'frenchypup4',label = 'French Bulldog Puppy',  price = 7500 }
}

-- ============================================================
--  PRICES & TIMINGS
-- ============================================================
Config.Prices = {
    shots     = 500,    -- cost to vaccinate a dog
    paperwork = 750     -- cost to file paperwork
}

Config.Breeding = {
    timeSeconds      = 60,    -- duration of the breeding animation
    cooldownSeconds  = 600,   -- per-player cooldown between attempts
    rewardWithReqs   = 7,     -- puppies awarded when dog has shots + paperwork
    rewardWithoutReqs = 1     -- puppies awarded otherwise
}

-- ============================================================
--  MESSAGES (centralised)
-- ============================================================
Config.Messages = {
    noDog               = 'No registered dog found.',
    alreadyVaccinated   = 'This dog has already been vaccinated.',
    vaccinated          = 'Your dog has been vaccinated successfully.',
    paperworkDone       = 'Paperwork has already been processed for this dog.',
    paperworkSuccess    = "Your dog's paperwork has been processed.",
    breedingCooldown    = 'You have recently bred a dog. Please wait.',
    breedingMaxed       = 'This dog cannot breed anymore.',
    breedingSuccess     = 'Breeding successful! Puppies have been birthed.',
    soldDog             = 'You have sold your dog for $',
    notEnoughMoney      = 'You do not have enough money.',
    transferSuccess     = 'Dog transferred successfully.',
    transferTargetNotFound = 'Target player not found nearby.'
}
