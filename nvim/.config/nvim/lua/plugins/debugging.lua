return {}

--[[
return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue from breakpoint" })

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
  end,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
    },
  },
}
]]
