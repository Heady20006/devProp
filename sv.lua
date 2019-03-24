RegisterServerEvent('putIn')
AddEventHandler('putIn', function(name,label,entering,inside,ipl,isSingle,isRoom,roommenu,price)

local _source = source

MySQL.Async.execute('INSERT INTO properties (name,label,entering,`exit`,inside,outside,ipls,is_single,is_room,room_menu,price) VALUES (@name,@label,@entering,@exit,@inside,@outside,@ipl,@isSingle,@isRoom,@roommenu,@price)',
	{
		['@name'] = label..name,
		['@label'] = label,
		['@entering'] = entering,
		['@exit'] = inside,
		['@inside'] = inside,
		['@outside'] = entering,
		['@ipl'] = ipl,
		['@isSingle'] = isSingle,
		['@isRoom'] = isRoom,
		['@roommenu'] = roommenu,
		['@price'] = price

	}, function (rowsChanged)
		TriggerClientEvent('esx:showNotification', _source, 'Bezeichung:'..name..'\nStraße:'..label..'\nPreis:'..price)
	end)
end)