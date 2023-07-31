local function config()
  local dap, dapui = require("dap"), require("dapui")
  local icons = require("core.icons")

  require("dapui").setup({
    controls = {
      enabled = false,
    },
    floating = {
      border = "rounded",
    },
    icons = {
      expanded = icons.ui.fold_open,
      collapsed = icons.ui.fold_closed,
      current_frame = icons.misc.arrow_right,
    },
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.6,
          },
          {
            id = "watches",
            size = 0.4,
          }
        },
        position = "bottom",
        size = 0.4,
      },
    },
  })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
  end
  dap.listeners.after.event_terminated["dapui_config"] = function()
    dapui.close({})
  end
  dap.listeners.after.event_exited["dapui_config"] = function()
    dapui.close({})
  end
end

return {
  {
    "rcarriga/nvim-dap-ui",
    version = "2.*",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = config,
  },
}
