local function config()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "diamond",
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Documents/Notes/Neorg",
          },
        },
      },
    },
  })
end

return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = config,
  },
}
