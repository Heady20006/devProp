local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local zones = { 
['AIRP'] = "Los Santos International Airport",
['ALAMO'] = "Alamo Sea", 
['ALTA'] = "Alta", 
['ARMYB'] = "Fort Zancudo", 
['BANHAMC'] = "Banham Canyon Dr", 
['BANNING'] = "Banning", 
['BEACH'] = "Vespucci Beach", 
['BHAMCA'] = "Banham Canyon", 
['BRADP'] = "Braddock Pass", 
['BRADT'] = "Braddock Tunnel", 
['BURTON'] = "Burton", 
['CALAFB'] = "Calafia Bridge", 
['CANNY'] = "Raton Canyon", 
['CCREAK'] = "Cassidy Creek", 
['CHAMH'] = "Chamberlain Hills", 
['CHIL'] = "Vinewood Hills", 
['CHU'] = "Chumash", 
['CMSW'] = "Chiliad Mountain State Wilderness", 
['CYPRE'] = "Cypress Flats", 
['DAVIS'] = "Davis", 
['DELBE'] = "Del Perro Beach", 
['DELPE'] = "Del Perro", 
['DELSOL'] = "La Puerta", 
['DESRT'] = "Grand Senora Desert", 
['DOWNT'] = "Downtown", 
['DTVINE'] = "Downtown Vinewood", 
['EAST_V'] = "East Vinewood", 
['EBURO'] = "El Burro Heights", 
['ELGORL'] = "El Gordo Lighthouse", 
['ELYSIAN'] = "Elysian Island", 
['GALFISH'] = "Galilee", 
['GOLF'] = "GWC and Golfing Society", 
['GRAPES'] = "Grapeseed", 
['GREATC'] = "Great Chaparral", 
['HARMO'] = "Harmony", 
['HAWICK'] = "Hawick", 
['HORS'] = "Vinewood Racetrack", 
['HUMLAB'] = "Humane Labs and Research", 
['JAIL'] = "Bolingbroke Penitentiary", 
['KOREAT'] = "Little Seoul", 
['LACT'] = "Land Act Reservoir", 
['LAGO'] = "Lago Zancudo", 
['LDAM'] = "Land Act Dam", 
['LEGSQU'] = "Legion Square", 
['LMESA'] = "La Mesa", 
['LOSPUER'] = "La Puerta", 
['MIRR'] = "Mirror Park", 
['MORN'] = "Morningwood", 
['MOVIE'] = "Richards Majestic", 
['MTCHIL'] = "Mount Chiliad", 
['MTGORDO'] = "Mount Gordo", 
['MTJOSE'] = "Mount Josiah", 
['MURRI'] = "Murrieta Heights", 
['NCHU'] = "North Chumash", 
['NOOSE'] = "N.O.O.S.E", 
['OCEANA'] = "Pacific Ocean", 
['PALCOV'] = "Paleto Cove", 
['PALETO'] = "Paleto Bay", 
['PALFOR'] = "Paleto Forest", 
['PALHIGH'] = "Palomino Highlands", 
['PALMPOW'] = "Palmer-Taylor Power Station", 
['PBLUFF'] = "Pacific Bluffs", 
['PBOX'] = "Pillbox Hill", 
['PROCOB'] = "Procopio Beach", 
['RANCHO'] = "Rancho", 
['RGLEN'] = "Richman Glen", 
['RICHM'] = "Richman", 
['ROCKF'] = "Rockford Hills", 
['RTRAK'] = "Redwood Lights Track", 
['SANAND'] = "San Andreas", 
['SANCHIA'] = "San Chianski Mountain Range", 
['SANDY'] = "Sandy Shores", 
['SKID'] = "Mission Row", 
['SLAB'] = "Stab City", 
['STAD'] = "Maze Bank Arena", 
['STRAW'] = "Strawberry", 
['TATAMO'] = "Tataviam Mountains", 
['TERMINA'] = "Terminal", 
['TEXTI'] = "Textile City", 
['TONGVAH'] = "Tongva Hills", 
['TONGVAV'] = "Tongva Valley", 
['VCANA'] = "Vespucci Canals", 
['VESP'] = "Vespucci", 
['VINE'] = "Vinewood",
['WINDF'] = "Ron Alternates Wind Farm", 
['WVINE'] = "West Vinewood",
['ZANCUDO'] = "Zancudo River",
['ZP_ORT'] = "Port of South Los Santos", 
['ZQ_UAR'] = "Davis Quartz" 
}
local i = 1

