--[[
    COPYRIGHT (C) 2023 Synthex Development. ALL RIGHTS RESERVED.
    DO NOT DISTRIBUTE WITHOUT PERMISSION.
    Email: hhype.vibez@gmail.com
]]

RegisterCommand("clearchat", function(source, args)
    local src = source
    if IsPlayerAceAllowed(source, Config.ChatClearPermission) then
        TriggerClientEvent("chat:client:ClearChat", -1)
        Citizen.Wait(10)
        local user = GetPlayerName(src)
        local message = string.format("Chat cleared by admin: %s", user)
        TriggerClientEvent('chat:addMessage', -1, {
            color = {255, 0, 0},
            multiline = true,
            args = {"SYSTEM", message}
        })

        local informNotification = {
            type = 'inform',
            text = 'Chat has been cleared by admin: ' .. user,
            style = Config.ClearChatNotification.InformStyle
        }
        TriggerClientEvent('mythic_notify:client:SendAlert', src, informNotification)
        
        print(string.format("[Chat Clear] Admin %s cleared the chat.", user))
    else
        local errorNotification = {
            type = 'error',
            text = 'Access Denied For Command Clearchat',
            style = style
        }
        TriggerClientEvent('mythic_notify:client:SendAlert', src, errorNotification)
    end
end, false)