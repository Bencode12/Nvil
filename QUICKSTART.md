# Quick Start Guide for Nvil

Get up and running with Nvil in minutes! This guide covers the fastest ways to install and essential first steps.

## 🚀 Super Quick Install (5 minutes)

### One-Line Install
```bash
curl -fsSL https://raw.githubusercontent.com/Bencode12/Nvil/main/install.sh | bash
```

Then just run:
```bash
nvim
```

That's it! Plugins will auto-install on first launch.

## 📦 Manual Quick Install

### Step 1: Install Neovim (if not installed)

**Linux (Debian/Ubuntu):**
```bash
sudo apt update && sudo apt install -y neovim ripgrep fzf fd-find
```

**macOS:**
```bash
brew install neovim ripgrep fzf fd
```

### Step 2: Clone Nvil
```bash
git clone https://github.com/Bencode12/Nvil.git ~/.config/nvim
```

### Step 3: Launch
```bash
nvim
```

Wait for plugins to install automatically.

## ⚡ First Time Setup

When you first open Nvil:

1. **Wait for plugin installation** (happens automatically)
2. **You'll see the dashboard** with ASCII art
3. **Press `f`** to find files
4. **Press `s`** to open settings
5. **Press `q`** to try Quest Mode

## 🎯 Essential Keybindings

| Key | Action |
|-----|--------|
| `<Space>` | Leader key (press for combos) |
| `<Space>f` | Find files |
| `<Space>e` | Toggle file explorer |
| `<Space>s` | Settings |
| `<Space>q` | Quest Mode |
| `<Space>ai` | AI Chat |
| `q` (on dashboard) | Quit Neovim |

## 🎨 Customize Your Experience

### Change Theme
1. Press `:NvimSettings`
2. Navigate to "Theme" section
3. Press `H` to cycle through themes

### Change Logo
1. Press `:NvimSettings`
2. Navigate to "Logo Style"
3. Press `L` to cycle through logos

### Adjust Transparency
1. Press `:NvimSettings`
2. Navigate to "Transparency"
3. Press `R` to toggle

## 🔧 Troubleshooting First Launch

### "Plugins failed to load"
```bash
# In Neovim, run:
:Lazy sync
# Then restart: :qa
```

### "Colors look wrong"
Install a Nerd Font: https://www.nerdfonts.com/font-downloads
Then set in settings (`:NvimSettings` → Font Family)

### "Slow startup"
First launch is slower. Subsequent launches are <100ms.

## 📚 Next Steps

After getting comfortable:

1. **Try Quest Mode** (`:Quest`) - Gamify your coding
2. **Configure AI Assistant** - Set up Claude/GPT/Ollama
3. **Learn Keybindings** - Press `<Space>sk` for keymap list
4. **Explore Plugins** - Run `:Lazy` to see all plugins
5. **Read Full README** - `:help` or check README.md

## 💡 Pro Tips

- **Dashboard appears on every new session** - use it as your command center
- **Quest Mode tracks your progress** - complete daily quests for XP
- **AI panel is always available** - press `<Space>ai` anytime
- **Settings save automatically** - changes persist across sessions
- **Transparency works on most terminals** - enable in settings

## 🆘 Getting Help

- **Check README.md** - Comprehensive documentation
- **Run `:checkhealth`** - Diagnose issues
- **View logs**: `:messages`
- **GitHub Issues**: https://github.com/Bencode12/Nvil/issues

## 🎮 Try These Features

```bash
# File management
:Telescope find_files    # Find any file
:Neotree                 # File explorer

# Development
:LspInfo                # Check LSP status
:Mason                  # Language servers

# Fun & Productivity
:Quest                  # Quest mode
:TodoTelescope          # View TODOs
:NvimSettings           # Settings UI
```

## ✅ Verification Checklist

After installation, verify:

- [ ] Dashboard shows on startup
- [ ] File explorer opens with `<Space>e`
- [ ] Themes change with `:NvimSettings`
- [ ] Quest mode accessible via `:Quest`
- [ ] No errors in `:messages`
- [ ] Startup time < 100ms (after first launch)

---

**Need more help?** Check out the full [README.md](README.md) or open an issue on GitHub.

**Happy coding!** 🚀
