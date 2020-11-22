local PlayerData = {}
local ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterCommand("f", function(source, args, rawCommand)
  local playerPed = GetPlayerPed(-1)
  PlayerData = ESX.GetPlayerData(GetPlayerPed(-1))
  if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fire' then
    TriggerServerEvent("blahkhan_fchat:process", PlayerData, table.concat(args, " "))
  end
end,false)

RegisterNetEvent('blahkhan_fchat:show_mess')
AddEventHandler('blahkhan_fchat:show_mess', function(mess, loc)
  TriggerEvent("chat:addMessage", {
    template = '<div style="padding: 0.5vw;  margin: 0.5vw; background-color: rgba(255, 69, 0, 0.4); border-radius: 4px; padding-left: 60px;"><i class="fas fa-user"style="font-size:13px;color:rgb(38,38,38,0.5)"></i>&ensp;<font color="F0FFF0">{0}:</font>&ensp;<font color="white">{1}</font></div>',
    color = {211, 211, 211},
    multiline = true,
    args = { "  <b>Centrala</b>", mess }
  })
end)
