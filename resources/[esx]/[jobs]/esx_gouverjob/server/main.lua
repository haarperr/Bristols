ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'gouvernor', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'gouvernor', _U('alert_police'), true, true)
TriggerEvent('esx_society:registerSociety', 'gouvernor', 'Gouvernement', 'society_gouvernor', 'society_gouvernor', 'society_gouvernor', {type = 'public'})

RegisterServerEvent('esx_gouverjob:giveWeapon')
AddEventHandler('esx_gouverjob:giveWeapon', function(weapon, ammo)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_gouverjob:annonce')
AddEventHandler('esx_gouverjob:annonce', function(result)
  local _source  = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  local xPlayers = ESX.GetPlayers()
  local text     = result
  print(text)
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx_gouverjob:annonce', xPlayers[i],text)
  end

  Wait(8000)

  local xPlayers = ESX.GetPlayers()
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx_gouverjob:annoncestop', xPlayers[i])
  end

end)

RegisterServerEvent('esx_gouverjob:annonce')
AddEventHandler('esx_gouverjob:annonce', function(result)
  local _source  = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  local xPlayers = ESX.GetPlayers()
  local text     = result
  print(text)
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx_gouverjob:annonce', xPlayers[i],text)
  end

  Wait(8000)

  local xPlayers = ESX.GetPlayers()
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx_gouverjob:annoncestop', xPlayers[i])
  end

end)

RegisterServerEvent('esx_gouverjob:confiscatePlayerItem')
AddEventHandler('esx_gouverjob:confiscatePlayerItem', function(target, itemType, itemName, amount)

  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if itemType == 'item_standard' then

    local label = sourceXPlayer.getInventoryItem(itemName).label
    local playerItemCount = targetXPlayer.getInventoryItem(itemName).count

    if playerItemCount <= amount then
      targetXPlayer.removeInventoryItem(itemName, amount)
      sourceXPlayer.addInventoryItem(itemName, amount)
    else
      TriggerClientEvent('esx:showNotification', _source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confinv') .. amount .. ' ' .. label .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confinv') .. amount .. ' ' .. label )

  end

  if itemType == 'item_account' then

    targetXPlayer.removeAccountMoney(itemName, amount)
    sourceXPlayer.addAccountMoney(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confdm') .. amount .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confdm') .. amount)

  end

  if itemType == 'item_weapon' then

    targetXPlayer.removeWeapon(itemName)
    sourceXPlayer.addWeapon(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confweapon') .. ESX.GetWeaponLabel(itemName) .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confweapon') .. ESX.GetWeaponLabel(itemName))

  end

end)

RegisterServerEvent('esx_gouverjob:handcuff')
AddEventHandler('esx_gouverjob:handcuff', function(target)
  TriggerClientEvent('esx_gouverjob:handcuff', target)
end)

RegisterServerEvent('esx_gouverjob:drag')
AddEventHandler('esx_gouverjob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_gouverjob:drag', target, _source)
end)

RegisterServerEvent('esx_gouverjob:putInVehicle')
AddEventHandler('esx_gouverjob:putInVehicle', function(target)
  TriggerClientEvent('esx_gouverjob:putInVehicle', target)
end)

RegisterServerEvent('esx_gouverjob:OutVehicle')
AddEventHandler('esx_gouverjob:OutVehicle', function(target)
    TriggerClientEvent('esx_gouverjob:OutVehicle', target)
end)

RegisterServerEvent('esx_gouverjob:getStockItem')
AddEventHandler('esx_gouverjob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gouvernor', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_gouverjob:putStockItems')
AddEventHandler('esx_gouverjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gouvernor', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_gouverjob:getOtherPlayerData', function(source, cb, target)

	if Config.EnableESXIdentity then

		local xPlayer = ESX.GetPlayerFromId(target)

		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end

	else

		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)

	end

end)

ESX.RegisterServerCallback('esx_gouverjob:getFineList', function(source, cb, category)

  MySQL.Async.fetchAll(
    'SELECT * FROM fine_types WHERE category = @category',
    {
      ['@category'] = category
    },
    function(fines)
      cb(fines)
    end
  )

end)

