return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup {
      -- You can add any Lspsaga configuration options here
      ui = {
        border = "rounded",
      },
      hover = {
        max_width = 0.6,
        max_height = 0.6,
      },
      diagnostic = {
        virtual_text = false,
        signs = false,
      },
      lightbulb = {
        enable = false,
        virtual_text = false,
      },
    }
  end,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
  },
}
