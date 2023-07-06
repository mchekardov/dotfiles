local function config()
  vim.g.lastplace_ignore_buftype = table.concat({
    "quickfix",
    "nofile",
    "help",
    "lazy",
    "checkhealth",
    "lspinfo",
  }, ",")
  vim.g.lastplace_open_folds = 0
end

return {
  {
    "farmergreg/vim-lastplace",
    config = config,
  },
}
