-- go debugger config
return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"

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
  end,
}
