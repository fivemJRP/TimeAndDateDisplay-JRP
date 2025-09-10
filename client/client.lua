RegisterNetEvent('TimeAndDateDisplay-JRP')
AddEventHandler('TimeAndDateDisplay-JRP', function(time)
    if Config.Cached.ShowServerName and Config.Cached.ServerName then
        time = time .." | " .. Config.Cached.ServerName
    end
    if Config.Cached.ShowPlayerName then
        time = time .."\nPlayer Name: " .. GetPlayerName(PlayerId())
    end
    if Config.Cached.ShowPlayerID then
        time = time .."\nPlayer ID: " .. GetPlayerServerId(PlayerId())
    end
    SendNUIMessage({
        action = "setTimeAndDate",
        time = time
    })
end)
