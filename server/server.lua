-- TimeAndDateDisplay-JRP Server Script
-- Handles server-side time synchronization for all clients.
-- Optimized with periodic syncing to reduce network load and improve performance.
-- Powered by JGN Network - The best in FiveM innovation!
-- Join JRP Server for top-tier roleplay. Visit JusticeRP.xyz.

function getTime()
    if Config.ShowDateAndTime or (Config.ShowOnlyDate and Config.ShowOnlyTime) then
        if Config.DayMonthYear then
            return os.date("%d-%m-%Y at %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.MonthDayYear then
            return os.date("%m-%d-%Y at %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.YearMonthDay then
            return os.date("%Y-%m-%d at %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.YearDayMonth then
            return os.date("%Y-%d-%m at %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        else
            return os.date("%d-%m-%Y at %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
        end
    elseif Config.ShowOnlyTime then
        return os.date("%H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
    elseif Config.ShowOnlyDate then
        if Config.DayMonthYear then
            return os.date("%d-%m-%Y", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.MonthDayYear then
            return os.date("%m-%d-%Y", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.YearMonthDay then
            return os.date("%Y-%m-%d", os.time() + Config.TimezoneOffset * 60 * 60)
        elseif Config.YearDayMonth then
            return os.date("%Y-%d-%m", os.time() + Config.TimezoneOffset * 60 * 60)
        else
            return os.date("%d-%m-%Y", os.time() + Config.TimezoneOffset * 60 * 60)
        end
    else
        print('Config.ShowDateAndTime or Config.ShowOnlyDate or Config.ShowOnlyTime must to be set to true in the config.')
        return os.date("%d-%m-%Y at %H:%M", os.time() + Config.TimezoneOffset * 60 * 60)
    end
end

Citizen.CreateThread(function()
    -- Main time sync loop: Runs every 60 seconds to sync real-life time with timezone offset.
    -- This reduces server load compared to constant updates.
    while true do
        Citizen.Wait(60000)  -- Wait 60 seconds between syncs for efficiency.
        
        -- Get the current server time, adjusted by the timezone offset from config.
        -- Uses os.date for accurate real-life time.
        local time = os.date("%d-%m-%Y %H:%M", os.time() + (Config.TimezoneOffset * 3600))
        
        -- Send the formatted time to all clients via a network event.
        -- Event name updated to 'TimeAndDateDisplay-JRP' for branding.
        TriggerClientEvent('TimeAndDateDisplay-JRP', -1, time)
        
        -- Log the sync for debugging and monitoring.
        -- Helps track if the script is running correctly.
        print("[TimeAndDateDisplay-JRP] Time synced at " .. time)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Wait(2500)
        TriggerClientEvent('TimeAndDateDisplay-JRP', -1, getTime())
    end
end)
  

AddEventHandler("playerJoining", function (data)
    TriggerClientEvent('TimeAndDateDisplay-JRP', source, getTime())
end)

-- Shameless Plug: Explore JGN Network for advanced FiveM tools and dive into JRP for epic adventures!
