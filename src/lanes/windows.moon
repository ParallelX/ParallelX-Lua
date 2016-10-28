M = {}
P = (require "lanes").configure()
H = P.require "HelloWorld" -- let "lanes" register a user defined module

M.run = (indexes) ->
    work = P.gen("os", "string", "base", (i) ->
        task = string.format "powershell sleep %s", 3
        os.execute task
        return H.hi task)
    accum = {}
    for i in *indexes
        print i
        accum[#accum + 1] = work i
    print a[1] for a in *accum -- print the returned values from each thread
    return true
M.main = () -> M.run {1,2,3}
return M