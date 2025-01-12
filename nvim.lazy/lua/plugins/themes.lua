return {
  {
    "navarasu/onedark.nvim",
    config = function()
      vim.g.onedark_style = "darker"
      vim.g.onedark_transparent_background = true
    end,
  },
  {
    "mhartington/oceanic-next",
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "sho-87/kanagawa-paper.nvim",
  },
  {
    "catppuccin/nvim",
  },
  {
    "projekt0n/github-nvim-theme",
  },
  {
    "fcancelinha/nordern.nvim",
  },
  {
    "catppuccin/nvim",
  },
  {
    "catppuccin/nvim",
  },
  {
    "scottmckendry/cyberdream.nvim",
  },
  -- set the default theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "OneDark",
    },
    priority = 1000,
  },
}
