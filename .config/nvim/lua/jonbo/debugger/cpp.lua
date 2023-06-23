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

local get_exec_path = function()
            return vim.fn.input( Path to executable:  , vim.fn.getcwd() ..  / ,  file )
        end

dap.configurations.cpp = {
    {
        name = "(lldb) Launch file",
        type = "codelldb",
        request = "launch",
        program = get_exec_path,
        cwd =  ${workspaceFolder} ,
        stopOnEntry = true,
    },
    {
        name = "(gdb) Launch file",
        type = "cppdbg",
        request = "launch",
        program = get_exec_path,
        cwd =  ${workspaceFolder} ,
        stopAtEntry = true,
    },
    {
        name= "rr",
        type= "cppdbg",
        request= "launch",
        program = get_exec_path,
        args= {},
        miDebuggerServerAddress= "localhost:50505",
        stopAtEntry= false,
        cwd= vim.fn.getcwd,
        environment= {},
        externalConsole= true,
        linux= {
            MIMode= "gdb",
            setupCommands= {
                {
                    description= "Setup to resolve symbols",
                    text= "set sysroot /",
                    ignoreFailures= false
                },
            },
        },
        osx= {
            MIMode= "gdb"
        },
        windows= {
            MIMode= "gdb"
        }
    }
}


-- TODO: fix cwd management
-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
