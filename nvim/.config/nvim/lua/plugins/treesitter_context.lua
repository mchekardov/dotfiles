local opts = {
  patterns = {
    default = {
      "class",
      "function",
      "method",
      "interface",
      "struct",
    },
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    opts = opts,
  },

}
