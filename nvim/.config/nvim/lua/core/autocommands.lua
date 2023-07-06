local aug_user = vim.api.nvim_create_augroup("AugUser", {})

-- Map q to :close for certain buftypes
vim.api.nvim_create_autocmd("FileType", {
  group = aug_user,
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<Cmd>close<CR>", { silent = true, buffer = event.buf })
  end,
})

local function lsp_on_attach(event)
  local mappings = {
    n = {
      ["<F2>"] = { require("renamer").rename, "Rename" },
      ["K"] = { vim.lsp.buf.hover, "Hover doc" },
      ["<C-k>"] = { vim.lsp.buf.signature_help, "Signature help" },
      ["ga"] = { vim.lsp.buf.code_action, "Code actions" },
      ["gd"] = { vim.lsp.buf.definition, "Goto definition" },
      ["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
      ["gI"] = { vim.lsp.buf.implementation, "Goto implementation" },
      ["gl"] = { vim.diagnostic.open_float, "Line diagnostic" },
      ["go"] = { "<Cmd>SymbolsOutline<CR>", "Symbols outline" },
      ["gq"] = { vim.lsp.with(vim.lsp.buf.format, { async = true }), "Format buffer" },
      ["gr"] = { vim.lsp.buf.references, "Goto references" },
      ["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
      ["]d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
    },
    i = {
      ["<F2>"] = { require("renamer").rename, "Rename" },
    },
    v = {
      ["<F2>"] = { require("renamer").rename, "Rename" },
      ["ga"] = { vim.lsp.buf.code_action, "Code actions" },
      ["gq"] = { vim.lsp.with(vim.lsp.buf.format, { async = true }), "Format buffer" },
    },
    x = {
      ["<F2>"] = { require("renamer").rename, "Rename" },
      ["ga"] = { vim.lsp.buf.code_action, "Code actions" },
      ["gq"] = { vim.lsp.with(vim.lsp.buf.format, { async = true }), "Format buffer" },
    }
  }
  local wk = require("which-key")
  for mode, keys in pairs(mappings) do
    wk.register(keys, {
      mode = mode,
      buffer = event.buf,
    })
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = aug_user,
  callback = lsp_on_attach,
})

-- Start nvim-tree on opening a directory w/ nvim
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = aug_user,
  callback = function(data)
    if vim.fn.isdirectory(data.file) ~= 1 then
      return
    end
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
  end
})

-- Try to load exrc file on dir changed
vim.api.nvim_create_autocmd({ "DirChanged" }, {
  group = aug_user,
  callback = function()
    local exrc_files = {
      ".nvim.lua",
      ".nvimrc",
      ".exrc"
    }
    for _, file in ipairs(exrc_files) do
      local filepath = vim.fn.fnamemodify(file, ":p")
      if vim.fn.filereadable(filepath) == 1 then
        if vim.secure.read(filepath) then
          vim.cmd.source(filepath)
        end
        break
      end
    end
  end
})
