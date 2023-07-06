local function config()
  require("illuminate").configure({
    filetypes_denylist = require("core.commons").special_filetypes,
  })
end

return {
  {
    "RRethy/vim-illuminate",
    config = config,
  },
}
