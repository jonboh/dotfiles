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
-- nnoremap("<C-z>", "<nop>")
-- vnoremap("<C-z>", "<nop>")
-- xnoremap("<C-z>", "<nop>")
-- tnoremap("<C-z>", "<nop>")

nnoremap("j", "<nop>") -- you ll use your nav layer and you ll like it!
nnoremap("k", "<nop>") -- you ll use your nav layer and you ll like it!
nnoremap("h", "<nop>") -- you ll use your nav layer and you ll like it!
nnoremap("l", "<nop>") -- you ll use your nav layer and you ll like it!

-- navigation
nnoremap("<leader>x", ":Ex<CR>")
nnoremap("n", "nzzzv") -- next result, center cursor, open folds to selection
nnoremap("N", "Nzzzv")
nnoremap("<C-d>", "<C-d>zz") -- centered page moves
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-Down>", "<cmd>copen<CR><cmd>cnext<CR>zz")
nnoremap("<C-Up>", "<cmd>copen<CR><cmd>cprev<CR>zz")
--nnoremap("<leader>k", "<cmd>lnext<CR>zz") -- move across locations
--nnoremap("<leader>j", "<cmd>lprev<CR>zz") 

-- windows
nnoremap("<A-Down>", "<C-W>j") -- navigation layer
nnoremap("<A-Up>", "<C-W>k")
nnoremap("<A-Right>", "<C-W>l")
nnoremap("<A-Left>", "<C-W>h")
nnoremap("<A-v>", "<C-W><C-v><C-W><C-l>")
nnoremap("<A-h>", "<C-W><C-s><C-W><C-j>")
nnoremap("<A-q>", "<C-W>c")
nnoremap("<A-C-Left>", "<C-W>5<") -- size horizontally
nnoremap("<A-C-Right>", "<C-W>5>") -- size horizontally
nnoremap("<A-C-Up>", "<C-W>+") -- size vertically
nnoremap("<A-C-Down>", "<C-W>-") -- size vertically


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
