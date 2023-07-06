local opts = {
  input = {
    default_prompt = "> ",
    relative = "win",
  },
  select = {
    backend = {
      "telescope",
      "builtin",
    },
  },
}
return {
  {
    "stevearc/dressing.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = opts,
  },
}
