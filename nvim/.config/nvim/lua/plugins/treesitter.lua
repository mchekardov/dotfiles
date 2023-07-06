local function config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "arduino",
      "bash",
      "cpp",
      "diff",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "help",
      "ini",
      "json",
      "lua",
      "make",
      "python",
      "regex",
      "sql",
      "toml",
      "vim",
      "yaml",
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<A-CR>",
        node_decremental = "<BS>",
      },
    },
    autotag = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["ia"] = "@parameter.inner",
          ["aa"] = "@parameter.outer",
          ["i,"] = "@parameter.inner",
          ["a,"] = "@parameter.outer",
          ["ib"] = "@block.inner",
          ["ab"] = "@block.outer",
          ["ic"] = "@call.inner",
          ["ac"] = "@call.outer",
          ["iC"] = "@class.inner",
          ["aC"] = "@class.outer",
          ["if"] = "@function.inner",
          ["af"] = "@function.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]a"] = "@parameter.inner",
          ["]b"] = "@block.outer",
          ["]c"] = "@call.outer",
          ["]C"] = "@class.outer",
          ["]f"] = "@function.outer",
        },
        goto_previous_start = {
          ["[a"] = "@parameter.inner",
          ["[b"] = "@block.outer",
          ["[c"] = "@call.outer",
          ["[C"] = "@class.outer",
          ["[f"] = "@function.outer",
        },
      },
    },
    refactor = {
    },
    matchup = {
      enable = true,
    },
  })
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-refactor",
    },
    config = config,
    build = ":TSUpdate",
  },
  { "windwp/nvim-ts-autotag", },
  { "nvim-treesitter/nvim-treesitter-textobjects", },
  { "JoosepAlviste/nvim-ts-context-commentstring", },
  { "nvim-treesitter/nvim-treesitter-refactor" },
}
