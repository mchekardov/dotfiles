local function config()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup({
    sync_root_with_cwd = true,
    sort_by = "name",
    diagnostics = {
      enable = true,
    },
    git = {
      enable = true,
      ignore = false,
    },
    view = {
      width = 50,
      side = "right",
      preserve_window_proportions = true,
      mappings = {
        list = {
          { key = "h", action = "close_node" },
          { key = "l", action = "edit" },
        }
      },
    },
    renderer = {
      add_trailing = true,
      highlight_opened_files = "all",
      indent_markers = {
        enable = true,
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
        resize_window = false,
      },
      use_system_clipboard = false,
    },
    notify = {
      threshold = vim.log.levels.WARN,
    },
  })
end

return {
  {
    "kyazdani42/nvim-tree.lua",
    config = config,
  },
}
