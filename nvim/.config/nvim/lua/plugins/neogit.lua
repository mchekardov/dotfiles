local function config()
  local icons = require("core.icons")
  require("neogit").setup({
    disable_builtin_notifications = true,
    use_magit_keybindings = true,
    kind = "split",
    signs = {
      section = { icons.ui.fold_open, icons.ui.fold_closed },
      item = { icons.ui.fold_open, icons.ui.fold_closed },
      hunk = { icons.ui.fold_open, icons.ui.fold_closed },
    },
    integrations = {
      diffview = true,
    },
  })
  -- Folding for some reason works in NeogitStatus buffer and is broken
  -- TODO remove when fixed
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "NeogitStatus" },
    group = vim.api.nvim_create_augroup("NeogitStatusOptions", {}),
    callback = function()
      vim.opt.foldenable = false
      vim.opt.foldcolumn = "0"
    end,
  })
end

return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = config,
  },
}
