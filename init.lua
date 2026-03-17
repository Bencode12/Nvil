-- Nvil - Stardew Valley Edition
-- Your coding adventure begins here! 🌾

-- Leader key setup (MUST be before lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic Neovim options
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

-- Initialize global settings
_G.nvim_settings = {
  quest = {
    xp = 0,
    level = 1,
  },
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

-- Welcome message
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.notify("🌾 Welcome to Nvil Village! Your coding adventure begins...", vim.log.levels.INFO)
  end,
  once = true,
})
