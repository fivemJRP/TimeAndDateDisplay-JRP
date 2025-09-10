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
    while true do
        Citizen.Wait(60000)  -- Sync time every 60 seconds to reduce network overhead
        -- Get server time with offset
        local time = os.date("%d-%m-%Y %H:%M", os.time() + (Config.TimezoneOffset * 3600))
        -- Send to all clients
        TriggerClientEvent('TimeAndDateDisplay-JRP', -1, time)
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
