local function config()
  local icons = require("core.icons")
  local highlights = {
    fill = "TabLineFill",
    head = "TabLineSel",
    current_tab = "TabLineSel",
    tab = "TabLine",
    tail = "TabLine",
  }
  require("tabby.tabline").set(function(line)
    return {
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and highlights.current_tab or highlights.tab
        local has_changes = false
        for _, win in ipairs(tab.wins().wins) do
          has_changes = has_changes or win.buf().is_changed()
        end
        return {
          line.sep(icons.ui.tab_separator_left, hl, highlights.fill),
          tab.number(),
          tab.current_win().file_icon(),
          tab.name(),
          has_changes and icons.ui.modified or tab.close_btn(icons.ui.close),
          line.sep(icons.ui.tab_separator_right, hl, highlights.fill),
          hl = hl,
          margin = " ",
        }
      end),
      hl = highlights.fill,
    }
  end)
end

return {
  {
    "nanozuki/tabby.nvim",
    config = config,
  },
}
