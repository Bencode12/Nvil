-- Stardew Valley Themed Dashboard for Nvil
return {
  "folke/snacks.nvim",
  opts = function()
    -- Get current season
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
    
    -- Daily messages
    local daily_messages = {
      "🌾 'Plant code seeds, harvest success'",
      "💎 'May your bugs be few and features many'",
      "🐓 'Rise and shine! Time to code'",
      "🎣 'Reel in those coding challenges'",
      "🌻 'Grow your skills today'",
    }
    
    math.randomseed(os.time())
    local daily_msg = daily_messages[math.random(#daily_messages)]
    local season = get_current_season()
    
    -- Stardew Valley themed header
    local header = [[
   ╔═══════════════════════════════════════════╗
   ║  🌾  WELCOME TO NVIL VILLAGE  🌾          ║
   ║                                           ║
         🏠    🌾    🐔               ║
   ║    ═══════════════════════════════        ║
   ║         ✨ Your Coding Journey ✨         ║
   ║              Begins Here                  ║
   ═══════════════════════════════════════════╝
    ]]
    
    return {
      dashboard = {
        preset = {
          header = header,
          keys = {
            { icon = "📦 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "📁 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = "⚙️  ", key = "s", desc = "Settings", action = ":NvimSettings" },
            { icon = "🎒 ", key = "i", desc = "Plugins", action = ":Lazy" },
            { icon = "❌ ", key = "q", desc = "Quit", action = ":qa" },
          },
          footer = {
            "",
            "┌─────────────────────────────────────────┐",
            "║  📅 Season: " .. string.upper(season) .. string.rep(" ", 30) .. "║",
            "║  💬 " .. daily_msg .. string.rep(" ", 36 - #daily_msg) .. "║",
            "└─────────────────────────────────────────┘",
            "",
            "   " .. os.date("%A, %B %d, %Y  •  %I:%M %p"),
          },
        },
      },
    }
  end,
}
