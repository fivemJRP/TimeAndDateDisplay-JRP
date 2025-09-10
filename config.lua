-- TimeAndDateDisplay Config for JRP Server
-- Powered by JGN Network - Join the ultimate gaming experience!
-- Visit JGN Network for more FiveM scripts and community events.
-- Server: JRP - Roleplay your way in our immersive world.

Config = {}

-- Display Options
Config.ShowServerName = true  -- Enable to display the server name
Config.ServerName = "JRP"     -- Server name to show (e.g., "JRP")

Config.ShowPlayerName = false -- Enable to display the player's name
Config.ShowPlayerID = false   -- Enable to display the player's server ID

-- Time Display Mode (Choose ONE)
Config.ShowDateAndTime = true -- Show both date and time
Config.ShowOnlyDate = false   -- Show only the date
Config.ShowOnlyTime = false   -- Show only the time

-- Date Format (Choose ONE)
Config.DayMonthYear = false   -- Format: DD-MM-YYYY
Config.MonthDayYear = true    -- Format: MM-DD-YYYY (USA style)
Config.YearMonthDay = false   -- Format: YYYY-MM-DD
Config.YearDayMonth = false   -- Format: YYYY-DD-MM

-- Timezone Adjustment
Config.TimezoneOffset = 0     -- Offset in hours (e.g., -1 for EST, +1 for CET)
-- Note: Adjust based on your server's location for accurate display.

-- Validation Function (Do not modify)
function Config.Validate()
    local dateOptions = {Config.DayMonthYear, Config.MonthDayYear, Config.YearMonthDay, Config.YearDayMonth}
    local trueCount = 0
    for _, v in ipairs(dateOptions) do
        if v then trueCount = trueCount + 1 end
    end
    if trueCount ~= 1 then
        print("[TimeAndDateDisplay-JRP] Warning: Exactly one date format must be true. Defaulting to MonthDayYear.")
        Config.DayMonthYear = false
        Config.MonthDayYear = true
        Config.YearMonthDay = false
        Config.YearDayMonth = false
    end

    local timeOptions = {Config.ShowDateAndTime, Config.ShowOnlyDate, Config.ShowOnlyTime}
    trueCount = 0
    for _, v in ipairs(timeOptions) do
        if v then trueCount = trueCount + 1 end
    end
    if trueCount ~= 1 then
        print("[TimeAndDateDisplay-JRP] Warning: Exactly one time display option must be true. Defaulting to ShowDateAndTime.")
        Config.ShowDateAndTime = true
        Config.ShowOnlyDate = false
        Config.ShowOnlyTime = false
    end
end

-- Cached Config Values (Do not modify)
Config.Cached = {
    ShowServerName = Config.ShowServerName,
    ServerName = Config.ServerName,
    ShowPlayerName = Config.ShowPlayerName,
    ShowPlayerID = Config.ShowPlayerID,
    ShowDateAndTime = Config.ShowDateAndTime,
    ShowOnlyDate = Config.ShowOnlyDate,
    ShowOnlyTime = Config.ShowOnlyTime,
    DayMonthYear = Config.DayMonthYear,
    MonthDayYear = Config.MonthDayYear,
    YearMonthDay = Config.YearMonthDay,
    YearDayMonth = Config.YearDayMonth,
    TimezoneOffset = Config.TimezoneOffset
}

-- Run Validation
Config.Validate()

-- Shameless Plug: Check out JGN Network for top-tier FiveM resources and join JRP for epic roleplay!
