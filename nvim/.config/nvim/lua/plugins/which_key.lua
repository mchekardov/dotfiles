local opts = {
  plugins = {
    registers = false, -- temporary fix
    spelling = {
      enabled = true,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
    },
  },
}

return {
  {
    "folke/which-key.nvim",
    opts = opts,
  },
}
