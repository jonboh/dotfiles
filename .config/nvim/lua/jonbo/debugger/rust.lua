local dap = require("dap")
local debug_utils = require("jonbo.debugger.utils")

local get_rust_gdb_path = function()
    local toolchain_location = string.gsub(vim.fn.system("rustc --print sysroot"), "\n", "")
    local rustgdb = toolchain_location.."/bin/rust-gdb"
    return rustgdb
end

local get_rust_lldb_path = function()
    local toolchain_location = string.gsub(vim.fn.system("rustc --print sysroot"), "\n", "")
    local rustlldb= toolchain_location.."/bin/rust-lldb"
    return rustlldb
end

dap.configurations.rust = {
    -- {
    --     name = "(lldb) Launch file",
    --     type = "codelldb",
    --     request = "launch",
    --     program = debug_utils.get_program,
    --     miDebuggerPath = get_rust_lldb_path,
    --     cwd =  ${workspaceFolder} ,
    --     stopOnEntry = true,
    -- },
    {
        name = "(gdb) Launch file",
        type = "cppdbg",
        request = "launch",
        program = debug_utils.get_program,
        miDebuggerPath = get_rust_gdb_path,
        cwd =  ${workspaceFolder} ,
        stopAtEntry = true,
    },
}
