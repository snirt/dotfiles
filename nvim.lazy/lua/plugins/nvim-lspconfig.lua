return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false, -- Disable virtual text
        signs = true, -- Keep diagnostic signs in the gutter (optional)
        underline = true, -- Keep underlining for diagnostics (optional)
      },
    },
  },
}