local price_low1 = 125000
local price_med1 = 560000
local price_high1 = 850000
local price_lux1 = 1300000
local price_lux2 = 1300000
local price_lux3 = 1300000
local price_motel = 43750

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsControlJustReleased(0, Keys['L']) then
			local pos = GetEntityCoords(GetPlayerPed(-1))
			local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]
			local label = GetStreetNameFromHashKey(var1)
			local entering = '{\"x\":'..pos.x..',\"y\":'..pos.y..',\"z\":'..pos.z..'}'
			local ipl = '[]'
		
			DisplayOnscreenKeyboard(1, "", "", "", "1=Low 1\n2=Middle 1\n3=High 1\n4=Luxus 1\n5=Luxus 2\n6=Luxus 3\n7=Motel\n", "", "", 600)
			while (UpdateOnscreenKeyboard() == 0) do
				DisableAllControlActions(0);
				Wait(0);
			end
			if (GetOnscreenKeyboardResult()) then
				interieur = GetOnscreenKeyboardResult()
				interieur = string.gsub(interieur, '1=Low 1\n2=Middle 1\n3=High 1\n4=Luxus 1\n5=Luxus 2\n6=Luxus 3\n7=Motel\n', '')
				interieur = tonumber(interieur)
				Citizen.Wait(50)

				if interieur == 1 then
					inside = '{"x":265.307,"y":-1002.802,"z":-100.008}'
					roommenu = '{"x":265.916,"y":-999.38,"z":-100.008}'
					price = math.random(price_low1,price_low1*1.25)
					isSingle = 1
					isRoom = 0
					name = 'LowApartment'..i
				elseif interieur == 2 then
					inside = '{"x":-612.16,"y":59.06,"z":97.2}'
					roommenu = '{"x":-622.173,"y":54.585,"z":96.599}'
					price = math.random(price_med1,price_med1*1.35)
					isSingle = 1
					isRoom = 0
					name = 'MedApartment'..i
				elseif interieur == 3 then
					inside = '{"x":-1459.17,"y":-520.58,"z":55.929}'
					roommenu = '{"x":-1457.026,"y":-530.219,"z":55.937}'
					price = math.random(price_high1,price_high1*1.55)
					isSingle = 1
					isRoom = 0
					name = 'HigApartment'..i
				elseif interieur == 4 then
					inside = '{"x":-680.124,"y":590.608,"z":144.392}'
					roommenu = '{"x":-680.46,"y":588.6,"z":136.769}'
					price = math.random(price_lux1,price_lux1*1.85)
					isSingle = 1
					isRoom = 0
					name = 'LuxApartment'..i
				elseif interieur == 5 then
					inside = '{"x":118.037,"y":557.032,"z":183.301}'
					roommenu = '{"x":118.748,"y":566.573,"z":175.697}'
					price = math.random(price_lux2,price_lux2*1.85)
					isSingle = 1
					isRoom = 0
					name = 'LuxApartment'..i
				elseif interieur == 6 then
					inside = '{"x":-781.64,"y":319.48,"z":186.913}'
					roommenu = '{"x":-795.735,"y":326.757,"z":186.313}'
					price = math.random(price_lux3,price_lux3*1.85)
					isSingle = 1
					isRoom = 0
					name = 'LuxApartment'..i
					ipl = '["apa_v_mp_h_01_c"]'
				elseif interieur == 7 then
					inside = '{"x":151.45,"y":-1007.57,"z":-100.00}'
					roommenu = ''
					price = price_motel
					isSingle = 1
					isRoom = 1
					name = 'Motel'..i
					ipl = '["hei_hw1_blimp_interior_v_motel_mp_milo_"]'
				end

				TriggerServerEvent('putIn',name,label,entering,inside,ipl,isSingle,isRoom,roommenu,price)
				i = i + 1
			end
		end
	end
end)