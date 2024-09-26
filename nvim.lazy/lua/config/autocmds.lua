-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
return {
  "LazyVim/LazyVim",
  opts = {
    keys = {
      { "<leader>ff", false },
      { "gp", false },
      { "gP", false },
      -- Add more keys to disable as needed
    },
  },
}
