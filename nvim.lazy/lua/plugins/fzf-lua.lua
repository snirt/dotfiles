return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({
      winopts = {
        preview = {
          default = "bat", -- Use 'bat' as the default previewer
          layout = "vertical", -- Set layout to vertical
        },
      },
    })
  end,
  -- keys = {
  --   -- Change the keymap for lsp_document_symbols
  --   {
  --     "<leader>ss",
  --     "<cmd>FzfLua lsp_document_symbols<cr>",
  --     desc = "Document Symbols",
  --   },
  -- },
}
