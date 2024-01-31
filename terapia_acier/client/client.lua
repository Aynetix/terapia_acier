local player = PlayerPedId()
local coords = GetEntityCoords(PlayerPedId())

print ("^5Crée par : aynetix") 
print ("^3Discord  : https://discord.gg/48p6XeVPMt") 


Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		for k,v in pairs(Config.recolteacier) do
		local coords = GetEntityCoords(PlayerPedId())
		local player = PlayerPedId()
	
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 5.0) then
				DrawMarker(2, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 254, 234, 170, 0, 1, 2, 0, nil, nil, 0)
				AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~récolter de l'acier")
				DisplayHelpTextThisFrame("HELP", true)
                if IsControlJustPressed(1, 51) then			
					ESX.ShowNotification("Récolte en cours...", "error", Config.tempsrecolteacier - 1000)
					recolteacier()
					Citizen.Wait(Config.tempsrecolteacier)
				end
			end
		end
	end
end)

function recolteacier()
local player = PlayerPedId()
        ExecuteCommand('e kneel2')
		exports["rs_prog"]:AfficherProgressbar(Config.tempsrecolteacier)
		Citizen.Wait(Config.tempsrecolteacier * 1000)
		exports["rs_prog"]:CacherProgressbar()
		ClearPedTasksImmediately(player)
        TriggerServerEvent('terapia_acier:giveacier')
		Citizen.Wait(1000)
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		for k,v in pairs(Config.traitementacier) do
		local coords = GetEntityCoords(PlayerPedId())
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2.0) then
				DrawMarker(2, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 254, 234, 170, 0, 1, 2, 0, nil, nil, 0)
				AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~ pour ~g~traiter l'acier")
				DisplayHelpTextThisFrame("HELP", true)
                if IsControlJustPressed(1, 51) then			
					ESX.ShowNotification("Traitement en cours...", "error", Config.tempstraitementacier - 1000)
					traitementacier()
					Citizen.Wait(Config.tempstraitementacier)		
				end 
			end
		end
	end
end)

function traitementacier()
local player = PlayerPedId()
        ExecuteCommand('e parkingmeter')
		exports["rs_prog"]:AfficherProgressbar(Config.tempstraitementacier)
		Citizen.Wait(Config.tempstraitementacier * 1000)
		exports["rs_prog"]:CacherProgressbar()
		ClearPedTasksImmediately(player)
        TriggerServerEvent('terapia_acier:giveaciertraité')
		Citizen.Wait(1000)
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(500)
		for k,v in pairs(Config.reventeacier) do
		local coords = GetEntityCoords(PlayerPedId())
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2.0) then	
					TriggerServerEvent('terapia_acier:reventeacier')
			end
		end
	end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_prolhost_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_m_prolhost_01", 1189.128, -3108.056, 4.525, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

local v1 = vector3(1189.128, -3108.056, 4.525)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "~p~ Vendre acier")
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_dockwork_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_m_dockwork_01", 981.967, -1921.228, 30.134, 98.684, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

local v2 = vector3(982.28, -1921.228, 30.134)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v2) < distance then
            Draw3DText(v2.x,v2.y,v2.z, "~p~ Traite l'acier")
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_dockwork_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_m_dockwork_01", 95.848, -385.923, 40.252, -112.540, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

local v3 = vector3(95.848, -385.923, 40.280)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v3) < distance then
            Draw3DText(v3.x,v3.y,v3.z, "~p~ Récolter l'acier")
        end
    end
end)
Citizen.CreateThread(function()
	
	for i=1, #Config.Map, 1 do
		
		local blip = AddBlipForCoord(Config.Map[i].x, Config.Map[i].y, Config.Map[i].z)
		SetBlipSprite (blip, Config.Map[i].id)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.Map[i].color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Map[i].name)
		EndTextCommandSetBlipName(blip)
	end

end)
