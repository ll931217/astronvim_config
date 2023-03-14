return function()
  local dap, dapui, dapvscodejs = require("dap"), require("dapui"), require('dap-vscode-js')

  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
  }

  dapvscodejs.setup {
    node_path = "node",
    -- debugger_path = DEBUGGER_PATH,
    -- debugger_cmd = { "js-debug-adapter" },
    adapters = { "pwa-node", "pwa-chrome" },
  }

  dap.configurations = require "user.configs.dap"

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  -- dap.listeners.after.event_terminated["dapui_config"] = function()
  --   dapui.close()
  -- end
  -- dap.listeners.after.event_exited["dapui_config"] = function()
  --   dapui.close()
  -- end
end

