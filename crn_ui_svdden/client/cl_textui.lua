local function showTextUI(text)
	nuiHandler(true, false, 'TEXTUI', {
        text = text
    })
end

local function hideTextUI()
    nuiHandler(false, false, 'TEXTUI', {})
end

exports('showTextUI', showTextUI)
exports('hideTextUI', hideTextUI)