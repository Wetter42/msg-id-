RegisterServerEvent('msg:deliverToPlayer')
AddEventHandler('msg:deliverToPlayer', function(clientId, message)
        if ( source == clientId ) then
                TriggerClientEvent('chatMessage', source, '[msg]You can\'t send messages to yourself ya ding goobus!')
        elseif ( GetPlayerName(clientId) == nil  ) then
                TriggerClientEvent('chatMessage', source, '[msg]Either that player is offline, or you\'ve selected the wrong id.  Try again!')
        else
                TriggerClientEvent('msg:showMessage', clientId, 'From ' .. GetPlayerName(source) .. ': ' .. message)
                print(GetPlayerName(source) .. '(ID: ' .. source .. ') >> ' .. GetPlayerName(clientId) .. '(ID: ' .. source .. '): ' .. message)
                local id = source
                TriggerClientEvent('msg:replies', clientId, id)
        end
end)
