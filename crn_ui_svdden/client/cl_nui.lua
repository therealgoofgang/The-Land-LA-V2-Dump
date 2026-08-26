UISTATE = {}

function nuiHandler(visablityState, nuiFocus, resource, data)
    UISTATE[resource] = visablityState
	SetNuiFocus(nuiFocus, nuiFocus)
	SendNUIMessage({
		action = "setVisible",
		data = {
			visible = visablityState,
			resource = resource,
			data = visablityState and data or {}
		}
	})
end

RegisterNUICallback("frontendStateHandler", function(data, cb)
	if not data then return cb('error') end

	nuiHandler(data.visablityState, data.nuiFocus, data.resource, data.data)

	if not data.visablityState and data.resource == 'dealership' then
		closeDealership()
	end
	cb('')
end)