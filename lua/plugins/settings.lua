-- Simple Settings for Nvil
return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- Minimal settings display
      local function show_settings()
        local buf = vim.api.nvim_create_buf(false, true)
        local width = math.min(80, vim.o.columns - 4)
        local height = math.min(20, vim.o.lines - 4)
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
          title = " 🌾 Nvil Settings ",
          title_pos = "center",
        })
        
        local lines = {
          "",
          "  🌾 Welcome to Nvil - Stardew Valley Edition!",
          "",
          "  Your cozy coding village awaits...",
          "",
          "  📁 Files:  <leader>f  -  Find Files",
          "  📂 Recent: <leader>r  -  Recent Files",
          "  ⚙️  Settings: <leader>s  -  Open Settings",
          "  🎒 Plugins: <leader>pi -  Plugin Manager",
          "  ❌ Quit:   <leader>q  -  Exit Nvil",
          "",
          "  Press <Esc> to close",
          "",
        }
        
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        
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
      
      return {
        dashboard = {
          preset = {
            header = [[
   ╔═══════════════════════════════════════════╗
   ║  🌾  WELCOME TO NVIL VILLAGE  🌾          ║
   ║                                           ║
   ║      🏠    🌳    🌾    🐔               ║
   ║    ═══════════════════════════════        ║
   ║         ✨ Your Coding Journey ✨         ║
   ║              Begins Here                  ║
   ╚═══════════════════════════════════════════╝
            ]],
            keys = {
              { icon = "📦 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
              { icon = "📁 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
              { icon = "⚙️  ", key = "s", desc = "Settings", action = ":NvimSettings" },
              { icon = "🎒 ", key = "i", desc = "Plugins", action = ":Lazy" },
              { icon = "❌ ", key = "q", desc = "Quit", action = ":qa" },
            },
          },
        },
      }
    end,
  },
}
