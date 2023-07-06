local function is_empty(s)
  return s == nil or s == ""
end

local function shorten_fp(filepath)
  -- TODO implement truncate_to_unique
  local root = vim.fn.getcwd()
  local match_begin, _ = filepath:find(root)
  if match_begin == 1 then
    return filepath:sub(#root + 2)
  end

  local home = vim.fn.expand("~")
  match_begin, _ = filepath:find(home)
  if match_begin == 1 then
    return "~/" .. filepath:sub(#home + 2)
  end
  return filepath
end

local function get_filepath()
  local filepath = vim.fn.expand("%:p")
  if is_empty(filepath) then
    return ""
  end
  return shorten_fp(filepath)
end

local function get_gps()
  local ok, gps = pcall(require, "nvim-navic")
  if not ok then
    return ""
  end
  if not gps.is_available() then
    return ""
  end
  return gps.get_location()
end

local function config()
  local icons = require("core.icons")
  local winbar = {
    lualine_c = {
      {
        "filetype",
        icon_only = true,
        separator = "",
        padding = {
          left = 1,
          right = 0,
        },
      },
      { get_filepath, separator = icons.ui.separator_right },
      get_gps,
    },
  }

  require("lualine").setup({
    options = {
      component_separators = { " ", " " },
      globalstatus = true,
      disabled_filetypes = {
        winbar = require("core.commons").special_filetypes,
      },
    },
    sections = {
      lualine_a = {
        "mode",
      },
      lualine_b = {
        { "branch", icon = "" },
        "diff",
        "diagnostics",
      },
      lualine_c = {},
      lualine_x = { "filetype" },
      lualine_y = {
        "location",
        { "progress", padding = { left = 0, right = 1 } },
      },
      lualine_z = {},
    },
    winbar = winbar,
    inactive_winbar = winbar,
    extensions = {
      "nvim-dap-ui",
      "nvim-tree",
      "quickfix",
      "symbols-outline",
      "toggleterm",
    },
  })
end

return {
  {
    "nvim-lualine/lualine.nvim",
    config = config,
  },
}
