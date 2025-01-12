-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps
local lspkeys = require("lazyvim.plugins.lsp.keymaps").get()

lspkeys[#lspkeys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>" }
lspkeys[#lspkeys + 1] = { "gr", "<cmd>Lspsaga finder tyd+ref+imp+def<CR>" }

local opts_arg = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts_arg)

vim.api.nvim_set_keymap("n", "<leader>gn", "<cmd>Neogit<CR>", opts_arg)

-- go down and up +5 lines
vim.keymap.set("n", "<M-j>", "5j", opts_arg)
vim.keymap.set("n", "<M-k>", "5k", opts_arg)

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<D-v>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end, { noremap = true, silent = true })
end

-- Allow clipboard copy paste in neovim
vim.keymap.set("", "<D-v>", "+p<CR>", opts_arg)
vim.keymap.set("!", "<D-v>", "<C-R>+", opts_arg)
vim.keymap.set("t", "<D-v>", "<C-R>+", opts_arg)
vim.keymap.set("v", "<D-v>", "<C-R>+", opts_arg)

-- toggle Neo-tree as a sidebar
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true, position = "left", dir = vim.loop.cwd() })
end, { desc = "Toggle Neo-tree (sidebar)" })

-- toggle Neo-tree as a floating window
vim.keymap.set("n", "<leader>o", function()
  require("neo-tree.command").execute({ toggle = true, position = "float", dir = vim.loop.cwd() })
end, { desc = "Toggle Neo-tree (float)" })

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

-- vim.keymap.set("n", "<leader>mt", RunMakeTarget, { desc = "Run Make Target" })

vim.keymap.set("n", "<M-x>", "<leader>bd", { desc = "Delete buffer" })

-- fix issue with fzf-lua search symbols
vim.keymap.set("n", "<leader>ss", function()
  require("fzf-lua").lsp_document_symbols()
end, { noremap = true, silent = true, desc = "Search file symbols" })

-- -- leader+O to open project
-- vim.keymap.set(
--   "n",
--   "<leader>PP",
--   "<cmd>NeovimProjectHistory<CR>",
--   { noremap = true, silent = true, desc = "Project history" }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>Pd",
--   "<cmd>NeovimProjectDiscove<CR>",
--   { noremap = true, silent = true, desc = "Project discover" }
-- )

vim.keymap.set("n", "<leader>gdh", "<cmd>DiffviewClose<CR>", { noremap = true, silent = true, desc = "Close diffview" })

-- Kubernetes
vim.keymap.set("n", "<leader>k", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })

-- DEBUG CONFIG
local dap = require("dap")

-- set vscode keymap for debugging
-- Continue execution
vim.keymap.set("n", "<F5>", function()
  dap.continue()
end, { silent = true, desc = "Continue" })

-- Step over
vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, { silent = true, desc = "Step Over" })

-- Step into
vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, { silent = true, desc = "Step Into" })

-- Step out
vim.keymap.set("n", "<Shift-F11>", function()
  dap.step_out()
end, { silent = true, desc = "Step Out" })

-- Toggle breakpoint
vim.keymap.set("n", "<F9>", function()
  dap.toggle_breakpoint()
end, { silent = true, desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>db", function()
  require("persistent-breakpoints.api").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
