--Chat
	AddEventHandler('chatMessage', function(source, name, message)
	  if string.sub(message, 1, string.len("/")) ~= "/" then
		  local name = GetPlayerName(source)
		TriggerClientEvent("SendProximityMessage", -1, source, name, message)
	  end
	  CancelEvent()
	end)

	--/me Command
	RegisterCommand('me', function(source, args, user)
	  local name = GetPlayerName(source)
	  TriggerClientEvent("SendProximityMessageMe", -1, source, name, table.concat(args, " "))
	end, false)

	--/do Command
	RegisterCommand('do', function(source, args, user)
	  local name = GetPlayerName(source)
	  TriggerClientEvent("SendProximityMessageDo", -1, source, name, table.concat(args, " "))
	end, false)

	--/gme Command
	RegisterCommand('gme', function(source, args, user)
	TriggerClientEvent('chatMessage', -1, "^3^*GLOBAL ME | ^7" .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
	end, false)

	--/twt Command
	RegisterCommand('twt', function(source, args, user)
	TriggerClientEvent('chatMessage', -1, "^0^*[^4Twitter^0] (^5@" .. GetPlayerName(source) .. "^0)^r", {30, 144, 255}, table.concat(args, " "))
	end, false)

	--/ooc Command
	RegisterCommand('ooc', function(source, args, user)
	TriggerClientEvent('chatMessage', -1, "^*OOC | " .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
	end, false)

	--/ad Command
	RegisterCommand('ad', function(source, args, user)
			if AdStyle == 1 then
				TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERTISEMTN^0] " .. GetPlayerName(source), {255,215,0}, table.concat(args, " ")) --ADVERTISEMENT WITH USERNAME
			elseif AdStyle == 2 then
				TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERTISEMENT^0] (^1@" .. GetPlayerName(source) .. "^0)^r", {255,215,0}, table.concat(args, " ")) --ADVERTISEMENT WITH TWITTER STYLE USERNAME HANDLE
			elseif AdStyle == 3 then
				TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERTISEMENT^0]^r", {255,215,0}, table.concat(args, " ")) --ADVERTISEMENT WITH NO USERS IDENTIFIER
			end
	end, false)

	--/darkweb Command
	RegisterCommand('darkweb', function(source, args, user)
	TriggerClientEvent('chatMessage', -1, "^*[^*Dark Web] (@^*Anonymous)^r", {0, 0, 0}, table.concat(args, " "))
	end, false)

	--String Splitting
	function stringsplit(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end
end