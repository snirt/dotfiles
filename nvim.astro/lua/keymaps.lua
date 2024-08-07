-- Key mapping for LSP hover in a floating window using lspsaga
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Optional: Additional useful Lspsaga keymaps
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- copilot chat
vim.api.nvim_set_keymap("n", "<leader>aa", ":CopilotChatToggle<CR>", { noremap = true, silent = true })

-- LazyVim exit all command
vim.api.nvim_set_keymap("n", "<leader>qq", ":qa<CR>", { noremap = true, silent = true })

-- telescope make
vim.api.nvim_set_keymap("n", "<leader>M", ":Telescope make<CR>", { noremap = true, silent = true })
