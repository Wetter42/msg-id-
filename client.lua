RegisterCommand('msg', function(source, args)
        local clientId = tonumber(args[1])
        if args[2] == nil then
                TriggerEvent('chatMessage', '[msg]Usage: /msg (playerid) (message you wanna send)')
        else
        if clientId == nil then
                TriggerEvent('chatMessage', '[msg]Either that player is offline, or you\'ve selected the wrong id.  Try again!')
        else
        local msgcnts = table.concat(args, " ", 2)
        TriggerEvent('msg:sendToPlayer', clientId, msgcnts)
        end
        end
end, false)


        RegisterCommand('r', function(source, args)
                local msgcnts = table.concat(args, " ", 1)
                if ( identifier == nil ) then
                        print('No one to reply to yet :\'(')
                else
                        TriggerEvent('msg:sendToPlayer', identifier, msgcnts)
                end
        end, false)


RegisterNetEvent('msg:sendToPlayer')
AddEventHandler('msg:sendToPlayer', function(clientId, message)
        TriggerServerEvent('msg:deliverToPlayer', clientId, message)
end)

RegisterNetEvent('msg:showMessage')
AddEventHandler('msg:showMessage', function(message)
        TriggerEvent('chatMessage', message)
end)


RegisterNetEvent('msg:replies')
AddEventHandler('msg:replies', function(id)
         identifier = tonumber(id)
end)
