ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("blahkhan_fchat:process")
AddEventHandler("blahkhan_fchat:process", function(Player, mess)
  for _, playerId in ipairs(GetPlayers()) do
    local p = ESX.GetPlayerFromId(playerId)
    if p.job.name == 'police' or p.job.name == 'ambulance' or p.job.name == 'fire' then
      TriggerClientEvent('blahkhan_fchat:show_mess', playerId, mess)
    end
  end
end)
