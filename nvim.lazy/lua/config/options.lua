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

-- DAP remote setup
-- local dap_ok, dap = pcall(require, "dap")
-- if dap_ok then
--   dap.adapters.go_remote = {
--     type = "server",
--     host = "127.0.0.1",
--     port = 40000,
--   }
-- end

local function load_env(file)
  local env_vars = {}
  local f = io.open(file, "r")
  if not f then
    return env_vars
  end
  vim.notify("Loading environment variables from " .. file, vim.log.levels.INFO)
  for line in f:lines() do
    local key, value = line:match("^%s*([%w_]+)%s*=%s*(.+)%s*$")
    if key and value then
      env_vars[key] = value
    end
  end
  f:close()
  return env_vars
end

-- load launch config dynamically
local env_vars = load_env(vim.fn.getcwd() .. "/.env")

for key, value in pairs(env_vars) do
  vim.fn.setenv(key, value)
end
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

-- Neo-tree configuration to follow the current buffer location
vim.cmd([[
  let g:neo_tree_remove_legacy_commands = 1
  let g:neo_tree_follow = 1
]])
