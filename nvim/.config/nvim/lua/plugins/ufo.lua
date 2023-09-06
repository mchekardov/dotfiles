local function trim_virt_text(virt_text)
  if #virt_text == 0 then
    return {}
  end
  local new_virt_text = vim.deepcopy(virt_text)
  new_virt_text[1][1] = new_virt_text[1][1]:gsub("^%s+", "")
  new_virt_text[#new_virt_text][1] = new_virt_text[#new_virt_text][1]:gsub(
    "%s+$", "")
  return new_virt_text
end

local function truncate_to_target_width(virt_text, target_width, truncate)
  local new_virt_text = {}
  local cur_width = 0
  for _, chunk in ipairs(virt_text) do
    local chunk_text = chunk[1]
    local chunk_width = vim.fn.strdisplaywidth(chunk_text)
    if cur_width + chunk_width < target_width then
      table.insert(new_virt_text, chunk)
      cur_width = cur_width + chunk_width
    else
      local truncated_text = truncate(chunk_text, target_width - cur_width)
      local truncated_width = vim.fn.strdisplaywidth(truncated_text)
      local chunk_hl = chunk[2]
      table.insert(new_virt_text, { truncated_text, chunk_hl })
      cur_width = cur_width + truncated_width
      break
    end
  end
  return new_virt_text, cur_width
end

local function fold_virt_text_handler(
  virt_text, lnum, end_lnum, width, truncate, ctx)
  local new_virt_text = {}
  local fold_text = (" ⋯ +%d "):format(end_lnum - lnum)
  local fold_text_width = vim.fn.strdisplaywidth(fold_text)
  local target_width = width - fold_text_width
  local last_line_virt_text = trim_virt_text(
    ctx.get_fold_virt_text(end_lnum))
  local truncated_last_line_virt_text, truncated_last_line_width =
      truncate_to_target_width(last_line_virt_text, target_width,
                               truncate)
  local truncated_first_line_virt_text, truncated_first_line_width =
      truncate_to_target_width(virt_text,
                               target_width - truncated_last_line_width,
                               truncate)
  for _, chunk in ipairs(truncated_first_line_virt_text) do
    table.insert(new_virt_text, chunk)
  end
  table.insert(new_virt_text, { fold_text, "Comment" })
  for _, chunk in ipairs(truncated_last_line_virt_text) do
    table.insert(new_virt_text, chunk)
  end
  local remaining_space = width -
      (truncated_first_line_width + truncated_last_line_width + fold_text_width)
  if remaining_space then
    table.insert(new_virt_text, { (" "):rep(remaining_space), "Comment" })
  end
  return new_virt_text
end

local function config()
  local ufo = require("ufo")
  ufo.setup({
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
    enable_get_fold_virt_text = true,
    fold_virt_text_handler = fold_virt_text_handler,
  })
  require("core.keymaps").load({
    n = {
      ["zR"] = { ufo.openAllFolds },
      ["zM"] = { ufo.closeAllFolds },
    },
  })
end

return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = config,
  },
}
