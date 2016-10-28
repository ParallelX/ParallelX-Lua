local M = { }
local P = (require("lanes")).configure()
local H = P.require("HelloWorld")
M.run = function(indexes)
  local work = P.gen("os", "string", "base", function(i)
    local task = string.format("powershell sleep %s", 3)
    os.execute(task)
    return H.hi(task)
  end)
  local accum = { }
  for _index_0 = 1, #indexes do
    local i = indexes[_index_0]
    print(i)
    accum[#accum + 1] = work(i)
  end
  for _index_0 = 1, #accum do
    local a = accum[_index_0]
    print(a[1])
  end
  return true
end
M.main = function()
  return M.run({
    1,
    2,
    3
  })
end
return M
