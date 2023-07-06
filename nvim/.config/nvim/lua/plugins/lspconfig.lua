local function setup_servers()
  local lspconfig = require("lspconfig")

  local default_server_config = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }
  local server_configs = {
    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
            keywordSnippet = "Replace",
          },
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
    clangd = {},
    pyright = {},
    bashls = {},
    arduino_language_server = {
      cmd = {
        "arduino-language-server",
        "-cli-config", "~/.arduino15/arduino-cli.yaml",
        "-fqbn", "arduino:avr:nano",
        "-cli", "arduino-cli",
        "-clangd", "clangd",
      },
    },
  }
  for server_name, server_config in pairs(server_configs) do
    server_config = vim.tbl_deep_extend("keep", server_config,
      default_server_config)
    lspconfig[server_name].setup(server_config)
  end
end

local function setup_ui()
  vim.diagnostic.config({
    virtual_text = false,
  })
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
    { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = "rounded" })
end

local function setup_signs()
  local icons = require("core.icons")
  local signs = {
    DiagnosticSignError = icons.diagnostics.error,
    DiagnosticSignWarn = icons.diagnostics.warning,
    DiagnosticSignInfo = icons.diagnostics.info,
    DiagnosticSignHint = icons.diagnostics.hint,
  }
  for type, icon in pairs(signs) do
    vim.fn.sign_define(type, { text = icon, texthl = type, numhl = nil })
  end
end

local function config()
  setup_servers()
  setup_ui()
  setup_signs()
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
    },
    config = config,
  },
}
