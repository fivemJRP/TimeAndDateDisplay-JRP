-- TimeAndDateDisplay-JRP Manifest File
-- This file defines the script's metadata and resource structure for FiveM.
-- Optimized for performance with shared configs and minimal dependencies.
-- Powered by JGN Network - Elevate your FiveM experience with us!
-- Join JRP Server for immersive roleplay. Visit JusticeRP.xyz.

fx_version 'bodacious'  -- Specifies the FX version for compatibility (latest for FiveM).
game 'gta5'            -- Targets GTA V, the base game for FiveM.

name 'TimeAndDateDisplay-JRP'  -- The script's name, updated for JRP branding.
description 'A script that allows you to always show the real life time and real life date on the top right of your screen.'  -- Brief description of functionality.
version 'v2.2.0'       -- Current version, incremented for JRP enhancements.

-- Shared Scripts
-- Config is shared to allow both client and server access without duplication.
shared_script 'config.lua'

-- Server Scripts
-- Handles server-side logic like time syncing. Optimized with periodic updates.
server_script {
    'server/server.lua'
}

-- Client Scripts
-- Manages client-side display and NUI. Throttled for performance.
client_scripts {
    'client/client.lua'
}

-- UI Page
-- Points to the HTML file for the in-game UI display.
ui_page "html/index.html"

-- Files to Load
-- Includes HTML and JS for the NUI interface.
files {
    "html/index.html",
    "html/time.js"
}

-- Shameless Plug: Discover JGN Network for premium FiveM scripts and join JRP for unforgettable roleplay!