local function config()
  require("telescope").load_extension("undo")
end
return {
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = config,
  },
}
