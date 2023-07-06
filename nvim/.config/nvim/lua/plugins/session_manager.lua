local function config()
  require("session_manager").setup({
    path_replacer = "++", -- Doesn't work
    colon_replacer = "^^",
    autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
    autosave_only_in_session = true,
  })
end

return {
  {
    "Shatur/neovim-session-manager",
    config = config,
  },
}
