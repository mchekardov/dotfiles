local function config()
  local navic = require("nvim-navic")
  local icons = require("core.icons")

  navic.setup({
    separator = " " .. icons.ui.separator_right .. " ",
  })

  local function on_attach(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end

  local augroup = vim.api.nvim_create_augroup("NavicLspAttach", {})
  vim.api.nvim_create_autocmd("LspAttach", {
    group = augroup,
    callback = on_attach,
  })
end

return {
  {
    "SmiteshP/nvim-navic",
    config = config,
  },
}
