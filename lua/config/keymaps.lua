-- Nvil Keybindings
local map = vim.keymap.set

-- Leader key mappings
map("n", "<leader>f", "<cmd>lua Snacks.dashboard.pick('files')<CR>", { desc = "Find Files" })
map("n", "<leader>r", "<cmd>lua Snacks.dashboard.pick('oldfiles')<CR>", { desc = "Recent Files" })
map("n", "<leader>s", "<cmd>NvimSettings<CR>", { desc = "Settings" })
map("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit" })

-- Stardew themed mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "🌾 Find File" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "🔍 Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "📋 Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "❓ Help" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Down Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Up Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right Window" })

-- Better window movement
map("n", "<S-Left>", "<C-w>H", { desc = "Move Window Left" })
map("n", "<S-Down>", "<C-w>J", { desc = "Move Window Down" })
map("n", "<S-Up>", "<C-w>K", { desc = "Move Window Up" })
map("n", "<S-Right>", "<C-w>L", { desc = "Move Window Right" })

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Shrink Window" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Expand Window" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Shrink Window Horizontally" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Expand Window Horizontally" })

-- Navigation
map("n", "<C-d>", "<C-d>", { desc = "Half Page Down" })
map("n", "<C-u>", "<C-u>", { desc = "Half Page Up" })
map("n", "j", "gj", { desc = "Down (Display Line)" })
map("n", "k", "gk", { desc = "Up (Display Line)" })

-- Terminal mode mappings
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
map("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Terminal Left Window" })
map("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Terminal Down Window" })
map("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Terminal Up Window" })
map("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Terminal Right Window" })

-- Git mappings (Stardew themed)
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "🌾 Git Status" })
map("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { desc = "📊 Git Diff" })
map("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "✏️ Git Commit" })
map("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "📤 Git Push" })
map("n", "<leader>gl", "<cmd>Git pull<CR>", { desc = "📥 Git Pull" })

-- Plugin management
map("n", "<leader>pi", "<cmd>Lazy<CR>", { desc = "🎒 Install Plugins" })
map("n", "<leader>pu", "<cmd>Lazy update<CR>", { desc = "🔄 Update Plugins" })

-- Farming level check (fun feature)
map("n", "<leader>xp", function()
  local xp = _G.nvim_settings and _G.nvim_settings.quest and _G.nvim_settings.quest.xp or 0
  local level = math.floor(xp / 500) + 1
  vim.notify(string.format("🌟 Farming Level: %d | XP: %d/500", level, xp % 500), vim.log.levels.INFO)
end, { desc = "Check Farming Level" })
