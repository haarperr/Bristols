
local wayPoints1 = {
  {
    num=0, 
    text=[[<p>Ludendorff, né le 1er octobre 1970 à Baboonitch et porté disparu dans son laboratoire le 25 décembre 2015 à North Yankton, 
    est un docteur Yankee. Il est président directeur général de l'Élite, une organisation spécialisée dans la cybernetique.
    L'Élite a souvent été mêlée à des affaires concernant le piratage informatique, mais n'a jamais été condamnée.
    Ludendorff soutient activement le mouvement cyber-socialiste depuis 1990, et s'oppose à monsieur le président Michael Townley, 
    lI se détourne de la politique en 2013 pour créer, avec sa femme, L'Élite.
    Il est également plusieurs fois prix nobel, entre autres prix nobel de médecine.</p>
    ]],
    x=3582.3896484375,
    y=-4877.0522460938, 
    z=111.93312072754,
    distance=1
  }, -- banque
}

local treasurePoints = {
  {
    num=1, 
    text=[[<p>Pacific Hunt - Treasure</p>
    <p>Vous déterrez un coffre. Il est fermé par une combinaison.</p>
    <p>Saurez-vous ouvrir le coffre et remporter mon contenu (s'il n'a pas déjà été pillé par quelqu'un d'autre!)?</p>
    ]],
    x=0,
    y=0, 
    z=0,
    distance=3
  }, -- pacific HQ
}

local treasureFound=false
local code=42891235782154318965

local codeOpen = false
local clueOpen = false
local onSpot = false

-- Open Gui and Focus NUI
function codeOpenUI(thetext)
  SetNuiFocus(true)
  SendNUIMessage({codeOpen = true, textDisplay = thetext})
  codeOpen = true
end

function clueOpenUI(thetext)
  SetNuiFocus(true)
  SendNUIMessage({clueOpen = true, textDisplay = thetext})
  clueOpen = true
end

function closeAllUI()
  SetNuiFocus(false)
  SendNUIMessage({clueOpen = false, codeOpen = false})
  codeOpen = false
  clueOpen = false
end

-- If GUI setting turned on, listen for INPUT_PICKUP keypress
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local text=IsNearWayPoint()
    if (text~="") then
      if (clueOpen==false and not IsInVehicle() and not onSpot) then
      	onSpot = true
        clueOpenUI(text);
      end
    else
   	  onSpot = false
      text = IsNearTreasure()
      if (text~="") then
		    if (IsControlJustPressed(1, 51) and not IsInVehicle()) then
  	      if codeOpen then
  	        closeAllUI()
  	      else
    		    if (treasureFound) then
    		      TriggerEvent('chatMessage', "", {0, 255, 0}, "^0Tu as déjà trouvé la cachette! Contacte William Owens (776-3110) pour savoir si tu étais le premier!");
    		    else
    		      codeOpenUI(text)
    	      end
          end
	      end
      else
        if codeOpen then
          closeAllUI()
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    if clueOpen or codeOpen then
      local ply = GetPlayerPed(-1)
      local active = true
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisableControlAction(0, 24, active) -- Attack
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
      if IsDisabledControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
        SendNUIMessage({type = "click"})
      end
    end
    Citizen.Wait(0)
  end
end)

RegisterNUICallback('close', function(data, cb)
  closeAllUI()
  cb('ok')
end)

RegisterNUICallback('codeSubmit', function(data, cb)
  if (tonumber(data.amount)==code) then
    closeAllUI()
    FoundTreasure()
  else
    closeAllUI()
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^1Biiippp... code erroné.");
  end
  cb('ok')
end)

-- Check if player is near an atm
function FoundTreasure()
  TriggerEvent('chatMessage', "", {0, 255, 0}, "");
  local id = PlayerId()
  local playerName = GetPlayerName(id)
  TriggerServerEvent("lg:pacificHuntLOG", playerName.." a ouvert le coffre")
  treasureFound=true
end

-- Check if player is near an atm
function IsNearWayPoint()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(wayPoints1) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= item.distance) then
      return item.text
    end
  end
  return ""
end

-- Check if player is in a vehicle
function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

-- Check if player is near a bank
function IsNearTreasure()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(treasurePoints) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= item.distance) then
      return item.text
    end
  end
  return ""
end