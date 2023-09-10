require("jonbo.debugger.python")
require("jonbo.debugger.cpp")
require("jonbo.debugger.rust")
require("jonbo.debugger.vimkind")

local nnoremap = require("jonbo.keymap").nnoremap
local vnoremap = require("jonbo.keymap").vnoremap

-- DAP Configuration
local dap = require( dap )
local dapui = require("dapui")

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

nnoremap("<F1>", dap.terminate)
nnoremap("<F7>", dap.continue)
nnoremap("<F8>", dap.step_over)
nnoremap("<F9>", dap.step_out)
nnoremap("<F10>", dap.step_into)
nnoremap("<F11>", dap.pause)
nnoremap("<F6>", dap.toggle_breakpoint)
nnoremap("<F56>", dap.down) -- <A-F8>
nnoremap("<F57>", dap.up) -- <A-F9>
-- <S-F6> == <F18>
nnoremap("<F18>", function()
    dap.set_breakpoint(vim.fn.input( Breakpoint condition:  ))
end)
nnoremap("<F2>", dap.run_to_cursor)

-- Visual evaluation 
vnoremap("<F5>", "<Cmd>lua require(\"dapui\").eval()<CR>")
nnoremap("<F5>", "<Cmd>lua require(\"dapui\").eval("..vim.fn.expand( <cword> )..")<CR>")


nnoremap("<F12>", function()
    dapui.toggle(1)
    dapui.toggle(2)
end)

-- rr dap
local rr_dap = require("nvim-dap-rr")
rr_dap.setup({
    mappings = {
        continue = "<F7>",
        step_over = "<F8>",
        step_out = "<F9>",
        step_into = "<F10>",
        reverse_continue = "<F19>", -- <S-F7>
        reverse_step_over = "<F20>", -- <S-F8>
        reverse_step_out = "<F21>", -- <S-F9>
        reverse_step_into = "<F22>", -- <S-F10>
        step_over_i = "<F32>", -- <C-F8>
        step_out_i = "<F33>", -- <C-F8>
        step_into_i = "<F34>", -- <C-F8>
        reverse_step_over_i = "<F44>", -- <SC-F8>
        reverse_step_out_i = "<F45>", -- <SC-F9>
        reverse_step_into_i = "<F46>", -- <SC-F10>
    }
})
table.insert(dap.configurations.rust, rr_dap.get_rust_config())
table.insert(dap.configurations.cpp, rr_dap.get_config())

-- DAP UI Config
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        "watches",
        "breakpoints",
        "stacks",
        { id = "scopes", size = 0.25 },
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})


-- Open/Close dapui with debugger session
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup()
