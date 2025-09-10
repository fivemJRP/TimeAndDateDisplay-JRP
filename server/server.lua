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
        local now = os.date("*t", os.time() + (Config.TimezoneOffset * 3600))
        
        -- Format the time and date based on config options.
        local timeStr = ""
        if Config.ShowDateAndTime then
            if Config.MonthDayYear then
                timeStr = string.format("%02d-%02d-%04d %02d:%02d", now.month, now.day, now.year, now.hour, now.min)
            elseif Config.DayMonthYear then
                timeStr = string.format("%02d-%02d-%04d %02d:%02d", now.day, now.month, now.year, now.hour, now.min)
            elseif Config.YearMonthDay then
                timeStr = string.format("%04d-%02d-%02d %02d:%02d", now.year, now.month, now.day, now.hour, now.min)
            elseif Config.YearDayMonth then
                timeStr = string.format("%04d-%02d-%02d %02d:%02d", now.year, now.day, now.month, now.hour, now.min)
            end
        elseif Config.ShowOnlyDate then
            if Config.MonthDayYear then
                timeStr = string.format("%02d-%02d-%04d", now.month, now.day, now.year)
            elseif Config.DayMonthYear then
                timeStr = string.format("%02d-%02d-%04d", now.day, now.month, now.year)
            elseif Config.YearMonthDay then
                timeStr = string.format("%04d-%02d-%02d", now.year, now.month, now.day)
            elseif Config.YearDayMonth then
                timeStr = string.format("%04d-%02d-%02d", now.year, now.day, now.month)
            end
        elseif Config.ShowOnlyTime then
            timeStr = string.format("%02d:%02d", now.hour, now.min)
        end
        
        -- Send the formatted time to all clients via a network event.
        -- Event name updated to 'TimeAndDateDisplay-JRP' for branding.
        TriggerClientEvent('TimeAndDateDisplay-JRP', -1, timeStr)
        
        -- Log the sync for debugging and monitoring.
        -- Helps track if the script is running correctly.
        if Config.Debug then
            print("[TimeAndDateDisplay-JRP] Time synced at " .. timeStr)
        end
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
