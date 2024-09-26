return {
  "navarasu/onedark.nvim",
  -- set as default colorscheme
  config = function()
    vim.g.onedark_style = "darker"
    vim.g.onedark_transparent_background = true
    vim.cmd([[colorscheme onedark]])
  end,
}
