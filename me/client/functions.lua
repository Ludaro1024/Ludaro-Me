
local DrawText3D = function(x, y, z, text, r, g, b, scale)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0, scale or 0.2)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0, 0)
    ClearDrawOrigin()
end

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
local id
local thread = false
RegisterCommand(Config.Commandname, function(source, args, rawCommand)
   
    msg = table.concat(args, " ") 
if args[1] then
TriggerServerEvent("me:ShowEveryone", msg, GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId())))
else
    notify(Translation[Config.Locale]["nomsg"])
end
end)

RegisterNetEvent('me:ShowMessage', function(msgg, idd, namee)
    debug("went through")
    if Config.ESXName then
    name = namee
    end
    id = idd
    coords = GetEntityCoords(PlayerPedId())
    local playerIdx = GetPlayerFromServerId(idd)
    local ped = GetPlayerPed(playerIdx)
   if id ~= PlayerPedId or #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(ped)) >= Config.Range then
    debug(#(GetEntityCoords(PlayerPedId()) - GetEntityCoords(PlayerPedId(ped))))
    debug(GetEntityCoords(PlayerPedId()))
    debug(GetEntityCoords(ped))
    debug(thread)
    msg = msgg

    if thread == false then
        thread = true
        Citizen.Wait(Config.ShowTime)
        thread = false
    else
        thread = false
    end
   else
    debug(#(GetEntityCoords(PlayerPedId()) - GetEntityCoords(id)))
end
end)
  

Citizen.CreateThread(function()
    while true do
        Wait(0)
 if id and thread then
    if Config.ESXName then
    --lib.callback("me:getName", delay, cb, ...)
    local playerIdx = GetPlayerFromServerId(id)
    local ped = GetPlayerPed(playerIdx)
    

    local headPos = GetPedBoneCoords(ped, 0x796E, 0, 0, 0)
    DrawText3D(headPos.x, headPos.y, headPos.z + 0.3,
    string.format(Translation[Config.Locale]["said"], name, msg), 255, 255, 255,
    0.25)
    else
        local playerIdx = GetPlayerFromServerId(id)
        local ped = GetPlayerPed(playerIdx)
        
    
        local headPos = GetPedBoneCoords(ped, 0x796E, 0, 0, 0)
        DrawText3D(headPos.x, headPos.y, headPos.z + 0.3,
        string.format(Translation[Config.Locale]["said"], GetPlayerName(playerIdx), msg), 255, 255, 255,
        0.25)
    end
    end
    end
end)