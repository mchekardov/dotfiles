local opts = {
  auto_resize_height = true,
  preview = {
    show_title = false,
    wrap = true,
  },
  func_map = {
    open = "o",
    openc = "<CR>",
  },
}

return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = opts,
  },
}
