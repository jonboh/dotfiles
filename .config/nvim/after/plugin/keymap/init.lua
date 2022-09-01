-- basic
vim.g.mapleader = " "

local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap -- noremap for normal mode
local vnoremap = Remap.vnoremap -- noremap for visual and select mode
local nmap = Remap.nmap

-- navigation
nnoremap("<leader>pv", ":Ex<CR>")

-- undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>")

