local function setup_adapters()
  local dap = require("dap")

  -- Add preLaunchTask functionality
  local function wrap_adapter(adapter)
    local adapter_func = function(callback, configuration)
      if configuration.preLaunchTask then
        if type(configuration.preLaunchTask) == "function" then
          configuration:preLaunchTask()
        elseif type(configuration.preLaunchTask) == "string" or type(configuration.preLaunchTask) == "table" then
          vim.fn.system(configuration.preLaunchTask)
        end
      end

      if type(adapter) == "function" then
        adapter(callback, configuration)
      elseif type(adapter) == "table" then
        callback(adapter)
      end
    end
    return adapter_func
  end

  dap.adapters.lldb = wrap_adapter({
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb",
  })
  dap.adapters.python = wrap_adapter({
    type = "executable",
    command = "/usr/bin/python",
    args = { "-m", "debugpy.adapter" },
  })
end

local function setup_configurations()
  local dap = require("dap")

  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
          return cwd .. "/venv/bin/python"
        elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
          return cwd .. "/.venv/bin/python"
        else
          return "/usr/bin/python"
        end
      end,
    },
  }
end

local function setup_signs()
  local icons = require("core.icons")

  local signs = {
    DapBreakpoint = {
      text = icons.dap.breakpoint,
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "",
    },
    DapBreakpointCondition = {
      text = icons.dap.conditional_breakpoint,
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "",
    },
    DapBreakpointRejected = {
      text = icons.dap.rejected_breakpoint,
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "",
    },
    DapLogPoint = {
      text = icons.dap.log_point,
      texthl = "DapLogPoint",
      linehl = "",
      numhl = "",
    },
    DapStopped = {
      text = "",
      texthl = "",
      linehl = "DapStopped",
      numhl = "",
    },
  }

  for name, opts in pairs(signs) do
    vim.fn.sign_define(name, opts)
  end
end

local function config()
  setup_adapters()
  setup_configurations()
  setup_signs()
end

return {
  {
    "mfussenegger/nvim-dap",
    config = config,
  },
}
