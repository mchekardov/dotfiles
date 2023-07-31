local function config()
  local icons = require("core.icons")
  require("diffview").setup({
    signs = {
      fold_closed = icons.ui.fold_closed,
      fold_open = icons.ui.fold_open,
    },
  })
end

return {
  {
    "sindrets/diffview.nvim",
    config = config,
  },
}
