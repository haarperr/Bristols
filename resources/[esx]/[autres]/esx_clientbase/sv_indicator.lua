ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('pv:syncIndicator')
AddEventHandler('pv:syncIndicator', function(indicator)

	local playerid = source
	TriggerClientEvent('pv:syncIndicator', -1, playerid, indicator)
	
end)