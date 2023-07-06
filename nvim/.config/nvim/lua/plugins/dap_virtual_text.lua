local opts = {
  highlight_new_as_changed = true,
  only_first_definition = false,
  virt_lines = true,
}

return {
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    opts = opts,
  },
}
