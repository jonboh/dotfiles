require("jonbo.set")
require("jonbo.lazy")
require("jonbo.debugger")
require("jonbo.telescope")

P = function(v) -- tj easy printing
    print(vim.inspect(v))
    return v
end
