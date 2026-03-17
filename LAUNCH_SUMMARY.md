# 🌾 Nvil - Stardew Valley Edition - Launch Summary

## ✅ Successfully Pushed to GitHub!

**Repository**: https://github.com/Bencode12/Nvil.git

---

## 🎨 What's Been Created

### Complete Stardew Valley Themed Neovim Configuration

Your Nvil configuration has been completely rebuilt from scratch with a beautiful **Stardew Valley** theme!

---

## 🏘️ Key Features

### 1. **Seasonal Dashboard Themes** 🌸☀️🍂️
- **Spring**: Cherry blossom pink & fresh green colors
- **Summer**: Sun gold & watermelon red
- **Fall**: Pumpkin orange & wood brown  
- **Winter**: Light cyan & powder blue

### 2. **Farming Level System** 🌾
- Track your coding progress like farming levels in Stardew Valley
- Gain XP as you code
- Check your level with `<Space>xp`
- Levels: Greenhorn → Cowpoke → Farmer → Artisan → Tiller → Master Farmer → Legendary Farmer

### 3. **Cozy ASCII Art** 🏠
- Beautiful village-themed startup screen
- Multiple logo styles: village, farm, town, community
- Pastoral aesthetic with wooden textures and greenery

### 4. **Daily Messages** 💬
- Inspirational quotes from Pelican Town
- Changes daily to keep you motivated
- Examples:
  - "🌟 'Your coding adventure begins!'"
  - "🌾 'Plant code seeds, harvest success'"
  - "💎 'May your bugs be few and features many'"

---

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                          # Main entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua                  # Plugin manager setup
│   │   ├── keymaps.lua               # Key bindings
│   │   └── options.lua               # Neovim options
│   └── plugins/
│       ├── settings.lua              # Settings UI
│       └── stardew-dashboard.lua     # Themed dashboard
├── README.md                         # Full documentation
├── LICENSE                           # MIT License
└── install.sh                        # Installation script
```

---

## 🎮 Quick Start Guide

### First Time Setup

```bash
# The config is already installed at ~/.config/nvim
# Just start Neovim!
nvim
```

### Essential Keybindings

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>f` | Find Files | Search for files |
| `<Space>r` | Recent Files | Open recent files |
| `<Space>s` | Settings | Open settings menu |
| `<Space>pi` | Plugins | Plugin manager |
| `<Space>q` | Quit | Exit Neovim |
| `<Space>xp` | Check XP | View farming level |

---

## 🌸 Seasonal Theme System

The dashboard automatically detects the current season:

```lua
-- Current season detection
Spring: March-May
Summer: June-August  
Fall: September-November
Winter: December-February
```

Each season has:
- Unique color palette
- Different ASCII art logo
- Special themed messages

---

## 🎯 Farming Level Progression

| Level Range | Title | Description |
|-------------|-------|-------------|
| 1-9 | Greenhorn | Just starting your journey |
| 10-19 | Cowpoke | Learning the ropes |
| 20-39 | Farmer | Getting comfortable |
| 40-59 | Artisan | Skilled coder |
| 60-79 | Tiller | Master of crafts |
| 80-99 | Master Farmer | Expert level |
| 100 | Legendary Farmer | Ultimate mastery |

---

## 🎨 Dashboard Layout

```
   ╔═══════════════════════════════════════════╗
   ║  🌾  WELCOME TO NVIL VILLAGE  🌾          ║
   ║                                           ║
   ║      🏠        🌾                   ║
       ═══════════════════════════════        ║
   ║         ✨ Your Coding Journey ✨         ║
   ║              Begins Here                  ║
   ╚═══════════════════════════════════════════╝

  📦 f  Find File
  📁 r  Recent Files
  ⚙️  s  Settings
  🎒 i  Plugins
  ❌ q  Quit

┌─────────────────────────────────────────┐
║  🎯 Farming Level: 1   |  XP: 0/500    ║
║  📅 Season: SPRING                      ║
║  💬 🌾 'Plant code seeds, harvest success' ║
└─────────────────────────────────────────┘
```

---

## 🛠️ Customization

### Change Theme Settings

Edit `~/.config/nvim/lua/config/options.lua`:

```lua
return {
  stardew = {
    enabled = true,
    season = "auto", -- or force: spring, summer, fall, winter
    logo = "village", -- or: farm, town, community
    show_farming_level = true,
    show_seasonal_messages = true,
  },
}
```

### Add Your Own ASCII Art

Edit `~/.config/nvim/lua/plugins/stardew-dashboard.lua` and add to the `stardew_logos` table.

---

## 📦 Plugins Included

The configuration uses **LazyVim** as a base, which includes:

- **telescope.nvim** - Fuzzy finder
- **nvim-treesitter** - Syntax highlighting
- **nvim-lspconfig** - LSP support
- **blink.cmp** - Autocompletion
- **gitsigns.nvim** - Git integration
- **tokyonight** - Color scheme
- And many more essential plugins!

---

## 🚀 Next Steps

1. **Start Neovim** and enjoy the beautiful dashboard
2. **Check your farming level** with `<Space>xp`
3. **Install additional plugins** with `<Space>pi`
4. **Customize your theme** in `lua/config/options.lua`
5. **Explore the codebase** and make it your own!

---

## 🌟 Repository Features

- ✅ Clean, minimal setup
- ✅ Stardew Valley themed dashboard
- ✅ Seasonal auto-detection
- ✅ Farming level XP system
- ✅ Comprehensive documentation
- ✅ Ready to customize
- ✅ MIT Licensed

---

## 📖 Documentation

Full documentation is available in the repository:

- **README.md** - Complete guide with themes, keybindings, and customization
- **QUICKSTART.md** - Quick start guide
- **CONTRIBUTING.md** - Contribution guidelines

---

## 🎉 Welcome to Nvil Village!

Your cozy coding adventure begins here. May your code be bug-free and your harvest bountiful! 🌾✨

*"Plant code seeds, harvest success"*

---

**Repository URL**: https://github.com/Bencode12/Nvil.git  
**Commit**: 41003f4  
**Branch**: master  
**Status**: ✅ Successfully Pushed
