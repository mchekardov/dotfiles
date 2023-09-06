local function config()
  local onedark = require("onedark")
  onedark.setup({
    style = "cool",
    code_style = {
      comments = "italic",
      keywords = "bold",
      functions = "italic,bold",
    },
    colors = {
      bright_orange = "#ff8800",
    },
    highlights = {
      Folded = { fg = "none", bg = "none" },
      LeapMatch = { fg = "$bright_orange", fmt = "bold" },
      LeapLabelPrimary = { fg = "$bright_orange", fmt = "bold" },
      LeapLabelSecondary = { fg = "$bright_orange", fmt = "bold" },
      LeapBackDrop = { fg = "$grey" },
      ISwapSnipe = { fg = "$bright_orange", fmt = "bold" },
      ISwapSelection = { fg = "#cc9900" },
      DapBreakpoint = { fg = "$dark_red" },
      DapLogPoint = { fg = "$yellow" },
      DapStopped = { fg = "$fg", bg = "$dark_cyan" },
      TabLine = { fg = "$grey", bg = "$bg_d" },
      TabLineFill = { bg = "$black" },
      TabLineSel = { fg = "$fg", bg = "$bg0", fmt = "bold" },
    },
  })
  onedark.load()
end

return {
  "navarasu/onedark.nvim",
  config = config,
}
