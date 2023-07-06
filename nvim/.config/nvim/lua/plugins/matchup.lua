local function config()
  vim.g.matchup_surround_enabled = 1
  vim.g.matchup_delim_noskips = 1
  vim.g.matchup_matchparen_offscreen = { method = "popup" }
  vim.g.matchup_matchparen_deferred = 1
end

return {
  {
    "andymass/vim-matchup",
    config = config,
  },
}
