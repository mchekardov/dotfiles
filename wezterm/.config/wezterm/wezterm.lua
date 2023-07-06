local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  font = wezterm.font("FantasqueSansMono Nerd Font Mono"),
  font_size = 15.0,
  underline_position = "-2px",
  underline_thickness = "2px",
  cursor_thickness = "1px",
  keys = {
    {
      key = "c",
      mods = "CTRL|SHIFT",
      action = wezterm.action.CopyTo("Clipboard"),
    },
    {
      key = "v",
      mods = "CTRL|SHIFT",
      action = wezterm.action.PasteFrom("Clipboard"),
    },
    {
      key = "-",
      mods = "CTRL",
      action = wezterm.action.DecreaseFontSize,
    },
    {
      key = "=",
      mods = "CTRL",
      action = wezterm.action.IncreaseFontSize,
    },
    {
      key = "0",
      mods = "CTRL",
      action = wezterm.action.ResetFontSize,
    },
    {
      key = "r",
      mods = "CTRL|SHIFT",
      action = wezterm.action.ReloadConfiguration,
    },
    {
      key = "k",
      mods = "CTRL|SHIFT",
      action = wezterm.action.ClearScrollback("ScrollbackOnly"),
    },
    {
      key = "l",
      mods = "CTRL|SHIFT",
      action = wezterm.action.ShowDebugOverlay,
    },
    {
      key = "f",
      mods = "CTRL|SHIFT",
      action = wezterm.action.Search({ CaseInSensitiveString = "" }),
    },
    {
      key = "x",
      mods = "CTRL|SHIFT",
      action = wezterm.action.ActivateCopyMode,
    },
    {
      key = "Space",
      mods = "CTRL|SHIFT",
      action = wezterm.action.QuickSelect,
    },
  },
  disable_default_key_bindings = true,
  mouse_bindings = {
    {
      event = { Down = { streak = 1, button = "Middle" } },
      mods = "NONE",
      action = wezterm.action.DisableDefaultAssignment,
    },
  },
  color_scheme = "nord",
  enable_tab_bar = false,
  window_background_opacity = 0.9,
  window_padding = {
    left = "1px",
    right = "1px",
    top = "8px",
    bottom = "8px",
  },
  scrollback_lines = 5000,
}
