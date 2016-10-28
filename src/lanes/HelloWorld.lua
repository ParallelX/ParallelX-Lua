local M = { }
M.hi = function(msg)
  return string.format("Hello world! %s", msg)
end
return M
