local keymap = vim.keymap
-- KEYS UNBINDING
keymap.del("n", "gra")
keymap.del("n", "grn")
keymap.del("n", "grr")

-- Key mapping for LSP hover in a floating window using lspsaga
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })

-- Optional: Additional useful Lspsaga keymaps
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { noremap = true, silent = true })
keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })

-- copilot chat
vim.api.nvim_set_keymap("n", "<leader>aa", ":CopilotChatToggle<CR>", { noremap = true, silent = true })

-- LazyVim exit all command
vim.api.nvim_set_keymap("n", "<leader>qq", ":qa<CR>", { noremap = true, silent = true })

-- telescope make
vim.api.nvim_set_keymap("n", "<leader>M", ":Telescope make<CR>", { noremap = true, silent = true })

-- open open reference in lspsaga
vim.api.nvim_set_keymap("n", "gr", "<cmd>Lspsaga finder tyd+ref+imp+def<CR>", { noremap = true, silent = true })

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set(
    { "n", "v", "s", "x", "o", "i", "l", "c", "t" },
    "<D-v>",
    function() vim.api.nvim_paste(vim.fn.getreg "+", true, -1) end,
    { noremap = true, silent = true }
  )
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
