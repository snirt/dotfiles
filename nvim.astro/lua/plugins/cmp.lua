return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-emoji",
    {
      "Exafunction/codeium.nvim",
      opts = {
        enable_chat = true,
      },
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    local cmp = require "cmp"
    local lspkind = require "lspkind"

    opts.formatting = {
      expandable_indicator = true,
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = lspkind.cmp_format {
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = {
            Copilot = "",
            Codeium = "",
          },
        }(entry, vim_item)

        if entry.source.name == "copilot" then
          kind.kind = " Copilot"
        elseif entry.source.name == "codeium" then
          kind.kind = " Codeium"
        end

        return kind
      end,
    }
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.snippet.active { direction = 1 } then
          vim.schedule(function() vim.snippet.jump(1) end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active { direction = -1 } then
          vim.schedule(function() vim.snippet.jump(-1) end)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,

  config = function(_, opts)
    require("cmp").setup(opts)
    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
    vim.api.nvim_set_hl(0, "CmpItemKindCodeium", { fg = "#09A4B7" })
  end,
}
