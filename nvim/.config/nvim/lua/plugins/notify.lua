local function config()
  local opts = {
    render = "minimal",
    stages = "fade",
  }

  local notify = require("notify")
  notify.setup(opts)
  vim.notify = notify
end

return {
  {
    "rcarriga/nvim-notify",
    config = config,
  },
}
