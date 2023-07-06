local function apply_mappings_rec(mode, mappings, prefix)
  assert(type(mappings) == "table")
  if mappings[1] == nil then
    for key, value in pairs(mappings) do
      apply_mappings_rec(mode, value, prefix .. key)
    end
  else
    assert(type(mappings[1]) == "string" or type(mappings[1]) == "function")
    assert(type(mappings[2]) == "table" or type(mappings[2]) == "nil")
    vim.keymap.set(mode, prefix, mappings[1], mappings[2])
  end
end

local function apply_mappings(mode, mappings)
  assert(type(mode) == "string" or type(mode) == "table")
  apply_mappings_rec(mode, mappings, "")
end

local leader_mappings = {
  b = {
    -- Buffer actions
    c = { "<Cmd>Bdelete<CR>", { desc = "Close current buffer" } },
    l = {
      "<Cmd>Telescope buffers<CR>",
      { desc = "Telescope: Open buffers picker" },
    },
    n = { "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer forward" } },
    N = { "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer backward" } },
  },
  e = {
    "<Cmd>NvimTreeFocus<CR>",
    { desc = "NvimTree: Focus file explorer" },
  },
  f = {
    -- File actions
    e = {
      "<Cmd>Telescope file_browser theme=ivy<CR>",
      { desc = "Telescope: Open file browser" },
    },
    f = {
      "<Cmd>Telescope find_files<CR>",
      { desc = "Telescope: Open files picker" },
    },
    r = {
      "<Cmd>Telescope oldfiles<CR>",
      { desc = "Telescope: Open recent files picker" },
    },
    z = {
      "<Cmd>Telescope live_grep theme=ivy<CR>",
      { desc = "Telescope: Fuzzy search workspace for text" },
    },
  },
  g = { "<Cmd>Neogit<CR>", { desc = "Neogit: Open status menu" } },
  i = { "<Cmd>ISwap<CR>", { desc = "ISwap: Toggle ISwap" } },
  l = {
    -- LSP actions
    d = {
      "<Cmd>Telescope diagnostics bufnr=0 theme=ivy<CR>",
      { desc = "Telescope: Open LSP buffer diagnostics picker" },
    },
    D = {
      "<Cmd>Telescope diagnostics theme=ivy<CR>",
      { desc = "Telescope: Open LSP workspace diagnostics picker" },
    },
    i = { "<Cmd>LspInfo<CR>", { desc = "LspConfig: Open LSP info menu" } },
    s = {
      "<Cmd>Telescope lsp_document_symbols theme=ivy<CR>",
      { desc = "Telescope: Open LSP document symbols picker" },
    },
    S = {
      "<Cmd>Telescope lsp_dynamic_workspace_symbols theme=ivy<CR>",
      { desc = "Telescope: Open LSP workspace symbols picker" },
    },
  },
  N = {
    "<Cmd>Telescope notify<CR>",
    { desc = "Notify: Open notifications history in telescope" },
  },
  p = { "<Cmd>Lazy<CR>", { desc = "Lazy: Open plugin manager panel" } },
  q = { "<Cmd>cwindow<CR>", { desc = "Open quickfixlist" } },
  s = {
    -- Session actions
    c = {
      "<Cmd>SessionManager save_current_session<CR>",
      { desc = "SessionManager: Save current session" },
    },
    d = {
      "<Cmd>SessionManager delete_session<CR>",
      { desc = "SessionManager: Delete a session" },
    },
    l = {
      "<Cmd>SessionManager load_session<CR>",
      { desc = "SessionManager: Load a session" },
    },
  },
  u = { "<Cmd>Telescope undo<CR>", { desc = "Undotree: Open undo tree" } },
  z = {
    "<Cmd>Telescope current_buffer_fuzzy_find theme=ivy<CR>",
    { desc = "Telescope: Fuzzy search text in current buffer" },
  },
}

