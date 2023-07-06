local function MakeSubwordSpec(ai_type, _, _)
  local function FindSubword(line, init)
    local l1, l2 = line:match("%f[%u]()%u", init),
        line:match("%f[%w]()[%l%d]", init)
    local l = l1 and l2 and math.min(l1, l2) or l1 or l2
    if not l then return end
    local r1, r2 = line:match("()%u%f[%W]", l),
        line:match("()[%l%d]%f[^%l%d]", l)
    local r = r1 and r2 and math.min(r1, r2) or r1 or r2
    if not r then return end
    if ai_type == "a" then
      if line:sub(r + 1, r + 1):match("[_-]") then
        r = r + 1
      elseif l > init and line:sub(l - 1, l - 1):match("[_-]") then
        l = l - 1
      end
    end
    return l, r
  end
  return {
    FindSubword,
    "^.*$",
  }
end

local function config()
  require("mini.ai").setup({
    custom_textobjects = {
      S = MakeSubwordSpec,
    },
    silent = true,
  })
end

return {
  {
    "echasnovski/mini.ai",
    config = config,
  },
}
