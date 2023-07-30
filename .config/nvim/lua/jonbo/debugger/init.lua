require("jonbo.debugger.python")
require("jonbo.debugger.cpp")
require("jonbo.debugger.vimkind")

local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

-- DAP Configuration
local dap = require( dap )
local dapui = require("dapui")

-- TODO: clear F1 from opening help
nnoremap("<F1>", function()
    dap.close()
end)

local exec_reverse_step = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec reverse-step")
    -- s:evaluate("-exec reverse-step", function(err, resp)
    --   -- you can handle the response on this function
    -- end)
  end
local exec_reverse_continue = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec reverse-continue")
  end
local exec_reverse_finish = function()
    local s = require("dap").session()
    if not s then
      return
    end
    s:evaluate("-exec reverse-finish")
  end

nnoremap("<F7>", dap.continue)
-- nnoremap("<F19>", dap.reverse_continue)
nnoremap("<F19>", exec_reverse_step)
nnoremap("<F8>", dap.step_over)
-- nnoremap("<F20>", dap.step_back)
nnoremap("<F20>", exec_reverse_continue)
nnoremap("<F9>", dap.step_out)
nnoremap("<F21>", exec_reverse_finish)
nnoremap("<F10>", dap.step_into)
nnoremap("<F11>", dap.pause)
nnoremap("<F6>", function()
    dap.toggle_breakpoint()
end)
-- <S-F6> == <F18>
nnoremap("<F18>", function()
    dap.set_breakpoint(vim.fn.input( Breakpoint condition:  ))
end)
nnoremap("<leader>rc", function()
    dap.run_to_cursor()
end)

-- Visual evaluation 
vnoremap("<F5>", "<Cmd>lua require(\"dapui\").eval()<CR>")
nnoremap("<F5>", "<Cmd>lua require(\"dapui\").eval("..vim.fn.expand( <cword> )..")<CR>")


nnoremap("<F12>", function()
    dapui.toggle(1)
    dapui.toggle(2)
end)

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
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
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
