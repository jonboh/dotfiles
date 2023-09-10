local dap = require("dap")
local debug_utils = require("jonbo.debugger.utils")

local M = {}

dap.configurations.cpp = {
    {
        name = "(lldb) Launch file",
        type = "codelldb",
        request = "launch",
        program = debug_utils.get_program,
        cwd= vim.fn.getcwd,
        stopOnEntry = true,
    },
    {
        name = "(gdb) Launch file",
        type = "cppdbg",
        request = "launch",
        program = debug_utils.get_program,
        cwd= vim.fn.getcwd,
        stopAtEntry = true,
    },
}

dap.configurations.c = dap.configurations.cpp

return M
