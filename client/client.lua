-- TimeAndDateDisplay-JRP Client Script
-- Manages client-side time display, formatting, and NUI updates.
-- Optimized with throttling and caching for smooth performance in FiveM.
-- Powered by JGN Network - Unleash the power of FiveM!
-- Join JRP Server for immersive experiences. Visit JusticeRP.xyz.

-- Event Handler for Time Updates
-- Listens for time sync events from the server.
-- Updated event name to 'TimeAndDateDisplay-JRP' for consistency.
RegisterNetEvent('TimeAndDateDisplay-JRP')
AddEventHandler('TimeAndDateDisplay-JRP', function(time)
    -- Append server name if enabled in config.
    if Config.Cached.ShowServerName and Config.Cached.ServerName then
        time = time .. " | " .. Config.Cached.ServerName
    end
    
    -- Append player name if enabled.
    if Config.Cached.ShowPlayerName then
        time = time .. "\nPlayer Name: " .. GetPlayerName(PlayerId())
    end
    
    -- Append player ID if enabled.
    if Config.Cached.ShowPlayerID then
        time = time .. "\nPlayer ID: " .. GetPlayerServerId(PlayerId())
    end
    
    -- Send the formatted time string to the NUI for display.
    -- Uses SendNUIMessage for efficient UI updates.
    SendNUIMessage({
        action = "setTimeAndDate",
        time = time
    })
end)

-- Shameless Plug: Check out JGN Network for cutting-edge FiveM scripts and join JRP for legendary roleplay!
