local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap -- noremap for normal mode
local vnoremap = Remap.vnoremap -- noremap for visual and select mode
local xnoremap = Remap.xnoremap -- noremap for visual
local tnoremap = Remap.tnoremap -- noremap for terminal mode
local nmap = Remap.nmap

-- <A-[]> Alt+[]
-- <C-[]> Ctrl+[]

-- TODO: add silence
nnoremap("<Space>", "<nop>") 
nnoremap("<C-z>", "<nop>")
vnoremap("<C-z>", "<nop>")
xnoremap("<C-z>", "<nop>")
tnoremap("<C-z>", "<nop>")

-- navigation
nnoremap("<leader>x", ":Ex<CR>")
nnoremap("n", "nzzzv") -- next result, center cursor, open folds to selection
nnoremap("N", "Nzzzv")
nnoremap("<C-d>", "<C-d>zz") -- centered page moves
nnoremap("<C-u>", "<C-u>zz")
--nnoremap("<C-k>", "<cmd>cnext<CR>zz")
--nnoremap("<C-j>", "<cmd>cprev<CR>zz")
--nnoremap("<leader>k", "<cmd>lnext<CR>zz") -- move across locations
--nnoremap("<leader>j", "<cmd>lprev<CR>zz") 

-- windows
nnoremap("<A-j>", "<C-W><C-j>")
nnoremap("<A-k>", "<C-W><C-k>")
nnoremap("<A-l>", "<C-W><C-l>")
nnoremap("<A-h>", "<C-W><C-h>")
nnoremap("<A-v>", "<C-W><C-v>")
nnoremap("<A-s>", "<C-W><C-s>")
nnoremap("<A-,>", "<C-W>5<") -- size horizontally
nnoremap("<A-.>", "<C-W>5>") -- size horizontally
nnoremap("<A-t>", "<C-W>+") -- size vertically
nnoremap("<A-s>", "<C-W>-") -- size vertically


nnoremap("<C-c>", "Esc") -- in some places (block insert) <C-c> is not the same as Esc

-- Terminal mode
nnoremap("<leader>te", ":terminal<CR>")
tnoremap("<Esc>", "<C-\\><C-n>") -- Esc to exit terminal mode. C-c will still stop work
tnoremap("<C-c>", "<C-c><C-\\><C-n>") -- C-c will still stop work, and exit from terminal mode

-- undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>")

-- move line
vnoremap("J", ":m  >+1<CR>gv=gv")
vnoremap("K", ":m  <-2<CR>gv=gv")

-- yanking and pasting from system clipboard
nnoremap("<leader>gy", "\"+y") 
vnoremap("<leader>gy", "\"+y")
nmap("<leader>gY", "\"+Y")
nnoremap("<leader>gp", "\"+p")
nnoremap("<leader>gP", "\"+P")

-- delete selection into void register and paste
xnoremap("<leader>p", "\"_dP")
xnoremap("<leader>gp", "\"_d\"+P") -- from system clipboard

-- delete into void register
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- easily replace the current word
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") --<> on the selection limits the replacement to whole words
vnoremap("<leader>s", "\"0y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>") -- this uses register 0
-- TODO: add <leader>s for visual selection
