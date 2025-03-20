return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "js-debug-adapter")
      end,
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})

    if not dap.adapters["pwa-node"] then
      require("dap").adapters["pwa-node"] = {
        type = "server",
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "/Users/aneesh/.local/share/nvim/mason/packages/js-debug-adapter/js-debug-adapter",
          args = { "${port}" },
        },
      }
    end
    if not dap.adapters["node"] then
      dap.adapters["node"] = function(cb, config)
        if config.type == "node" then
          config.type = "pwa-node"
        end
        local nativeAdapter = dap.adapters["pwa-node"]
        if type(nativeAdapter) == "function" then
          nativeAdapter(cb, config)
        else
          cb(nativeAdapter)
        end
      end
    end

    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

    -- local vscode = require("dap.ext.vscode")
    -- vscode.type_to_filetypes["node"] = js_filetypes
    -- vscode.type_to_filetypes["pwa-node"] = js_filetypes

    for _, language in ipairs(js_filetypes) do
      if not dap.configurations[language] then
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "npm",
            args = { "run", "start:dev" },
            cwd = "${workspaceFolder}",
          },
        }
      end
    end
  end,
}
