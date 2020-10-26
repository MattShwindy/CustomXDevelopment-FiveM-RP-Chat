	Citizen.CreateThread(function()

			TriggerEvent('chat:addSuggestion', '/ooc', 'Send a Out Of Character chat message in game. (Global Chat)', {
				{ name="Message", help="Put your questions or help request."}
			})

			TriggerEvent('chat:addSuggestion', '/me', 'Send message in the third person. (Proximity Chat)', {
				{ name="Action", help="action."}
			})

			TriggerEvent('chat:addSuggestion', '/gme', 'Send message in the global third person. (Global Chat)', {
				{ name="Action", help="action."}
			})

			TriggerEvent('chat:addSuggestion', '/do', 'Send action message. (Proximity Chat)', {
				{ name="Action", help="action."}
			})

			TriggerEvent('chat:addSuggestion', '/ad', 'Send an advertisement in game (Global Chat)', {
				{ name="Message", help="Advertisment Message."}
			})

			TriggerEvent('chat:addSuggestion', '/twt', 'Send a Twitter message in game. (Global Chat)', {
				{ name="Message", help="Twitter Message."}
			})

			TriggerEvent('chat:addSuggestion', '/darkweb', 'Send a darkweb/anonymous message in game. (Global Chat)', {
				{ name="Message", help="Darkweb/Anonymous Message."}
			})

	end)

	--Chat
	RegisterNetEvent('SendProximityMessage')
	AddEventHandler('SendProximityMessage', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "^r" .. name .. "", {128, 128, 128}, "^r " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "^r" .. name .. "", {128, 128, 128}, "^r " .. message)
	  end
	end)

	--/me Command
	RegisterNetEvent('SendProximityMessageMe')
	AddEventHandler('SendProximityMessageMe', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .."^7: ".."^r " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .."^7: ".."^r " .. message)
	  end
	end)

	--/do Command
	RegisterNetEvent('SendProximityMessageDo')
	AddEventHandler('SendProximityMessageDo', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^9 ^*DO | " .. name .."^7:  ".."^r  " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^9 ^*DO | " .. name .."^7:  ".."^r  " .. message)
	  end
	end)
end
