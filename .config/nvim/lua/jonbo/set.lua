vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.errorbells = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.mouse =   

-- navigation
vim.opt.scrolloff = 8

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("XDG_DATA_HOME") .. "/nvim-data/undodir"
vim.opt.undofile = true

vim.opt.hidden = true

-- other
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.fileformat = "unix"
vim.opt.ff = "unix"
vim.opt.cmdheight = 1

-- folding
vim.opt.foldmethod =  expr 
vim.opt.foldexpr =  nvim_treesitter#foldexpr() 
vim.opt.foldminlines = 3
vim.opt.foldenable = false

vim.g.mapleader = " "
vim.opt.timeout = true

vim.opt.autowrite = true

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don t pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
