# NVil Configuration Recovery Summary

## ✅ Issues Fixed

### 1. **Critical Bug Fixes**

#### dashboard-old.lua (Line 370)
- **Issue**: `vim.api_nvim_create_user_command` (incorrect - underscores)
- **Fixed**: `vim.api.nvim_create_user_command` (correct - dots)
- **Impact**: Quest Mode commands now register properly

#### bufferline.lua (Line 21)
- **Issue**: `require("bufferline")` called during plugin spec definition (too early)
- **Fixed**: Moved require into `opts` function (lazy-loaded)
- **Impact**: Bufferline plugin loads correctly without errors

### 2. **Configuration Restored**

#### user-settings.lua - Added Missing Sections
```lua
-- Added editor configuration
editor = {
  tab_size = 2,
  expand_tab = true,
  show_line_numbers = true,
  relative_numbers = false,
  auto_save = false,
  word_wrap = false,
  cursor_line = true,
  sign_column = "yes",
}

-- Added layout configuration
layout = {
  file_explorer_width = 25,
  ai_panel_width = 30,
  show_ai_panel_on_startup = true,
  show_file_explorer_on_startup = true,
}

-- Added folders configuration
folders = {
  default_directory = "/Users/benas",
  show_hidden = false,
}

-- Added total_xp to quest
quest = {
  total_xp = 0,  -- NEW
  -- ... other fields
}
```

### 3. **Features Restored**

#### ✅ Settings UI (`:NvimSettings`)
Now fully functional with:
- **AI Configuration**
  - Model selection (Cloud: Claude, GPT, Gemini | Offline: Ollama)
  - Mode toggle (Cloud/Offline)
  - Token limit adjustment
  
- **Appearance Settings**
  - Theme selector (25+ themes)
  - Logo style picker (10+ ASCII art styles)
  - Font size adjustment
  - Font family selector
  - Transparency toggle

- **Plugin Management**
  - Plugin manager access (Lazy)
  - Plugin installer
  - Plugin updater

- **Keybindings Viewer**
  - Shows all active keybindings in floating window

#### ✅ Quest Mode
- Commands registered:
  - `:Quest` - Open Quest Mode UI
  - `:QuestStatus` - Show progress
  - `:QuestComplete` - Mark quest complete

- Features:
  - Daily quests with XP rewards
  - Guided workflows (Project Setup, Debug Session, Code Review, Feature Implementation)
  - Level progression system
  - Streak tracking
  - Persistent progress saving

#### ✅ Theme Switching
- 25+ themes available
- Hot-switching in settings UI
- Transparency support for all themes
- Proper lazy-loading with priority

### 4. **Plugin Installation**

Created `install-plugins.sh` script to automate plugin installation.

**Required Plugins** (auto-installed):
- UI: snacks.nvim, lualine.nvim, bufferline.nvim, neo-tree.nvim, noice.nvim
- Development: nvim-lspconfig, mason.nvim, nvim-dap, nvim-treesitter
- Productivity: telescope.nvim, avante.nvim, which-key.nvim, todo-comments.nvim
- Themes: tokyonight, catppuccin, gruvbox, nord, dracula, etc.

## 📋 How to Use

### Quick Start
```bash
# 1. Install plugins
./install-plugins.sh

# 2. Start Neovim
nvim

# 3. Open settings
:NvimSettings
```

### Essential Commands
- `:NvimSettings` - Open settings UI (overlay window)
- `:Quest` - Open Quest Mode
- `:Lazy` - Plugin manager
- `:Telescope find_files` - Find files
- `:Neotree` - File explorer

### Settings UI Keybindings
- **M** - Change AI model
- **O** - Toggle AI mode (Cloud/Offline)
- **T** - Adjust token limit
- **H** - Change theme
- **L** - Change logo style
- **F** - Adjust font size
- **G** - Change font family
- **R** - Toggle transparency
- **P** - Open plugin manager
- **I** - Install plugins
- **U** - Update plugins
- **K** - View keybindings
- **Enter** - Save settings
- **Q/Esc** - Close

## 🎨 Available Themes

1. tokyonight (default)
2. catppuccin (all variants)
3. gruvbox
4. nord
5. dracula
6. kanagawa
7. rose-pine
8. nightfox
9. oxocarbon
10. everforest
11. onedark
12. github_dark
13. material
14. melange
15. monokai-pro
16. darkvoid
17. nordic
18. gruvbox-baby
19. bamboo
20. And more...

## 🎯 Quest Mode Features

### Daily Quests
- Code Golf Challenge (100 XP)
- Bug Hunter (150 XP)
- Documentation Master (200 XP)
- Refactoring Ninja (250 XP)

### Guided Workflows
- 🚀 Project Setup (500 XP)
- 🐛 Debug Session (400 XP)
- 📝 Code Review (300 XP)
- ✨ Feature Implementation (750 XP)

### Progression System
- Level up with XP
- Increasing difficulty curve (1.5x XP per level)
- Daily streak tracking
- Persistent progress saved to JSON

## 🔧 Troubleshooting

### Plugins Not Loading
```bash
# In Neovim
:Lazy sync
:qa  # Restart
```

### Theme Not Applying
1. Open `:NvimSettings`
2. Press **H** to cycle themes
3. Press **Enter** to save
4. Restart Neovim

### Quest Mode Not Working
1. Check `lua/plugins/dashboard-old.lua` is loaded
2. Verify `:Quest` command exists
3. Check for Lua errors with `:messages`

### Transparency Issues
- Ensure your terminal supports transparency
- Toggle in settings with **R** key
- Some themes may need manual adjustment

## 📝 Files Modified

1. ✅ `lua/config/user-settings.lua` - Added editor, layout, folders sections
2. ✅ `lua/plugins/dashboard-old.lua` - Fixed API call (line 370)
3. ✅ `lua/plugins/bufferline.lua` - Fixed lazy-loading (line 21)
4. ✅ `install-plugins.sh` - Created plugin installer

## 🎉 Next Steps

1. **Run plugin installation**: `./install-plugins.sh`
2. **Start Neovim**: `nvim`
3. **Configure preferences**: `:NvimSettings`
4. **Try Quest Mode**: `:Quest`
5. **Enjoy your restored config!** 🚀

---

**Configuration Version**: 1.0 (Recovered)
**Last Updated**: 2026-03-16
**Repository**: https://github.com/Bencode12/Nvil
