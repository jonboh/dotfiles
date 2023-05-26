-- TODO: configure for rust and markdown
local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>f", ":FormatWrite<CR>", {silent=true})

-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    lua = {
        function()
            return {
                -- take Mason installation
                exe = vim.fn.stdpath( data ) ..  /mason/packages/luaformatter/bin/lua-format ,
            }
        end
    },
    -- and will be executed in order
    python = { require("formatter.filetypes.python").autopep8, },
    --
    -- Format rust using rustfmt
    -- refers to the  filetypes  folder here
    -- https://github.com/mhartington/formatter.nvim/blob/master/lua/formatter/filetypes/rust.lua
    rust = { require( formatter.filetypes.rust ).rustfmt },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    } -- this does not work on windows
  }
}
