# 🌾 Nvil - Stardew Valley Edition

> Your cozy coding village awaits...

<div align="center">

![Nvil Logo](https://img.shields.io/badge/Nvil-Stardew_Valley_Edition-FFB7C5?style=for-the-badge&logo=neovim)
![Neovim](https://img.shields.io/badge/Neovim-0.9+-5694A5?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-5.1-2C2D72?style=for-the-badge&logo=lua)
![License](https://img.shields.io/github/license/Bencode12/Nvil?style=for-the-badge)

</div>

---

## 🎨 Features

### 🏘️ Stardew Valley Themed Dashboard
- **Seasonal Themes**: Dynamic dashboard that changes with the seasons
- **Farming Level System**: Track your coding progress like farming levels
- **Cozy ASCII Art**: Beautiful village-themed startup screen
- **Daily Messages**: Inspirational quotes from Pelican Town

### ⚡ Quick Start

```bash
# Clone the repository
git clone https://github.com/Bencode12/Nvil.git ~/.config/nvim

# Start Neovim
nvim
```

### 🎮 Key Bindings

| Key | Description |
|-----|-------------|
| `<Space>f` | Find Files |
| `<Space>r` | Recent Files |
| `<Space>s` | Settings |
| `<Space>pi` | Plugin Manager |
| `<Space>q` | Quit |
| `<Space>ff` | 🌾 Find File (Telescope) |
| `<Space>fg` | 🔍 Grep |
| `<Space>fb` | 📋 Buffers |
| `<Space>gs` | 🌾 Git Status |
| `<Space>xp` | Check Farming Level |

### 🌸 Seasonal Themes

Nvil automatically detects the current season and applies themed colors:

- **🌷 Spring**: Cherry blossom pink & fresh green
- **☀️ Summer**: Sun gold & watermelon red
- **🍂 Fall**: Pumpkin orange & wood brown
- **❄️ Winter**: Light cyan & powder blue

###  Farming Level System

Your coding journey is tracked like a Stardew Valley farming skill:
- Gain XP by completing coding tasks
- Level up from 1 to 100
- Track progress with `<Space>xp`

```lua
-- Check your current level
:lua print("Level: " .. math.floor(_G.nvim_settings.quest.xp / 500) + 1)
```

## 📦 Plugin Management

Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

### Install Plugins

```vim
:Lazy
```

### Update Plugins

```vim
:Lazy update
```

## 🛠️ Configuration

### Basic Setup

All configuration files are located in `~/.config/nvim/lua/`:

```
lua/
├── config/
│   ├── lazy.lua          # Plugin manager bootstrap
│   ├── keymaps.lua       # Key bindings
│   └── options.lua       # Neovim options
└── plugins/
    ├── settings.lua      # Settings UI
    └── stardew-dashboard.lua  # Themed dashboard
```

### Customization

Edit `lua/config/options.lua` to customize:

```lua
return {
  stardew = {
    enabled = true,
    season = "auto", -- or: spring, summer, fall, winter
    logo = "village", -- or: farm, town, community
    show_farming_level = true,
  },
}
```

## 🎨 Dashboard Themes

### Available Logos

- `village` - Classic village scene
- `farm` - Your personal farm
- `town` - Town center
- `community` - Community Center

### Color Palettes

Each season has unique colors inspired by Stardew Valley:

```lua
-- Spring colors
primary = "#FFB7C5"    -- Cherry blossom
secondary = "#90EE90"  -- Fresh green
accent = "#FFD700"     -- Sun yellow
```

## 🌟 Requirements

- **Neovim** 0.9+
- **Git** (for plugin management)
- **Nerd Font** (for icons)

### Recommended Fonts

- JetBrainsMono Nerd Font
- FiraCode Nerd Font
- Hack Nerd Font

## 🚀 Installation

### Linux/macOS

```bash
# Backup old config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone Nvil
git clone https://github.com/Bencode12/Nvil.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

### Windows (PowerShell)

```powershell
# Backup old config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup

# Clone Nvil
git clone https://github.com/Bencode12/Nvil.git $env:LOCALAPPDATA\nvim

# Start Neovim
nvim
```

## 🎮 First Steps

1. **Start Neovim** - See the beautiful Stardew dashboard
2. **Press `f`** - Find your first file
3. **Press `s`** - Explore settings
4. **Press `i`** - Browse and install plugins
5. **Press `<Space>xp`** - Check your farming level!

## 🏆 Quests & Achievements

Track your coding journey with the farming level system:

| Level | Title |
|-------|-------|
| 1-9 | Greenhorn |
| 10-19 | Cowpoke |
| 20-39 | Farmer |
| 40-59 | Artisan |
| 60-79 | Tiller |
| 80-99 | Master Farmer |
| 100 | Legendary Farmer |

## 🐛 Troubleshooting

### Dashboard not showing?

```vim
:lua require("snacks.dashboard").open()
```

### Colors look wrong?

```vim
:colorscheme tokyonight
```

### Plugins not loading?

```vim
:Lazy sync
:qa
```

## 📚 Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [LazyVim](https://www.lazyvim.org/)
- [Stardew Valley Wiki](https://stardewvalleywiki.com/Stardew_Valley_Wiki)

## 🤝 Contributing

Contributions welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **ConcernedApe** for creating Stardew Valley
- **LazyVim** team for the excellent framework
- **Folke** for lazy.nvim and snacks.nvim
- All the villagers of Pelican Town (you know who you are!)

---

<div align="center">

### 🌾 Made with ❤️ in Pelican Town

*"Plant code seeds, harvest success"*

</div>
