local function config()
  require("lsp_lines").setup()
  vim.diagnostic.config({ virtual_text = false })
  vim.diagnostic.config({ virtual_lines = true })
end

return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = config,
  },
}
