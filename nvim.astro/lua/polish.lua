--if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- identation size 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- remove virtual text
vim.diagnostic.config { virtual_text = false }

-- -- auto change directory
-- vim.o.autochdir = true
vim.opt.whichwrap:append "<,>,[,],h,l"

require("neo-tree").setup {
  filesystem = {
    follow_current_file = true, -- This will find and focus the file in the active buffer
  },
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer
  },
}

-- require("copilot").setup {
--   suggestion = { enabled = false },
--   panel = { enabled = false },
-- }
-- vim.g.codeium_disable_bindings = 1

-- autocomplete config
local cmp = require "cmp"
cmp.setup {
  sources = {
    { name = "copilot", group_index = 2 },
    { name = "codeium", group_index = 2 },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },
}

-- git blamer
vim.g.blamer_delay = 500
vim.g.blamer_enabled = true

-- default theme
vim.cmd [[colorscheme onedark]]

require("neo-tree").setup {
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = true, -- Show hidden files
    },
  },
}
