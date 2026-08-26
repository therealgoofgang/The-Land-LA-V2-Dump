MaleFemalePeds = {   -- Define the male and female ped models.
    male = {'mp_m_freemode_01'},
    female = {'mp_f_freemode_01'}
}

function Shower(status)
    if status == 'gotIn' then
        -- Player started to shower
    elseif status == 'gotOut' then
        -- Player stopped showering
    end
end

function SleepingBag(status)
    if status == 'gotIn' then
        -- Player entered sleepingbag
    elseif status == 'gotOut' then
        -- Player exited sleepingbag
    end
end

function Tent(status)
    if status == 'gotIn' then
        -- Player entered tent
    elseif status == 'gotOut' then
        -- Player exited tent
    end
end