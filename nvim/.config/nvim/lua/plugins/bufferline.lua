local diagnostics_indicator = function(_, _, diagnostics_dict, _)
  local icons = require("core.icons")
  local signs = {
    error = icons.diagnostics.error,
    warning = icons.diagnostics.warning,
    info = icons.diagnostics.info,
  }

  local s = ""
  for name, count in pairs(diagnostics_dict) do
    if signs[name] and count > 0 then
      s = s .. signs[name] .. count
    end
  end
  return s
end

local opts = {
  highlights = {
    buffer_selected = {
      bold = true,
    },
    -- TODO remove when fixed
    tab_separator_selected = {
      bg = {
        attribute = "bg",
        highlight = "Normal",
      },
    },
  },
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "vert sbuffer %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      style = "none",
    },
    tab_size = 0,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = diagnostics_indicator,
    diagnostics_update_in_insert = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
      },
      {
        filetype = "Outline",
        text = "Outline",
      },
    },
    separator_style = "slant",
    sort_by = "id",
  },
}

return {
  {
    "akinsho/bufferline.nvim",
    opts = opts,
  },
}