local mappings = {
  i = {
    ["<MiddleMouse>"] = { "<Nop>" },
    ["<2-MiddleMouse>"] = { "<Nop>" },
    ["<3-MiddleMouse>"] = { "<Nop>" },
    ["<4-MiddleMouse>"] = { "<Nop>" },
    ["<C-h>"] = { "<C-w>" }, -- <C-BS>
    ["<A-j>"] = { "<Esc><Cmd>m .+1<CR>==gi", { desc = "Move line down" } },
    ["<A-k>"] = { "<Esc><Cmd>m .-2<CR>==gi", { desc = "Move line up" } },
  },
  n = {
    ["<MiddleMouse>"] = { "<Nop>" },
    ["<2-MiddleMouse>"] = { "<Nop>" },
    ["<3-MiddleMouse>"] = { "<Nop>" },
    ["<4-MiddleMouse>"] = { "<Nop>" },
    ["H"] = { "^" },
    ["L"] = { "$" },
    ["<A-j>"] = { "<Cmd>m .+1<CR>==", { desc = "Move line down" } },
    ["<A-k>"] = { "<Cmd>m .-2<CR>==", { desc = "Move line up" } },
    ["<Esc>"] = { "<Cmd>nohl<CR>", { desc = "Clear search highlight" } },
    ["<Leader>"] = leader_mappings,
    ["<Tab>"] = {
      "<Cmd>BufferLineCycleNext<CR>",
      { desc = "Bufferline: Goto next buffer" },
    },
    ["<S-Tab>"] = {
      "<Cmd>BufferLineCyclePrev<CR>",
      { desc = "Bufferline: Goto previous buffer" },
    },
    ["<C-Tab>"] = {
      "<Cmd>BufferLineMoveNext<CR>",
      { desc = "Bufferline: Move buffer forward" },
    },
    ["<C-S-Tab>"] = {
      "<Cmd>BufferLineMovePrev<CR>",
      { desc = "Bufferline: Move buffer backward" },
    },
    ["<F7>"] = {
      "<Cmd>lua require'dap'.step_into()<CR>",
      { desc = "Dap: Step into" },
    },
    ["<F8>"] = {
      "<Cmd>lua require'dap'.step_over()<CR>",
      { desc = "Dap: Step over" },
    },
    -- <S-F8>
    ["<F20>"] = {
      "<Cmd>lua require'dap'.step_out()<CR>",
      { desc = "Dap: Step out" },
    },
    -- <C-F8>
    ["<F32>"] = {
      "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
      { desc = "Dap: Toggle breakpoint" },
    },
    -- <C-S-F8>
    ["<F44>"] = {
      "<Cmd>lua require'dap'.clear_breakpoints()<CR>",
      { desc = "Dap: Clear breakpoints" },
    },
    ["<F9>"] = {
      "<Cmd>lua require'dap'.continue<CR>",
      { desc = "Dap: Run or continue" },
    },
    -- <A-F9>
    ["<F57>"] = {
      "<Cmd>lua require'dap'.run_to_cursor()<CR>",
      { desc = "Dap: Run to cursor" },
    },
    -- <C-F9>
    ["<F33>"] = {
      "<Cmd>lua require'dap'.terminate()<CR>",
      { desc = "Dap: Terminate" },
    },
  },
  t = {
    -- <C-BS>
    ["<C-h>"] = { "<C-w>" },
  },
  v = {
    ["H"] = { "^" },
    ["L"] = { "$" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" } },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" } },
    ["<"] = { "<gv", { desc = "Unindent selected lines" } },
    [">"] = { ">gv", { desc = "Indent selected lines" } },
  },
  x = {
    ["H"] = { "^" },
    ["L"] = { "$" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" } },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" } },
  },
  c = {
    -- <C-BS>
    ["<C-h>"] = { "<C-w>", { noremap = false } },
    ["<C-j>"] = {
      "pumvisible() ? '\\<C-n>' : '\\<C-j>'",
      { expr = true },
    },
    ["<C-k>"] = { "pumvisible() ? '\\<C-p>' : '\\<C-k>'", { expr = true } },
  },
}


for mode, mode_mappings in pairs(mappings) do
  apply_mappings(mode, mode_mappings)
end
