local function config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  local pickers = {
    buffers = {
      previewer = false,
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        }
      }
    },
    colorscheme = {
      enable_preview = true,
    },
    find_files = {
      hidden = true,
      previewer = false,
    },
    live_grep = {
      only_sort_text = true,
    },
  }

  telescope.setup({
    defaults = {
      prompt_prefix = " ",
      initial_mode = "normal",
      layout_strategy = "vertical",
      layout_config = {
        horizontal = {
          preview_width = 0.55,
        },
        vertical = {
          prompt_position = "bottom",
          preview_cutoff = 0,
        }
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        },
        n = {
          ["q"] = actions.close,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        },
      },
      path_display = { "smart" },
      set_env = { ["COLORTERM"] = "truecolor" },
    },
    pickers = pickers,
    extensions = {
      undo = {
        use_delta = false,
      },
    },
  })

  telescope.load_extension("fzf")
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-symbols.nvim",
    },
    config = config,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
