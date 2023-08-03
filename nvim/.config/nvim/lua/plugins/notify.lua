local function config()
  local notify = require("notify")
  notify.setup({
    stages = "fade",
    render = "minimal",
    top_down = false,
  })
  vim.notify = notify
  require("telescope").load_extension("notify")
end

return {
  {
    "rcarriga/nvim-notify",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = config,
  },
}
