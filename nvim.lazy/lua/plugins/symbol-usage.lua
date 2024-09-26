return {
  "Wansmer/symbol-usage.nvim",
  event = "BufReadPre", -- or 'LspAttach' for Neovim 0.10+
  config = function()
    require("symbol-usage").setup()
  end,
}
