return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<leader>fs"] = { "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find symbols in current file" },
          ["<leader>fS"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Find symbols in workspace" },
          ["<leader>gn"] = { ":Neogit<CR>", noremap = true, silent = true },
        },
      },
    },
  },
}
