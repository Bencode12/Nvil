-- Stardew Valley Themed Dashboard for Nvil
return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- Stardew Valley inspired ASCII art logos
      local stardew_logos = {
        village = {
          [[
   ╔═══════════════════════════════════════════╗
   ║  🌾  WELCOME TO NVIL VILLAGE  🌾          ║
   ║                                           ║
   ║      🏠    🌳    🌾    🐔    🌻           ║
   ║    ═══════════════════════════════        ║
   ║         ✨ Your Coding Journey ✨         ║
   ║              Begins Here                  ║
   ╚═══════════════════════════════════════════╝
          ]],
        },
        farm = {
          [[
  🌄═══════════════════════════════════════════🌄
  ║                                           ║
  ║     🌾  NVIL FARM  🌾                     ║
  ║                                           ║
  ║   🏡  🌱    🌽  🐓    🌾             ║
  ║                                           ║
     "Plant seeds of code, harvest success"  ║
  ║                                           ║
  ═══════════════════════════════════════════🌄
          ]],
        },
        town = {
          [[
  ╔═══════════════════════════════════════════╗
  ║  🏘️  NVIL TOWN CENTER  🏘️                ║
  ║                                           ║
  ║      🏠  General Store (Files)            ║
  ║        Library (Projects)               ║
  ║      ⚒️  Blacksmith (Tools)               ║
  ║      🎣  Beach (Relax)                    ║
  ║                                           ║
           🌟 Adventure Awaits! 🌟           ║
  ╚═══════════════════════════════════════════╝
          ]],
        },
        community = {
          [[
   ╔═══════════════════════════════════════════╗
   ║  🌟  NVIL COMMUNITY CENTER  🌟            ║
   ║                                           ║
         Bundles Completed: [████░░] 67%      ║
   ║                                           ║
       📦    ⚒️  🌿    💎                ║
   ║                                           ║
      "Building your coding bundle..."        ║
   ╚═══════════════════════════════════════════╝
          ]],
        },
        seasons = {
          spring = [[
  ╔═══════════════════════════════════════════╗
  ║  🌸  NVIL - SPRING  🌸                    ║
  ║                                           ║
  ║   🌷  🌱  🐣  🌧️                     ║
  ║                                           ║
     "A new season of growth begins..."      ║
  ╚═══════════════════════════════════════════╝
          ]],
          summer = [[
  ╔═══════════════════════════════════════════╗
  ║  ️  NVIL - SUMMER  ☀️                    ║
  ║                                           ║
     🌻    🐝  ☀️                     ║
  ║                                           ║
     "Hot days, productive coding..."        ║
  ╚═══════════════════════════════════════════╝
          ]],
          fall = [[
  ╔═══════════════════════════════════════════╗
  ║  🍂  NVIL - FALL  🍂                      ║
  ║                                           ║
     🎃    🌾  🦊  🍇                   ║
  ║                                           ║
  ║   "Harvest your accomplishments..."       ║
  ╚═══════════════════════════════════════════╝
          ]],
          winter = [[
  ╔═══════════════════════════════════════════╗
  ║  ️  NVIL - WINTER  ❄️                    ║
  ║                                           ║
  ║   ⛄  ❄️  🎿    🔥  ☕                 ║
  ║                                           ║
  ║   "Cozy coding by the fireplace..."       ║
  ╚═══════════════════════════════════════════╝
          ]],
        },
      }

      -- Seasonal color palettes (Stardew Valley inspired)
      local season_colors = {
        spring = {
          primary = "#FFB7C5",    -- Cherry blossom pink
          secondary = "#90EE90",  -- Fresh green
          accent = "#FFD700",     -- Sun yellow
          bg = "#1a1a2e",
        },
        summer = {
          primary = "#FFD700",    -- Sun gold
          secondary = "#FF6B6B",  -- Watermelon red
          accent = "#4ECDC4",     -- Ocean teal
          bg = "#1a1a2e",
        },
        fall = {
          primary = "#FF8C00",    -- Pumpkin orange
          secondary = "#8B4513",  -- Wood brown
          accent = "#DAA520",     -- Goldenrod
          bg = "#1a1a2e",
        },
        winter = {
          primary = "#E0FFFF",    -- Light cyan
          secondary = "#B0E0E6",  -- Powder blue
          accent = "#FF69B4",     -- Hot pink (winter festival)
          bg = "#1a1a2e",
        },
      }

      -- Get current season (simplified - based on month)
      local function get_current_season()
        local month = os.date("*t").month
        if month >= 3 and month <= 5 then
          return "spring"
        elseif month >= 6 and month <= 8 then
          return "summer"
        elseif month >= 9 and month <= 11 then
          return "fall"
        else
          return "winter"
        end
      end

      -- Detect player's "farming level" (XP system)
      local function get_farming_level()
        local ok, stats = pcall(vim.fn.getfenv, 0)
        local xp = _G.nvim_settings and _G.nvim_settings.quest and _G.nvim_settings.quest.xp or 0
        local level = math.floor(xp / 500) + 1
        return level, xp % 500
      end

      -- Dashboard keybindings with Stardew icons
      local dashboard_keys = {
        { icon = "📦 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = "📁 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = "📂 ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
        { icon = "⚙️  ", key = "s", desc = "Settings", action = ":NvimSettings" },
        { icon = "🔧 ", key = "t", desc = "Tasks", action = ":TodoTelescope" },
        { icon = "📊 ", key = "d", desc = "Dashboard", action = ":Dashboard" },
        { icon = "🎒 ", key = "i", desc = "Install Plugin", action = ":Lazy" },
        { icon = "❌ ", key = "q", desc = "Quit", action = ":qa" },
      }

      -- Fun daily messages (Stardew style)
      local daily_messages = {
        "🌟 'Your coding adventure begins!'",
        "🌾 'Plant code seeds, harvest success'",
        "💎 'May your bugs be few and features many'",
        "🐓 'Rise and shine! Time to code'",
        "🎣 'Reel in those coding challenges'",
        "🏆 'Another day, another commit'",
        "🌻 'Grow your skills today'",
        "⚒️ 'Mine those coding tasks'",
        "📚 'Learn something new today'",
        "🎉 'Celebrating small wins'",
      }

      -- Get random daily message
      local function get_daily_message()
        math.randomseed(os.time())
        return daily_messages[math.random(#daily_messages)]
      end

      -- Apply Stardew theme
      local function apply_stardew_theme()
        local season = get_current_season()
        local colors = season_colors[season]

        -- Set highlight groups
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors.primary, bold = true })
        vim.api.nvim_set_hl(0, "DashboardKey", { fg = colors.accent, bold = true })
        vim.api.nvim_set_hl(0, "DashboardDesc", { fg = colors.secondary })
        vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#8B4513", italic = true })
        vim.api.nvim_set_hl(0, "DashboardIcon", { fg = colors.accent })
      end

      -- Generate seasonal header
      local function generate_header()
        local season = get_current_season()
        local logo_choice = "village" -- Default
        
        -- You can customize this based on time of day or user preference
        if season == "spring" then
          logo_choice = "farm"
        elseif season == "summer" then
          logo_choice = "town"
        elseif season == "fall" then
          logo_choice = "community"
        else
          logo_choice = "village"
        end

        return stardew_logos[logo_choice][1]
      end

      -- Apply theme on load
      apply_stardew_theme()

      -- Set up seasonal theme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          apply_stardew_theme()
        end,
      })

      -- Generate dynamic header based on season and time
      local header = generate_header()
      local daily_msg = get_daily_message()
      local level, xp = get_farming_level()

      -- Dashboard configuration
      opts.dashboard = {
        preset = {
          header = header,
          keys = dashboard_keys,
          footer = {
            "",
            "┌─────────────────────────────────────────┐",
            "║  🎯 Farming Level: " .. string.format("%-2d", level) .. "  |  XP: " .. string.format("%-3d", xp) .. "/500  ║",
            "║  📅 Season: " .. string.upper(get_current_season()) .. string.rep(" ", 28) .. "║",
            "║  💬 " .. daily_msg .. string.rep(" ", 35 - #daily_msg) .. "║",
            "└─────────────────────────────────────────┘",
            "",
            "   " .. os.date("%A, %B %d, %Y  •  %I:%M %p"),
            "",
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "footer" },
        },
      }

      -- Return snacks configuration
      return {
        dashboard = opts.dashboard,
        picker = {
          builtin = {
            preview = true,
          },
        },
      }
    end,
  },
}