ESX.RegisterServerCallback('esx_gouverjob:getVehicleInfos', function(source, cb, plate)

  if Config.EnableESXIdentity then

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local ownerName = result[1].firstname .. " " .. result[1].lastname

              local infos = {
                plate = plate,
                owner = ownerName
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  else

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local infos = {
                plate = plate,
                owner = result[1].name
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  end

end)

ESX.RegisterServerCallback('esx_gouverjob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE plate = @plate', 
		{
			['@plate'] = plate
		},
		function(result)
			if result[1] ~= nil then
				local playerName = ESX.GetPlayerFromIdentifier(result[1].owner).name
				cb(playerName, true)
			else
				cb('unknown', false)
			end
		end
	)
end)

ESX.RegisterServerCallback('esx_gouverjob:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_gouvernor', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_gouverjob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)

  local xPlayer = ESX.GetPlayerFromId(source)

  if removeWeapon then
    xPlayer.removeWeapon(weaponName)
  end

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_gouvernor', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_gouverjob:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_gouvernor', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('esx_gouverjob:buy', function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gouvernor', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)

ESX.RegisterServerCallback('esx_gouverjob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gouvernor', function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_gouverjob:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

end)

AddEventHandler('playerDropped', function()
	-- Save the source in case we lose it (which happens a lot)
	local _source = source
	
	-- Did the player ever join?
	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)
		
		-- Is it worth telling all clients to refresh?
		if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'gouvernor' then
			Citizen.Wait(5000)
			TriggerClientEvent('esx_gouverjob:updateBlip', -1)
		end
	end
end)

RegisterServerEvent('esx_gouverjob:spawned')
AddEventHandler('esx_gouverjob:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'gouvernor' then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_gouverjob:updateBlip', -1)
	end
end)

RegisterServerEvent('esx_gouverjob:forceBlip')
AddEventHandler('esx_gouverjob:forceBlip', function()
	TriggerClientEvent('esx_gouverjob:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_gouverjob:updateBlip', -1)
	end
end)

RegisterServerEvent('esx_gouverjob:message')
AddEventHandler('esx_gouverjob:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)

RegisterServerEvent('jail:teleportToJail')
AddEventHandler('jail:teleportToJail', function(t, amount)
  TriggerClientEvent('jail:teleportPlayer', t, amount)
end)



RegisterServerEvent('jail:removeInventaire')
AddEventHandler('jail:removeInventaire', function(amount)
local xPlayer = ESX.GetPlayerFromId(source)
  for i=1, #xPlayer.inventory, 1 do
    if xPlayer.inventory[i].count > 0 then
      ESX.CreatePickup('item_standard', xPlayer.inventory[i].name, xPlayer.inventory[i].count, xPlayer.inventory[i].label .. ' [' .. xPlayer.inventory[i].count .. ']', _source)
      xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
    end
  end
  xPlayer.addInventoryItem('bread', amount/60)
  xPlayer.addInventoryItem('water', amount/60)
end)

local players = {}

RegisterServerEvent("esx_gouverjob:addPlayer")
AddEventHandler("esx_gouverjob:addPlayer", function(jobName)
	local _source = source
	players[_source] = jobName
end)

AddEventHandler("playerDropped", function(reason)
	--players[_source] = nil
end)

RegisterServerEvent("esx_gouverjob:sendSonnette")
AddEventHandler("esx_gouverjob:sendSonnette", function()
	local _source = source
	for i,k in pairs(players) do
		if(k~=nil) then
			if(k == "gouvernor") then
				TriggerClientEvent("esx_gouverjob:sendRequest", i, GetPlayerName(_source), _source)
			end
		end
	end

end)

RegisterServerEvent("esx_gouverjob:sendStatusToPoeple")
AddEventHandler("esx_gouverjob:sendStatusToPoeple", function(id, status)
	TriggerClientEvent("esx_gouverjob:sendStatus", id, status)
end)