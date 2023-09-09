local dap = require( dap )


local codelldb_extension_path = vim.fn.stdpath("data").."/mason".."/packages".."/codelldb".."/extension"
local codelldb_path = codelldb_extension_path..  /adapter/codelldb 
local cpptools_extension_path = vim.fn.stdpath("data").."/mason".."/packages".."/cpptools".."/extension"
local cpptools_path = cpptools_extension_path.."/debugAdapters/bin/OpenDebugAD7"
dap.adapters.codelldb = {
    type =  server ,
    port = "${port}",
    executable = {
        command = codelldb_path,
        args = {"--port", "${port}"},

        -- On windows you may have to uncomment this:
        -- detached = false,
    }
}

dap.adapters.cppdbg = {
    id =  cppdbg ,
    type =  executable ,
    command = cpptools_path,
}

local M = {}
M.get_exec_path = function()
    return vim.fn.input( Path to executable:  , vim.fn.getcwd() ..  / ,  file )
end


dap.configurations.rust = {
    {
        name = "(lldb) Launch file",
        type = "codelldb",
        request = "launch",
        program = M.get_exec_path,
        cwd =  ${workspaceFolder} ,
        stopOnEntry = true,
    },
    {
        name = "(gdb) Launch file",
        type = "cppdbg",
        request = "launch",
        program = M.get_exec_path,
        cwd =  ${workspaceFolder} ,
        stopAtEntry = true,
    },
}


dap.configurations.cpp = dap.configurations.rust
dap.configurations.c = dap.configurations.cpp
return M
