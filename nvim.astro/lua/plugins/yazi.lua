return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  config = function()
    -- Check if the module exists before calling setup
    local ok, yazi = pcall(require, "yazi")
    if not ok then
      vim.notify("yazi.nvim not found", vim.log.levels.ERROR)
      return
    end
    -- yazi.setup {
    --   -- Optional configuration
    --   open_for_directories = false,
    -- }
  end,
  keys = {
    {
      "<leader><leader>",
      function()
        local ok, yazi = pcall(require, "yazi")
        if ok then
          yazi.yazi()
        else
          vim.notify("yazi.nvim not found", vim.log.levels.ERROR)
        end
      end,
      desc = "Open Yazi file manager",
    },
  },
}
