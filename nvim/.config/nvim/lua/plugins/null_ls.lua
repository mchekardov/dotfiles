local function config()
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.black,
    },
  })
end

return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = config,
  },
}
