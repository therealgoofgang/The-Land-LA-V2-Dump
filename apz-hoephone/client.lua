lib.callback.register('apz-hoes:takePic', function()
   local completed = lib.progressBar({
        duration = 7000,
        label = 'Taking Picture...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            combat = true,
            car = true
        },
        anim = {
            dict = "cellphone@female",
            clip = "cellphone_text_read_base_cover_low",
        },
        prop = {
            model = "prop_phone_ing",
            bone = 28422,
            pos = vector3(0.0, 0.0, 0.0),
            rot = vector3(0.0, 0.0, 0.0)
        }
    })

    return completed
end)