local function config()
  local icons = require("core.icons")
  require("diffview").setup({
    signs = {
      fold_closed = icons.ui.chevron_down,
      fold_open = icons.ui.chevron_right,
    },
  })
end

return {
  {
    "sindrets/diffview.nvim",
    config = config,
  },
}
