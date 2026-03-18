-- Stardew Valley Themed Dashboard for Nvil
-- A colorful pixel-art village welcomes you! 🌾
return {
  "folke/snacks.nvim",
  opts = function()
    -- Get current season with Stardew Valley season names
    local function get_season_info()
      local month = os.date("*t").month
      local season_data = {
        spring = { emoji = "🌸", sky = "springgreen", ground = "lightgreen", accent = "pink" },
        summer = { emoji = "☀️", sky = "cyan", ground = "green", accent = "yellow" },
        fall = { emoji = "🍂", sky = "orange", ground = "darkyellow", accent = "red" },
        winter = { emoji = "❄️", sky = "lightblue", ground = "white", accent = "lightcyan" },
      }
      if month >= 3 and month <= 5 then
        return "spring", season_data.spring
      elseif month >= 6 and month <= 8 then
        return "summer", season_data.summer
      elseif month >= 9 and month <= 11 then
        return "fall", season_data.fall
      else
        return "winter", season_data.winter
      end
    end

    local season, season_info = get_season_info()

    -- Daily messages from the villagers
    local villager_messages = {
      "👴 Lewis: 'Back in my day, we coded without syntax highlighting!'",
      "👩‍🌾 Pam: 'A real farmer codes at dawn... with coffee!'",
      "💜 Abigail: 'I found something weird in the mines... it was a bug!'",
      "🧔 Pierre: 'I've got just the plugin for your code!'",
      "🎸 Sam: 'Life's like a melody, so code your own tune.'",
      "🔬 Demetrius: 'I wonder if code grows better with proper documentation?'",
      "🎣 Willy: 'A good line of code is like a good fishing spot.'",
      "🍺 Gus: 'Come have a drink at the Stardrop and write some code!'",
      "🖤 Sebastian: 'The shadows hold many secrets... and bugs to fix.'",
      "🌻 Penny: 'Every line of code is a seed of potential!'",
      "🤠 Shane: 'Ugh... my head... too many commits last night...'",
      "💐 Haley: 'Ew, your code is so... functional.'",
      "🌊 Elliott: 'Ah, the poetry of well-formatted code!'",
      "⚔️ Marlon: 'I see you've been fighting bugs in the mines!'",
      "👻 Linus: 'The Junimos appreciate your clean commits...'",
    }

    math.randomseed(os.time())
    local daily_msg = villager_messages[math.random(#villager_messages)]

    -- Create colorful header with ANSI escape codes
    -- Using terminal color codes for rich display

    -- Color definitions (ANSI 256 color codes)
    local c = {
      -- Reset
      reset = "\x1b[0m",
      -- Basic colors
      black = "\x1b[30m",
      red = "\x1b[31m",
      green = "\x1b[32m",
      yellow = "\x1b[33m",
      blue = "\x1b[34m",
      magenta = "\x1b[35m",
      cyan = "\x1b[36m",
      white = "\x1b[37m",
      -- Bright colors
      bright_red = "\x1b[91m",
      bright_green = "\x1b[92m",
      bright_yellow = "\x1b[93m",
      bright_blue = "\x1b[94m",
      bright_magenta = "\x1b[95m",
      bright_cyan = "\x1b[96m",
      bright_white = "\x1b[97m",
      -- Background colors
      bg_black = "\x1b[40m",
      bg_red = "\x1b[41m",
      bg_green = "\x1b[42m",
      bg_yellow = "\x1b[43m",
      bg_blue = "\x1b[44m",
      bg_magenta = "\x1b[45m",
      bg_cyan = "\x1b[46m",
      bg_white = "\x1b[47m",
      -- Extended 256 colors for pixel-art feel
      forest_green = "\x1b[38;5;28m",
      dark_green = "\x1b[38;5;22m",
      light_green = "\x1b[38;5;82m",
      pale_green = "\x1b[38;5;120m",
      sky_blue = "\x1b[38;5;117m",
      light_blue = "\x1b[38;5;153m",
      dark_blue = "\x1b[38;5;19m",
      orange = "\x1b[38;5;208m",
      dark_orange = "\x1b[38;5;166m",
      brown = "\x1b[38;5;130m",
      dark_brown = "\x1b[38;5;88m",
      tan = "\x1b[38;5;180m",
      wheat = "\x1b[38;5;221m",
      gold = "\x1b[38;5;220m",
      cream = "\x1b[38;5;230m",
      pink = "\x1b[38;5;218m",
      light_pink = "\x1b[38;5;224m",
      purple = "\x1b[38;5;93m",
      light_purple = "\x1b[38;5;183m",
      gray = "\x1b[38;5;246m",
      dark_gray = "\x1b[38;5;240m",
      silver = "\x1b[38;5;252m",
      white_bold = "\x1b[38;5;231m",
      -- Background extended
      bg_sky = "\x1b[48;5;117m",
      bg_grass = "\x1b[48;5;28m",
      bg_dirt = "\x1b[48;5;130m",
      bg_wood = "\x1b[48;5;94m",
    }

    -- Season-specific color schemes
    local sky_color, ground_color, tree_color, flower_color
    if season == "spring" then
      sky_color = c.bright_cyan
      ground_color = c.bright_green
      tree_color = c.forest_green
      flower_color = c.pink
    elseif season == "summer" then
      sky_color = c.bright_blue
      ground_color = c.green
      tree_color = c.dark_green
      flower_color = c.bright_yellow
    elseif season == "fall" then
      sky_color = c.sky_blue
      ground_color = c.orange
      tree_color = c.dark_orange
      flower_color = c.bright_red
    else -- winter
      sky_color = c.light_blue
      ground_color = c.white_bold
      tree_color = c.gray
      flower_color = c.light_cyan
    end

    -- Build the colorful Stardew Valley village ASCII art
    local header = c.bg_sky .. c.white_bold .. [[



]] .. c.sky_blue .. "        " .. c.gold .. "███" .. c.yellow .. "███" .. c.gold .. "███" .. c.sky_blue .. "                      " .. c.orange .. "~  ~" .. c.sky_blue .. "        " .. c.light_blue .. "☁  ☁  ☁" .. c.sky_blue .. [[

]] .. c.sky_blue .. "      " .. c.gold .. "██" .. c.yellow .. "████" .. c.gold .. "██" .. c.sky_blue .. "                                                           " .. c.light_blue .. "☁" .. c.sky_blue .. [[

]] .. c.light_green .. "          " .. c.green .. "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀" .. c.light_green .. [[

]] .. c.forest_green .. "    " .. c.brown .. "▓▓▓" .. c.forest_green .. "      " .. c.brown .. "▓▓▓" .. c.forest_green .. "     " .. c.brown .. "▓▓▓▓▓" .. c.forest_green .. "       " .. c.brown .. "▓▓▓" .. c.forest_green .. "        " .. c.brown .. "▓▓▓" .. c.forest_green .. "      " .. c.brown .. "▓▓▓" .. c.forest_green .. [[
]] .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. "   " .. c.dark_green .. "███████" .. c.forest_green .. "     " .. c.dark_green .. "█████" .. c.forest_green .. "      " .. c.dark_green .. "█████" .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. [[
]] .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. "   " .. c.dark_green .. "███████" .. c.forest_green .. "     " .. c.dark_green .. "█████" .. c.forest_green .. "      " .. c.dark_green .. "█████" .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. [[
]] .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. "   " .. c.dark_green .. "███████" .. c.forest_green .. "     " .. c.dark_green .. "█████" .. c.forest_green .. "      " .. c.dark_green .. "█████" .. c.forest_green .. "    " .. c.dark_green .. "█████" .. c.forest_green .. [[
]] .. c.brown .. "    ╔════╗" .. c.green .. "    " .. c.brown .. "╔════╗" .. c.green .. "   " .. c.brown .. "╔══════╗" .. c.green .. "     " .. c.brown .. "╔════╗" .. c.green .. "      " .. c.brown .. "╔════╗" .. c.green .. "    " .. c.brown .. "╔════╗" .. c.reset .. [[
]] .. c.tan .. "    ║" .. c.cream .. "🏠" .. c.tan .. "║" .. c.green .. "    " .. c.tan .. "║" .. c.cream .. "🏪" .. c.tan .. "║" .. c.green .. "   " .. c.tan .. "║" .. c.cream .. "⚕️" .. c.tan .. "  ║" .. c.green .. "     " .. c.tan .. "║" .. c.cream .. "🏚️" .. c.tan .. "║" .. c.green .. "      " .. c.tan .. "║" .. c.cream .. "🏡" .. c.tan .. "║" .. c.green .. "    " .. c.tan .. "║" .. c.cream .. "🏠" .. c.tan .. "║" .. c.reset .. [[
]] .. c.tan .. "    ╚════╝" .. c.green .. "    " .. c.tan .. "╚════╝" .. c.green .. "   " .. c.tan .. "╚══════╝" .. c.green .. "     " .. c.tan .. "╚════╝" .. c.green .. "      " .. c.tan .. "╚════╝" .. c.green .. "    " .. c.tan .. "╚════╝" .. c.reset .. [[
]] .. c.dark_brown .. "      ║║║      ║║║       ║║║         ║║║        ║║║      ║║║" .. c.reset .. [[

]] .. c.wheat .. "████████████████████████████████████████████████████████████████████████████████████" .. c.reset .. [[
]] .. c.dark_green .. "████████████████████████████████████████████████████████████████████████████████████" .. c.reset .. [[
]] .. c.dark_green .. "████████████████████████████████████████████████████████████████████████████████████" .. c.reset .. [[

]] .. c.white_bold .. "      Your Farm    Pierre's     Clinic     Linus Tent    Marnie's     Your House" .. c.reset .. [[

]] .. c.reset .. [[

]] .. c.bg_magenta .. c.bright_white .. [[
   ██████╗██╗   ██╗ █████╗ ██╗  ██╗██╗   ██╗    ███╗   ██╗██╗   ██╗██╗   ██╗
]] .. c.bg_magenta .. c.bright_white .. [[
  ██╔════╝██║   ██║██╔══██╗██║ ██╔╝██║   ██║    ████╗  ██║██║   ██║██║   ██║
]] .. c.bg_magenta .. c.bright_white .. [[
  ██║     ██║   ██║███████║█████╔╝ ██║   ██║    ██╔██╗ ██║██║   ██║██║   ██║
]] .. c.bg_magenta .. c.bright_white .. [[
  ██║     ██║   ██║██╔══██║██╔═██╗ ██║   ██║    ██║╚██╗██║██║   ██║██║   ██║
]] .. c.bg_magenta .. c.bright_white .. [[
  ╚██████╗╚██████╔╝██║  ██║██║  ██╗╚██████╔╝    ██║ ╚████║╚██████╔╝╚██████╔╝
]] .. c.bg_magenta .. c.bright_white .. [[
   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝     ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝
]] .. c.reset .. [[

]]

    -- Weather and time info
    local time_of_day = os.date("*t").hour
    local greeting
    if time_of_day >= 5 and time_of_day < 12 then
      greeting = "🌅 Good Morning, Farmer!"
    elseif time_of_day >= 12 and time_of_day < 17 then
      greeting = "☀️ Good Afternoon, Farmer!"
    elseif time_of_day >= 17 and time_of_day < 21 then
      greeting = "🌅 Good Evening, Farmer!"
    else
      greeting = "🌙 Good Night, Farmer!"
    end

    local footer = {
      "",
      c.bright_white .. "┌─────────────────────────────────────────────────────────────────────────────┐" .. c.reset,
      c.bright_white .. "│" .. c.gold .. greeting .. c.bright_white .. string.rep(" ", 71 - #greeting) .. "│" .. c.reset,
      c.bright_white .. "│                                                                             │" .. c.reset,
      c.bright_white .. "│ " .. c.forest_green .. "📅 Season: " .. string.upper(season) .. " " .. season_info.emoji .. c.bright_white .. "  │  " .. c.orange .. "🌱 Growing: Crops & Code" .. c.bright_white .. "                                    │" .. c.reset,
      c.bright_white .. "│ " .. c.cyan .. "📆 " .. os.date("%A, %B %d, %Y") .. c.bright_white .. "  │  " .. c.purple .. "🕐 " .. os.date("%I:%M %p") .. c.bright_white .. string.rep(" ", 39) .. "│" .. c.reset,
      c.bright_white .. "│                                                                             │" .. c.reset,
      c.bright_white .. "│ " .. c.pink .. daily_msg .. c.bright_white .. string.rep(" ", 69 - #daily_msg) .. "│" .. c.reset,
      c.bright_white .. "└─────────────────────────────────────────────────────────────────────────────┘" .. c.reset,
      "",
      c.wheat .. "    🎮 Press " .. c.bright_yellow .. "<Space>" .. c.wheat .. " then a key below to start your adventure!" .. c.reset,
    }

    return {
      dashboard = {
        preset = {
          header = header,
          keys = {
            { icon = c.orange .. "📦" .. c.reset, key = "f", desc = "Find Files         ", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = c.cyan .. "📁" .. c.reset, key = "r", desc = "Recent Files       ", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = c.purple .. "🔍" .. c.reset, key = "g", desc = "Live Grep          ", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = c.green .. "📝" .. c.reset, key = "n", desc = "New File           ", action = ":enew" },
            { icon = c.pink .. "⚙️ " .. c.reset, key = "s", desc = "Settings           ", action = ":NvimSettings" },
            { icon = c.bright_yellow .. "🎒" .. c.reset, key = "i", desc = "Plugin Manager     ", action = ":Lazy" },
            { icon = c.bright_red .. "❌" .. c.reset, key = "q", desc = "Quit               ", action = ":qa" },
          },
          footer = footer,
        },
      },
    }
  end,
}