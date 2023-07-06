local function config()
  require("ufo").setup({
    provider_selector = function()
      return { "treesitter", "indent" }
    end
  })
end

return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async"
    },
    config = config,
  },
}
