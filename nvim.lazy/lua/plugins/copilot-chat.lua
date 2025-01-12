return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      debug = true, -- Enable debugging if needed
      show_help = true,
      window = { layout = "float" },
      auto_follow_cursor = false,
      prompts = {
        -- Example: Customize prompts or models here
        Commit = {
          prompt = "Use GPT-4o to write a commit message.",
          selection = require("CopilotChat.select").gitdiff,
        },
      },
      model = "gpt-4o", -- Specify the desired model
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)
    end,
  },
}
