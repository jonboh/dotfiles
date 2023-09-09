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

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function get_program()
      return coroutine.create(function(coro)
        local opts = {}
        pickers
          .new(opts, {
            prompt_title = "Path to executable",
            finder = finders.new_oneshot_job({ "fd", "--exclude", ".git", "--no-ignore", "--type", "x"}, {}),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(buffer_number)
              actions.select_default:replace(function()
                actions.close(buffer_number)
                coroutine.resume(coro, action_state.get_selected_entry()[1])
              end)
              return true
            end,
          })
          :find()
      end)
    end

dap.configurations.rust = {
    {
        name = "(lldb) Launch file",
        type = "codelldb",
        request = "launch",
        program = get_program,
        cwd =  ${workspaceFolder} ,
        stopOnEntry = true,
    },
    {
        name = "(gdb) Launch file",
        type = "cppdbg",
        request = "launch",
        program = get_program,
        cwd =  ${workspaceFolder} ,
        stopAtEntry = true,
    },
}


dap.configurations.cpp = dap.configurations.rust
dap.configurations.c = dap.configurations.cpp
return M
