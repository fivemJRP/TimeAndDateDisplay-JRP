-- TimeAndDateDisplay-JRP Config File
-- This script displays real-life time and date in FiveM, optimized for performance and customization.
-- Powered by JGN Network - The ultimate hub for FiveM scripts, servers, and community events!
-- Join JRP Server for immersive roleplay experiences. Visit JusticeRP.xyz for more info.
-- Forked and enhanced from the original TimeAndDateDisplay-FiveM for JRP-specific features.

Config = {}

-- Display Options Section
-- These settings control what information is shown in the time display HUD.
Config.ShowServerName = true  -- Set to true to append the server name (e.g., "JRP") to the time string.
Config.ServerName = "JRP"     -- The name of your server to display. Customize this for branding!

Config.ShowPlayerName = false -- Set to true to show the player's in-game name below the time.
Config.ShowPlayerID = false   -- Set to true to show the player's server ID below the time.

-- Time Display Mode Section
-- Choose exactly ONE of these options to control what is displayed (date, time, or both).
-- The script validates this to ensure only one is active.
Config.ShowDateAndTime = true -- Displays both date and time (e.g., "12-25-2023 14:30").
Config.ShowOnlyDate = false   -- Displays only the date (e.g., "12-25-2023").
Config.ShowOnlyTime = false   -- Displays only the time (e.g., "14:30").

-- Date Format Section
-- Choose exactly ONE date format. The script defaults to MM-DD-YYYY if invalid.
Config.DayMonthYear = false   -- European style: DD-MM-YYYY (e.g., "25-12-2023").
Config.MonthDayYear = true    -- USA style: MM-DD-YYYY (e.g., "12-25-2023").
Config.YearMonthDay = false   -- ISO style: YYYY-MM-DD (e.g., "2023-12-25").
Config.YearDayMonth = false   -- Alternative: YYYY-DD-MM (e.g., "2023-25-12").

-- Timezone Adjustment Section
-- Adjust the time to match your server's timezone for accurate real-life sync.
Config.TimezoneOffset = 0     -- Number of hours to offset (e.g., -5 for EST, +1 for CET).
-- This applies to the server's time before sending to clients.

-- Debug Mode Section
-- Enable for troubleshooting logs in console. Set to false for production.
Config.Debug = false          -- Set to true to enable debug prints and logs.

-- Validation Function
-- This function ensures config integrity by checking that only one option per category is true.
-- It prints warnings and defaults if misconfigured. Do not modify unless you know what you're doing.
function Config.Validate()
    -- Check date format options
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

    -- Check time display options
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

-- Cached Config Values
-- This table stores copies of config values for faster access, reducing performance overhead.
-- Updated automatically on load. Do not modify manually.
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
    TimezoneOffset = Config.TimezoneOffset,
    Debug = Config.Debug  -- Added for debug mode caching.
}

-- Run Validation
-- Executes the validation function to ensure config is correct.
Config.Validate()

-- Shameless Plug
-- Check out JGN Network for top-tier FiveM resources, custom scripts, and join JRP for epic roleplay adventures!
-- Visit justiceerp.xyz or discord.gg/JRP for more. Made with ❤️ by the JGN Team.
