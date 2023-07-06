local function config()
  -- hack, TODO remove then fixed
  vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { underline = true })

  require("indent_blankline").setup({
    char = "▏",
    context_char = "▏", -- hack, TODO remove when fixed
    use_treesitter = true,
    use_treesitter_scope = true,
    max_indent_increase = 1,
    filetype_exclude = require("core.commons").special_filetypes,
    show_current_context = true,
    show_current_context_start = true,
    show_current_context_start_on_current_line = true,
  })
end

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = config,
  },
}
