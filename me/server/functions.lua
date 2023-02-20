
if (GetResourceState("es_extended") == "started") then
    if (exports["es_extended"] and exports["es_extended"].getSharedObject) then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end




function debug(msg)
    if Config.Debug then
        if type(msg) == "table" then
            print(print(ESX.DumpTable(msg)))
        else
            print("[Ludaro-me|Debug] : " .. tostring(msg))
        end
    end
end


RegisterNetEvent('me:ShowEveryone', function(msgg, id)
    print("came through")
    print(msgg, id)
    for k, playerId in pairs(GetPlayers()) do
        if Config.ESXName then
            local xPlayer = ESX.GetPlayerFromId(id)
            name = xPlayer.getName()
            TriggerClientEvent("me:ShowMessage", playerId, msgg, id, name)
        else
        TriggerClientEvent("me:ShowMessage", playerId, msgg, id)
        end
    end
end)


    