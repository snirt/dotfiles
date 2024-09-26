return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  keys = {
    { "gp", "<cmd>Lspsaga peek_definition<CR>" },
    { "K", "<cmd>Lspsaga hover_doc<CR>" },
    { "gr", "<cmd>Lspsaga finder tyd+ref+imp+def<CR>" },
  },
  config = function()
    require("lspsaga").setup({
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
      finder = {
        keys = {
          edit = "<CR>",
        },
      },
    })
  end,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
  },
}
