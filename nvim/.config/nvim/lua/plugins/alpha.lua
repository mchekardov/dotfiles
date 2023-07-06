local function config()
  local dashboard = require("alpha.themes.dashboard")

  local header = [[
 __    __                             __
|  \  |  \                           |  \
| ▓▓\ | ▓▓ ______   ______  __     __ \▓▓______ ____
| ▓▓▓\| ▓▓/      \ /      \|  \   /  \  \      \    \
| ▓▓▓▓\ ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\\▓▓\ /  ▓▓ ▓▓ ▓▓▓▓▓▓\▓▓▓▓\
| ▓▓\▓▓ ▓▓ ▓▓    ▓▓ ▓▓  | ▓▓ \▓▓\  ▓▓| ▓▓ ▓▓ | ▓▓ | ▓▓
| ▓▓ \▓▓▓▓ ▓▓▓▓▓▓▓▓ ▓▓__/ ▓▓  \▓▓ ▓▓ | ▓▓ ▓▓ | ▓▓ | ▓▓
| ▓▓  \▓▓▓\▓▓     \\▓▓    ▓▓   \▓▓▓  | ▓▓ ▓▓ | ▓▓ | ▓▓
 \▓▓   \▓▓ \▓▓▓▓▓▓▓ \▓▓▓▓▓▓     \▓    \▓▓\▓▓  \▓▓  \▓▓
]]
  dashboard.section.header.val = {}
  for line in header:gmatch("([^\n]+)") do
    table.insert(dashboard.section.header.val, line)
  end
  dashboard.section.header.opts.position = "center"
  dashboard.section.header.opts.hl = "Label"

  dashboard.section.buttons.val = {
    dashboard.button("l", " Load session", "<Cmd>SessionManager load_session<CR>", {}),
    dashboard.button("r", " Recent files", "<Cmd>Telescope oldfiles<CR>", {}),
    dashboard.button("f", " Find file", "<Cmd>Telescope find_files<CR>", {}),
    dashboard.button("n", " New file", "<Cmd>enew<CR>", {}),
    dashboard.button("p", " Plugin manager", "<Cmd>Lazy<CR>", {}),
    dashboard.button("q", " Quit", "<Cmd>qa<CR>", {}),
  }

  local plugins_total = #vim.tbl_keys(require("lazy").plugins())
  dashboard.section.footer.val = plugins_total
      .. " plugins"
      .. " - v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch

  require("alpha").setup(dashboard.opts)
end

return {
  {
    "goolord/alpha-nvim",
    config = config,
  },
}
