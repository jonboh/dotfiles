local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap -- noremap for normal mode
local vnoremap = Remap.vnoremap -- noremap for visual and select mode
local tnoremap = Remap.tnoremap

-- <A-[]> Alt+[]
-- <C-[]> Ctrl+[]

tnoremap("<Esc>", "<C-\\><C-n>")

-- TODO: add silence
nnoremap("<Space>", "<nop>")

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

-- windows
nnoremap("<A-Down>", "<C-W>j") -- navigation layer
nnoremap("<A-Up>", "<C-W>k")
nnoremap("<A-Right>", "<C-W>l")
nnoremap("<A-Left>", "<C-W>h")
nnoremap("<A-v>", "<C-W><C-v><C-W><C-l>")
nnoremap("<A-h>", "<C-W><C-s><C-W><C-j>")
nnoremap("<A-q>", ":bd<CR>", {silent=true})
nnoremap("<A-C-Left>", "<C-W>5<") -- size horizontally
nnoremap("<A-C-Right>", "<C-W>5>") -- size horizontally
nnoremap("<A-C-Up>", "<C-W>+") -- size vertically
nnoremap("<A-C-Down>", "<C-W>-") -- size vertically

-- terminal
-- tnoremap("<A-Down>", "<Cmd>wincmd j<CR>") -- navigation layer
-- tnoremap("<A-Up>", "<Cmd>wincmd k<CR>")
-- tnoremap("<A-Right>", "<Cmd>wincmd l<CR>")
-- tnoremap("<A-Left>", "<Cmd>wincmd h<CR>")
nnoremap("<leader><Esc>", ":ToggleTerm direction=float<CR>", {silent = true})
tnoremap("<leader><Esc>", "<Cmd>ToggleTerm<CR>", {silent = true})

-- undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>")

-- move line
vnoremap("<S-Down>", ":m  >+1<CR>gv=gv")
vnoremap("<S-Up>", ":m  <-2<CR>gv=gv")

-- yanking and pasting from system clipboard
nnoremap("gy", "\"+y")
vnoremap("gy", "\"+y")
nnoremap("gp", "\"+p")
nnoremap("gP", "\"+P")
vnoremap("gp", "\"+p")
vnoremap("gP", "\"+P")

-- delete into void register
nnoremap("gd", "\"_d")
vnoremap("gd", "\"_d")

-- easily replace the current word
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") --<> on the selection limits the replacement to whole words
vnoremap("<leader>s", "\"0y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>") -- this uses register 0
-- TODO: ^add escaping for https://superuser.com/questions/41378/how-to-search-for-selected-text-in-vim

-- selection
vnoremap("$", "$<Left>") -- visual mode dont include line jump on selection

-- rust-tools
nnoremap("<leader>f", ":RustFmt<CR>")
vnoremap("<leader>f", ":RustFmtRange<CR>")

-- diagnostics
nnoremap("<leader>x", vim.diagnostic.setqflist, {silent=true})
