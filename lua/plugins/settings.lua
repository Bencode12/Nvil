-- Nvil Settings Panel - Stardew Valley Style
-- A colorful place to manage your coding farm! 🌾
return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local function show_settings()
        local buf = vim.api.nvim_create_buf(false, true)
        local width = math.min(95, vim.o.columns - 4)
        local height = math.min(45, vim.o.lines - 4)
        local col = math.floor((vim.o.columns - width) / 2)
        local row = math.floor((vim.o.lines - height) / 2)

        local win = vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          width = width,
          height = height,
          col = col,
          row = row,
          style = "minimal",
          border = "rounded",
          title = " 🏪 Pierre's General Store - Nvil Settings ",
          title_pos = "center",
        })

        -- Color codes
        local c = {
          reset = "\x1b[0m",
          gold = "\x1b[38;5;220m",
          orange = "\x1b[38;5;208m",
          green = "\x1b[38;5;82m",
          forest_green = "\x1b[38;5;28m",
          cyan = "\x1b[38;5;51m",
          sky_blue = "\x1b[38;5;117m",
          brown = "\x1b[38;5;130m",
          tan = "\x1b[38;5;180m",
          cream = "\x1b[38;5;230m",
          pink = "\x1b[38;5;218m",
          purple = "\x1b[38;5;141m",
          yellow = "\x1b[38;5;226m",
          bright_white = "\x1b[38;5;231m",
          bright_red = "\x1b[38;5;203m",
          wheat = "\x1b[38;5;221m",
          dark_green = "\x1b[38;5;22m",
          light_green = "\x1b[38;5;120m",
        }

        local lines = {
          "",
          c.forest_green .. "  ╔══════════════════════════════════════════════════════════════════════╗" .. c.reset,
          c.forest_green .. "  ║" .. c.gold .. "        🌾 Welcome to Nvil - Stardew Valley Edition 🌾                   " .. c.forest_green .. "║" .. c.reset,
          c.forest_green .. "  ║" .. c.cream .. "               Your cozy coding village awaits!                            " .. c.forest_green .. "║" .. c.reset,
          c.forest_green .. "  ╚══════════════════════════════════════════════════════════════════════╝" .. c.reset,
          "",
          c.wheat .. "  ┌─────────────────────────────────────────────────────────────────────────┐" .. c.reset,
          c.wheat .. "  │" .. c.gold .. "                        📋 QUICK ACTIONS                                " .. c.wheat .. "│" .. c.reset,
          c.wheat .. "  └─────────────────────────────────────────────────────────────────────────┘" .. c.reset,
          "",
          "  " .. c.orange .. "📦 <leader>ff    │  " .. c.reset .. "Find Files      " .. c.forest_green .. "(like finding hidden forage items!)" .. c.reset,
          "  " .. c.cyan .. "📂 <leader>fr    │  " .. c.reset .. "Recent Files    " .. c.forest_green .. "(your yesterday's harvested crops)" .. c.reset,
          "  " .. c.purple .. "🔍 <leader>sg    │  " .. c.reset .. "Live Grep       " .. c.forest_green .. "(search the whole farm thoroughly)" .. c.reset,
          "  " .. c.green .. "📝 <leader>fn    │  " .. c.reset .. "New File        " .. c.forest_green .. "(plant a new seed of code)" .. c.reset,
          "  " .. c.pink .. "📊 <leader>e     │  " .. c.reset .. "File Explorer   " .. c.forest_green .. "(open your inventory/backpack)" .. c.reset,
          "",
          c.wheat .. "  ┌─────────────────────────────────────────────────────────────────────────┐" .. c.reset,
          c.wheat .. "  │" .. c.gold .. "                       🎒 PLUGINS & TOOLS                               " .. c.wheat .. "│" .. c.reset,
          c.wheat .. "  └─────────────────────────────────────────────────────────────────────────┘" .. c.reset,
          "",
          "  " .. c.bright_red .. "🎒 :Lazy         │  " .. c.reset .. "Plugin Manager  " .. c.forest_green .. "(your backpack - manage your tools)" .. c.reset,
          "  " .. c.yellow .. "⚙️  :Mason       │  " .. c.reset .. "LSP Manager     " .. c.forest_green .. "(upgrades for better coding skills)" .. c.reset,
          "  " .. c.sky_blue .. "🔧 :checkhealth  │  " .. c.reset .. "Health Check    " .. c.forest_green .. "(farm inspection - find issues)" .. c.reset,
          "  " .. c.cream .. "📊 :FarmStats    │  " .. c.reset .. "Farm Statistics " .. c.forest_green .. "(see your coding progress)" .. c.reset,
          "",
          c.wheat .. "  ┌─────────────────────────────────────────────────────────────────────────┐" .. c.reset,
          c.wheat .. "  │" .. c.gold .. "                         🌟 TIPS                                        " .. c.wheat .. "│" .. c.reset,
          c.wheat .. "  └─────────────────────────────────────────────────────────────────────────┘" .. c.reset,
          "",
          "  " .. c.yellow .. "💡" .. c.reset .. " Press " .. c.bright_white .. "<Space> (leader)" .. c.reset .. " to see all available shortcuts!",
          "  " .. c.yellow .. "💡" .. c.reset .. " Use " .. c.bright_white .. ":h <topic>" .. c.reset .. " to read the Neovim documentation",
          "  " .. c.yellow .. "💡" .. c.reset .. " Press " .. c.bright_white .. "<Esc> or q" .. c.reset .. " to close this window",
          "",
          c.forest_green .. "  ─────────────────────────────────────────────────────────────────────────" .. c.reset,
          c.pink .. "  🐔 Happy Coding, Farmer! Your village awaits your commits! 🌾" .. c.reset,
          "",
          "  " .. c.dark_green .. "    🏡" .. c.reset .. "      " .. c.dark_green .. "🏪" .. c.reset .. "      " .. c.dark_green .. "🏥" .. c.reset .. "      " .. c.dark_green .. "🏚️" .. c.reset .. "      " .. c.dark_green .. "🏡" .. c.reset .. "      " .. c.dark_green .. "🏠" .. c.reset,
          "  " .. c.light_green .. "  Your     Pierre's  Clinic   Linus   Marnie's   House" .. c.reset,
          "  " .. c.light_green .. "  Farm      Store              Tent     Ranch" .. c.reset,
          "",
        }

        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        vim.api.nvim_buf_set_option(buf, "filetype", "nvil-settings")

        local function close()
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
          end
          if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end

        vim.keymap.set("n", "q", close, { buffer = buf })
        vim.keymap.set("n", "<Esc>", close, { buffer = buf })
      end

      vim.api.nvim_create_user_command("NvimSettings", show_settings, {})
      vim.api.nvim_create_user_command("Farm", show_settings, {})
      vim.keymap.set("n", "<leader>?", show_settings, { desc = "Show Nvil Settings" })

      return {
        dashboard = {
          preset = {
            header = [[]],
            keys = {},
          },
        },
      }
    end,
  },
}