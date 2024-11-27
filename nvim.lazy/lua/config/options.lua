-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.o.autochdir = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.list = false
-- Set up whichwrap to allow moving to the next line with the arrow keys
vim.opt.whichwrap:append("<,>,[,],h,l")

-- remove virtual text
vim.diagnostic.config({ virtual_text = false })

-- dap remote debugger
local dap = require("dap")
dap.adapters.go_remote = {
  type = "server",
  host = "127.0.0.1",
  port = 40000,
}

dap.configurations.go = dap.configurations.go or {}
table.insert(dap.configurations.go, {
  type = "go_remote",
  name = "Remote Delve Debugger",
  request = "attach",
  mode = "remote",
  remotePath = "",
  port = 40000,
  host = "127.0.0.1",
  cwd = "${workspaceFolder}",
})

-- list of make targets
-- function RunMakeTarget()
--   coroutine.wrap(function()
--     local actions = {
--       ["default"] = function(selected)
--         vim.api.nvim_command("terminal make " .. selected[1])
--       end,
--     }
--
--     require("fzf-lua").fzf_exec(
--       "make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\\/\\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' | sort -u",
--       {
--         prompt = "Make Targets> ",
--         cwd = vim.fn.getcwd(),
--         actions = actions,
--       }
--     )
--   end)()
-- end

local function diff_buffer_with_saved()
  local current_buf = vim.api.nvim_get_current_buf()
  local file_path = vim.api.nvim_buf_get_name(current_buf)

  -- Check if the buffer has been modified
  if not vim.bo[current_buf].modified then
    print("No changes to diff")
    return
  end

  -- Create a new split with the saved file content
  vim.cmd("vnew")
  local temp_buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = temp_buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = temp_buf })
  vim.api.nvim_buf_set_name(temp_buf, "Saved version")

  -- Read the content of the saved file
  local lines = vim.fn.readfile(file_path)
  vim.api.nvim_buf_set_lines(temp_buf, 0, -1, false, lines)

  -- Set up diff mode
  vim.cmd("diffthis")
  vim.cmd("wincmd p") -- Go back to the original window
  vim.cmd("diffthis")

  -- Set up an autocommand to close diff when one window is closed
  vim.cmd([[
    augroup DiffBufferWithSaved
      autocmd!
      autocmd WinClosed * if winnr('$') == 1 | diffoff | endif
    augroup END
  ]])
end

-- Create a Vim command to call the function
vim.api.nvim_create_user_command("DiffBufferWithSaved", diff_buffer_with_saved, {})

-- Create a keymap to call the function
vim.keymap.set(
  "n",
  "<leader>bcd",
  diff_buffer_with_saved,
  { noremap = true, silent = true, desc = "Diff buffer with saved file" }
)
