local function config()
  require("which-key").setup({
    plugins = {
      -- TODO remove when fixed
      registers = false,
      spelling = {
        enabled = true,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
      },
    },
    window = {
      winblend = 10,
    }
  })
end

return {
  {
    "folke/which-key.nvim",
    config = config,
  },
}
