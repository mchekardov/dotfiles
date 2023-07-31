local opts = {
  scope = "visible",
  modes = function() return true end,
  blending = {
    threshold = 1, -- Disables the feature
  },
  extra = {
    follow_tw = "+1",
  },
}

return {
  {
    "Bekaboo/deadcolumn.nvim",
    opts = opts,
  },
}
