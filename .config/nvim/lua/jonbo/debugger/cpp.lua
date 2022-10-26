local dap = require( dap )

dap.adapters.codelldb = {
  type =  server ,
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command =  codelldb ,
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input( Path to executable:  , vim.fn.getcwd() ..  / ,  file )
    end,
    cwd = function()
      return vim.fn.input( Path to cwd:  , vim.fn.getcwd() ..  / ,  file )
    end,
    stopOnEntry = false,
  },
}
-- TODO: fix cwd management
-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
