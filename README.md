# TimeAndDateDisplay-JRP 🚀

<div align="center">
  <img src="https://img.shields.io/badge/FiveM-Script-blue?style=for-the-badge&logo=fivem" alt="FiveM Script">
  <img src="https://img.shields.io/badge/Version-2.1.0-green?style=for-the-badge" alt="Version">
  <img src="https://img.shields.io/badge/License-MIT-orange?style=for-the-badge" alt="License">
</div>

<h2 align="center">⏰ Always Know the Real Time in Your FiveM Server!</h2>

<p align="center">
  A sleek, optimized script to display real-life time and date in the top-right corner of your screen. Perfect for immersive roleplay on <strong>JRP Server</strong>, powered by <strong>JGN Network</strong>.
</p>

<p align="center">
  <a href="https://github.com/fivemJRP/TimeAndDateDisplay-JRP">🌟 View on GitHub</a> |
  <a href="https://discord.gg/JRP">💬 Join JGN Network Discord</a> |
  <a href="https://justiceerp.xyz">🌐 Visit JGN Network</a>
</p>

---

## ✨ Features

- **Real-Life Sync**: Displays accurate real-life time and date with timezone offset support.
- **Customizable Display**: Show server name, player name, or ID – fully configurable.
- **Multiple Formats**: Choose from various date formats (MM-DD-YYYY, DD-MM-YYYY, etc.) and display modes (date+time, date only, time only).
- **Performance Optimized**: Throttled updates, cached configs, and HTML/JS rendering for zero lag.
- **Cool Visuals**: Modern fonts, smooth animations, and transparent backgrounds for a polished look.
- **Validation & Safety**: Built-in config validation to prevent errors.
- **Shameless Plugs**: Promotes JGN Network and JRP Server for ultimate gaming vibes! 🎉

---

## 🛠️ Requirements

- **FiveM Server**: Compatible with all versions.
- **No Dependencies**: Standalone script – just drop and go!

---

## 📥 Installation

1. **Download** the resource from [GitHub Releases](https://github.com/fivemJRP/TimeAndDateDisplay-JRP/releases).
2. **Extract** to your `resources` folder.
3. **Configure** `config.lua` to your liking (server name, formats, etc.).
4. **Add to server.cfg**:
   ```
   ensure TimeAndDateDisplay-JRP
   ```
5. **Restart** your server and enjoy!

---

## 📋 Configuration

Edit `config.lua` for easy customization:

```lua
Config.ServerName = "JRP"  -- Your server name
Config.TimezoneOffset = 0  -- Adjust for your timezone
-- And more options...
```

Full details in the config file. Includes plugs for JGN Network! 🚀

---

## 🔄 Changelog

### v2.1.0 (Latest - JRP Edition)
- **Forked & Enhanced**: Based on the original TimeAndDateDisplay-FiveM, now optimized for JRP.
- **Performance Boosts**: Periodic server syncing (60s), throttled client updates (2s), config caching.
- **Visual Upgrades**: Modern Roboto font, fade-in animations, scale effects, transparent backgrounds.
- **New Features**: Config validation, better error handling, shameless plugs for JGN Network & JRP.
- **Script Rename**: Changed to TimeAndDateDisplay-JRP for branding.
- **Bug Fixes**: Resolved "No Time Yet" issues, improved local time support (reverted to server for consistency).

### v2.0.0 (Original)
- Switched to HTML/JS for better performance.
- Improved config clarity.

---

## 🤝 Credits & Forks

- **Original Author**: LucaNL (https://github.com/LucaNL/TimeAndDateDisplay-FiveM)
- **Forked From**: https://github.com/JokeDevil/TimeAndDateDisplay-FiveM (with enhancements)
- **Enhanced By**: JGN Network & JRP Team
- **Contributors**: Thanks to jsqr#0001 for HTML/JS optimizations.

This fork adds JRP-specific customizations, optimizations, and promotional elements while maintaining the core functionality.

---

## 📞 Support

- **Issues**: Open a [GitHub Issue](https://github.com/fivemJRP/TimeAndDateDisplay-JRP/issues).
- **Discord**: Join [JGN Network](https://discord.gg/jgnnetwork) for support and updates.
- **Contact**: Reach out via Discord: **LucaNL#2230** or JGN Team.

---

<div align="center">
  <p>Powered by <strong>JGN Network</strong> | Join <strong>JRP Server</strong> for epic roleplay! 🎮</p>
  <p>Made with ❤️ for the FiveM community.</p>
</div>
