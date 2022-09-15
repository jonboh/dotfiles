-- Taken from https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
local dap = require( dap )
dap.adapters.lldb = {
  type =  executable ,
  command =  C:/Program Files/Microsoft Visual Studio/2022/Professional/VC/Tools/Llvm/x64/bin/lldb-vscode.exe , -- adjust as needed, must be absolute path
  name =  lldb 
}

local dap = require( dap )
dap.configurations.cpp = {
  {
    name =  Launch ,
    type =  lldb ,
    request =  launch ,
    program = function()
      return vim.fn.input( Path to executable:  , vim.fn.getcwd() ..  / ,  file )
    end,
    cwd =  ${workspaceFolder} ,
    stopOnEntry = true,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
  {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type =  lldb ,
      request =  attach ,
      pid = require( dap.utils ).pick_process,
      args = {},
    },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
