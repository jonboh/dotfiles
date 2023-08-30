local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap -- noremap for normal mode
local vnoremap = Remap.vnoremap -- noremap for visual and select mode
local tnoremap = Remap.tnoremap

-- <A-[]> Alt+[]
-- <C-[]> Ctrl+[]

tnoremap("<Esc>", "<C-\\><C-n>")
nnoremap("<Esc>", "<cmd>nohls<cr><Esc>", {silent=true}) -- clear highlight search

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
-- nnoremap("<C-d>", "<C-d>zz") -- centered page moves
-- nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-Down>", "<cmd>copen<CR><cmd>cnext<CR>zz")
nnoremap("<C-Up>", "<cmd>copen<CR><cmd>cprev<CR>zz")
-- <C-o> go back
-- <C-O> go forward
nnoremap("<CS-O>", "<C-I>") -- this might not work in other terminal emulators
-- wezterm: ok
-- alacritty: not
-- kitty: not


-- windows
local mux = require("wezterm-mux")
nnoremap("<A-Down>", mux.wezterm_move_down)
nnoremap("<A-Up>",  mux.wezterm_move_up)
nnoremap("<A-Right>", mux.wezterm_move_right)
nnoremap("<A-Left>", mux.wezterm_move_left)
nnoremap("<A-v>", "<C-W><C-v><C-W><C-l>")
nnoremap("<A-h>", "<C-W><C-s><C-W><C-j>")
nnoremap("<A-q>", ":bd<CR>", {silent=true}) -- close buffe
nnoremap("<A-x>", "<C-W>q", {silent=true}) -- close window
nnoremap("<A-S-Left>", "<C-W>5<") -- size horizontally
nnoremap("<A-S-Right>", "<C-W>5>") -- size horizontally
nnoremap("<A-S-Up>", "<C-W>+") -- size vertically
nnoremap("<A-S-Down>", "<C-W>-") -- size vertically

-- terminal
-- tnoremap("<A-Down>", "<Cmd>wincmd j<CR>") -- navigation layer
-- tnoremap("<A-Up>", "<Cmd>wincmd k<CR>")
-- tnoremap("<A-Right>", "<Cmd>wincmd l<CR>")
-- tnoremap("<A-Left>", "<Cmd>wincmd h<CR>")
nnoremap("<leader><Esc>", ":ToggleTerm direction=float<CR>", {silent = true})
tnoremap("<leader><Esc>", "<Cmd>ToggleTerm<CR>", {silent = true})

-- undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>", {silent=true})

-- move line
vnoremap("<S-Down>", ":m  >+1<CR>gv=gv", {silent=true})
vnoremap("<S-Up>", ":m  <-2<CR>gv=gv", {silent=true})

-- yanking and pasting from system clipboard
nnoremap("gy", "\"+y")
vnoremap("gy", "\"+y")
nnoremap("gY", "\"+Y")
vnoremap("gY", "\"+Y")
nnoremap("gp", "\"+p")
vnoremap("gp", "\"+p")
nnoremap("gP", "\"+P")
vnoremap("gP", "\"+P")

-- delete / paste into void register
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")
nnoremap("<leader>D", "\"_D")
vnoremap("<leader>D", "\"_D")
nnoremap("<leader>c", "\"_c")
vnoremap("<leader>c", "\"_c")
nnoremap("<leader>C", "\"_C")
vnoremap("<leader>C", "\"_C")
nnoremap("<leader>p", "\"0p")
vnoremap("<leader>p", "\"0p")
nnoremap("<leader>P", "\"0P")
vnoremap("<leader>P", "\"0P")

-- easily replace the current word
nnoremap("<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") --<> on the selection limits the replacement to whole words
vnoremap("<leader>r", "\"0y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>") -- this uses register 0
-- TODO: ^add escaping for https://superuser.com/questions/41378/how-to-search-for-selected-text-in-vim

-- selection
vnoremap("$", "$<Left>") -- visual mode dont include line jump on selection

-- diagnostics
-- nnoremap("<leader>x", "<cmd>lua vim.diagnostic.setqflist()<CR><cmd>cfirst<CR>, {silent=true}) -- TODO: fix messy when lots of warnings
nnoremap("<leader>x", "<cmd>BaconLoad<CR><cmd>copen<CR><cmd>cfirst<CR>", {silent=true}) -- TODO: handle filetype

-- AI
nnoremap("<C-x>", ":ChatGPT<CR>", {silent=true})
