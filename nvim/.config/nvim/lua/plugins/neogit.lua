local function config()
  local icons = require("core.icons")
  require("neogit").setup({
    disable_builtin_notifications = true,
    kind = "split",
    signs = {
      section = { icons.ui.chevron_right, icons.ui.chevron_down },
      item = { icons.ui.chevron_right, icons.ui.chevron_down },
      hunk = { icons.ui.chevron_right, icons.ui.chevron_down },
    },
  })
end

return {
  {
    "NeogitOrg/neogit",
    requirements = {
      "nvim-lua/plenary.nvim"
    },
    config = config,
  },
}
