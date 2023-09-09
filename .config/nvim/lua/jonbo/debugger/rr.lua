local dap = require( dap )

local get_rust_gdb_path = function()
    local toolchain_location = string.gsub(vim.fn.system("rustc --print sysroot"), "\n", "")
    local rustgdb = toolchain_location.."/bin/rust-gdb"
    return rustgdb
end

local rust_rr_config = {
        name= "rr",
        type= "cppdbg",
        request= "launch",
        program = require("jonbo.debugger.cpp").get_exec_path,
        args= {},
        miDebuggerPath = get_rust_gdb_path,
        miDebuggerServerAddress= "127.0.0.1:50505",
        stopAtEntry= false,
        cwd= vim.fn.getcwd,
        environment= {},
        externalConsole= true,
        -- linux= {
        MIMode= "gdb",
        setupCommands= {
            {
                description= "Setup to resolve symbols",
                text= "set sysroot /",
                ignoreFailures= false
            },
            {
               description= "Enable pretty-printing for gdb",
               text= "-enable-pretty-printing",
               ignoreFailures= false
            }
        },
        -- },
        -- osx= {
        --     MIMode= "gdb"
        -- },
        -- windows= {
        --     MIMode= "gdb"
        -- }
    }

-- make a copy for cpp and c that does not use rust-gdb
local cpp_rr_config = vim.deepcopy(rust_rr_config)
cpp_rr_config.miDebuggerPath = nil

-- insert entries. this assumes that these configuration tables already exist
dap.configurations.rust = vim.deepcopy(dap.configurations.rust)
table.insert(dap.configurations.rust, rust_rr_config)
table.insert(dap.configurations.cpp, cpp_rr_config) -- cpp is the same table as c

-- generate helper command for when rr has reached the end of the program and dap immediately exits
local M = {}
M.reverse_continue_nodap = function()
  vim.cmd( !gdb -q -ex "target remote  ..rust_rr_config.miDebuggerServerAddress.. " -ex reverse-continue -ex "set confirm off" -ex exit )
end
vim.cmd( command! ReverseContinueNoDAP lua require("jonbo.debugger.rr").reverse_continue_nodap() )


M.reverse_step = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec set exec-direction reverse")
    dap.step_into()
    -- s:evaluate("-exec reverse-step", function(err, resp)
    --   -- you can handle the response on this function
    -- end)
  end
M.reverse_next = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec set exec-direction reverse")
    dap.step_over()
    -- s:evaluate("-exec reverse-step", function(err, resp)
    --   -- you can handle the response on this function
    -- end)
  end
M.reverse_continue = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec set exec-direction reverse")
    dap.continue()
  end
M.reverse_finish = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec set exec-direction reverse")
    dap.step_out()
  end

M.step = function ()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec set exec-direction forward")
    dap.step_into()
end

M.next = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec set exec-direction forward")
    dap.step_over()
  end
M.continue = function()
    local s = require("dap").session()
    if not s then
        dap.continue()
        return
    end
    s:evaluate("-exec set exec-direction forward")
    dap.continue()
  end
M.step_out = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec set exec-direction forward")
    dap.step_out()
  end

return M
