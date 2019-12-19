ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_clotheshop:saveOutfit')
AddEventHandler('esx_clotheshop:saveOutfit', function(label, skin)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)

		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  = skin
		})

		store.set('dressing', dressing)

	end)

end)

RegisterServerEvent('esx_clotheshop:deleteOutfit')
AddEventHandler('esx_clotheshop:deleteOutfit', function(label)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)

		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		label = label
		
		table.remove(dressing, label)

		store.set('dressing', dressing)

	end)

end)

ESX.RegisterServerCallback('esx_clotheshop:buy', function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.get('money') >= Config.Price then
        xPlayer.removeMoney(Config.Price)
        TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. '$' .. Config.Price)
        cb(true)
      elseif xPlayer.get('bank') >= Config.Price then
        xPlayer.removeAccountMoney('bank', Config.Price)
        TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. '$' .. Config.Price .. ' avec votre carte bancaire')
        cb(true)
      else
        cb(false)
      end

end)

ESX.RegisterServerCallback('esx_clotheshop:checkPropertyDataStore', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local foundStore = false

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		foundStore = true
	end)

	cb(foundStore)

end)

ESX.RegisterServerCallback('esx_clotheshop:getPlayerDressing', function(source, cb)

  local xPlayer  = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)

    local count    = store.count('dressing')
    local labels   = {}

    for i=1, count, 1 do
      local entry = store.get('dressing', i)
      table.insert(labels, entry.label)
    end

    cb(labels)

  end)

end)

ESX.RegisterServerCallback('esx_clotheshop:getPlayerOutfit', function(source, cb, num)

  local xPlayer  = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
    local outfit = store.get('dressing', num)
    cb(outfit.skin)
  end)

end)