-- Nvil - Stardew Valley Edition
-- Your coding adventure begins here! 🌾
-- Inspired by the peaceful farming life of Stardew Valley

-- Leader key setup (MUST be before lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic Neovim options for a cozy coding experience
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set a warm color scheme fitting the Stardew Valley aesthetic
vim.cmd([[colorscheme tokyonight]])

-- Lazy.nvim plugin manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize global settings (your farm stats!)
_G.nvil_farm = {
  farmer = vim.env.USER or "Farmer",
  xp = 0,
  level = 1,
  crops_harvested = 0, -- files saved
  fish_caught = 0,     -- searches completed
  quests_completed = 0, -- projects finished
}

-- Load plugins
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- Welcome message with Stardew Valley flair
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local hour = os.date("*t").hour
    local greeting
    if hour >= 5 and hour < 12 then
      greeting = "🌅 Good morning, Farmer!"
    elseif hour >= 12 and hour < 17 then
      greeting = "☀️ Good afternoon, Farmer!"
    elseif hour >= 17 and hour < 21 then
      greeting = "🌅 Good evening, Farmer!"
    else
      greeting = "🌙 Burning the midnight oil, Farmer!"
    end

    local messages = {
      "🌾 The crops are ready for harvesting!",
      "🐔 The chickens need feeding!",
      "🎣 Perfect weather for fishing (or coding)!",
      "💎 You found a prismatic shard of code!",
      "🌻 Today's lucky number is: " .. math.random(1, 100),
      "🎃 The Junimos are watching your commits!",
    }

    math.randomseed(os.time())
    local msg = messages[math.random(#messages)]

    vim.notify(
      greeting .. " " .. msg,
      vim.log.levels.INFO,
      { title = "🏡 Nvil Village" }
    )
  end,
  once = true,
})

-- Track "crops harvested" (files saved)
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    _G.nvil_farm.crops_harvested = _G.nvil_farm.crops_harvested + 1
  end,
})

-- Create :Village command to show dashboard again
vim.api.nvim_create_user_command("Village", function()
  vim.cmd("close")
  vim.cmd("lua Snacks.dashboard()")
end, { desc = "Return to Nvil Village" })

-- Create :FarmStats command to show your progress
vim.api.nvim_create_user_command("FarmStats", function()
  local stats = _G.nvil_farm
  local msg = string.format([[
🌾 Nvil Farm Stats 🌾
━━━━━━━━━━━━━━━━━━━━
👨‍🌾 Farmer: %s
📝 Files Saved: %d
🔍 Searches: %d
━━━━━━━━━━━━━━━━━━━━
Keep coding to grow your farm!
]], stats.farmer, stats.crops_harvested, stats.fish_caught)
  vim.notify(msg, vim.log.levels.INFO, { title = "📊 Your Farm Statistics" })
end, { desc = "Show Nvil farm statistics" })