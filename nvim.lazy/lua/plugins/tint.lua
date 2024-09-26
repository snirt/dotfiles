return {
  "levouh/tint.nvim",
  event = "VeryLazy",
  config = function()
    require("tint").setup({
      tint = -45, -- Darken colors, use a positive value to brighten
      saturation = 0.6,
      transforms = require("tint").transforms.SATURATE_TINT,
      tint_background_colors = false, -- Set to false to preserve background colors
      highlight_ignore_patterns = { "WinSeparator", "Status.*" },
      window_ignore_function = function(winid)
        local bufid = vim.api.nvim_win_get_buf(winid)
        local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
        local floating = vim.api.nvim_win_get_config(winid).relative ~= ""
        -- Ignore floating windows and special buffers
        return buftype == "terminal" or buftype == "prompt" or floating
      end,
    })

    -- Optional: Refresh highlights after all plugins have loaded
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        require("tint").refresh()
      end,
    })
  end,
}
