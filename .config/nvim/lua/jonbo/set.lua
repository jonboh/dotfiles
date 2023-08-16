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
vim.opt.hlsearch = true
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
vim.opt.colorcolumn = ""
vim.opt.colorcolumn:append("80")
vim.opt.colorcolumn:append("100")
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.fileformat = "unix"
vim.opt.ff = "unix"
-- vim.opt.cmdheight = 1 -- on 1 because on 0 makes every command to prompt for enter to continue
vim.opt.fillchars:append( diff:╱ )
vim.api.nvim_exec([[cabbrev h vert h]], false)

-- winbar
vim.opt.winbar="%f %m" -- show filename and modification status on top

-- folding
vim.opt.foldmethod =  expr 
vim.opt.foldexpr =  nvim_treesitter#foldexpr() 
vim.opt.foldminlines = 3
vim.opt.foldenable = true
vim.opt.foldlevelstart = 9

vim.g.mapleader = " "
vim.opt.timeout = true
vim.opt.timeoutlen = 500

vim.opt.autowrite = true

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don t pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- programs
vim.opt.makeprg =  ninja 
vim.opt.grepprg =  rg --vimgrep 
vim.api.nvim_exec([[
    set errorformat^=%-G%f:%l:\ warning:%m
    set errorformat^=%-G%f:%l:\ note:%m
    ]]
    , false)-- TODO: toggle with command

-- prevent mappings form vimscript plugins
vim.g.vim_markdown_no_default_key_mappings = 1
