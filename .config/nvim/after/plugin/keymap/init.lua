local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap -- noremap for normal mode
local vnoremap = Remap.vnoremap -- noremap for visual and select mode
local xnoremap = Remap.xnoremap -- noremap for visual
local nmap = Remap.nmap

nnoremap("<Space>", "<nop>") 

-- navigation
nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("n", "nzzzv") -- next result, center cursor, open folds to selection
nnoremap("N", "Nzzzv")
nnoremap("<C-d>", "<C-d>zz") -- centered page moves
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
--nnoremap("<leader>k", "<cmd>lnext<CR>zz") -- move across locations
--nnoremap("<leader>j", "<cmd>lprev<CR>zz") 

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
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- TODO: add <leader>s for visual selection
