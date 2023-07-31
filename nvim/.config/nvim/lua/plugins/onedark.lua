local function config()
  local onedark = require("onedark")
  onedark.setup({
    style = "cool",
    code_style = {
      comments = "italic",
      keywords = "bold",
      functions = "italic,bold",
    },
    highlights = {
      LeapMatch = { fg = "#ff9900", fmt = "bold" },
      LeapLabelPrimary = { fg = "#ff9900", fmt = "bold" },
      LeapLabelSecondary = { fg = "#ff9900", fmt = "bold" },
      LeapBackDrop = { fg = "$grey" },
      ISwapSnipe = { fg = "#ff9900", fmt = "bold" },
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
