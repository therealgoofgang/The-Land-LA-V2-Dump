function ProgressBars(label, duration)
    if ProgressBar == 'ox' then
        -- If you want to use circle ox progressbar change lib.progressBar to lib.progressCircle.
        lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = false,
                car = false,
                combat = true
            },
        })
    elseif ProgressBar == 'qb' then
        CORE.Functions.Progressbar('progressBar', label, duration, false, false, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        })
        Wait(duration)
    elseif ProgressBar == 'qs' then
        exports['progressbar']:Progress({
            duration = duration,
            label = label,
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            },
        })
        Wait(duration)
    elseif ProgressBar == 'progressBars' then
        exports['progressBars']:startUI(duration, label)
        Wait(duration)
    end
end