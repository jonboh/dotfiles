-- TODO: configure for rust and markdown
local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>f", ":Format<CR>", {silent=true})
nnoremap("<leader>F", ":FormatWrite<CR>")

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
    -- and will be executed in order
    python = {
            require("formatter.filetypes.python").autopep8,
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    -- ["*"] = {
    --   -- "formatter.filetypes.any" defines default configurations for any
    --   -- filetype
    --   require("formatter.filetypes.any").remove_trailing_whitespace
    -- } -- this does not work on windows
  }
}

