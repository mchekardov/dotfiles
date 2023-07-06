local function config()
  local icons = require("core.icons")
  require("scrollview").setup({
    column = 1,
    current_only = true,
    signs_on_startup = {
      "cursor",
      "marks",
      "diagnostics",
      "search",
    },
    cursor_symbol = ">",
    diagnostics_error_symbol = icons.diagnostics.error,
    diagnostics_warn_symbol = icons.diagnostics.warning,
    diagnostics_info_symbol = icons.diagnostics.info,
    diagnostics_hint_symbol = icons.diagnostics.hint,
    search_symbol = { "⠂", "⠅", "⠇", "⠗", "⠟", "⠿" },
  })
end

return {
  {
    "dstein64/nvim-scrollview",
    config = config,
  },
}
