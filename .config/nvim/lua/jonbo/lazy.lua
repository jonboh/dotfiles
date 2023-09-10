local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Color Scheemes
     folke/tokyonight.nvim ,

    -- navigation
    { "nvim-telescope/telescope.nvim", branch =  0.1.x ,
            dependencies = { nvim-lua/plenary.nvim }
    },
    "nvim-telescope/telescope-file-browser.nvim",
    {  nvim-telescope/telescope-fzf-native.nvim , build =  cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build  }, 
    {"ThePrimeagen/harpoon", dependencies = { nvim-lua/plenary.nvim  }}, 
    { ggandor/leap.nvim , dependencies={ tpope/vim-repeat }}, 
    "jonboh/wezterm-mux.nvim", 

    -- Utilities
    {  nvim-lualine/lualine.nvim ,
          dependencies = {  nvim-tree/nvim-web-devicons  }
    }, 
     mbbill/undotree , 
     terrortylor/nvim-comment , 
     anuvyklack/pretty-fold.nvim , 
     lewis6991/impatient.nvim , 
     MTDL9/vim-log-highlighting , 
    "lukas-reineke/indent-blankline.nvim", -- TODO: configure or use https://github.com/echasnovski/mini.indentscope
     mhartington/formatter.nvim ,
    { "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup {
            }
        end
    },
	{ nvim-tree/nvim-web-devicons ,
        config = function() require( nvim-web-devicons ).setup{} end
    },
     lambdalisue/suda.vim , -- write with sudo
    {"akinsho/toggleterm.nvim", config = function()
      require("toggleterm").setup()
    end},
    { "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
       stevearc/dressing.nvim ,
      opts = {},
    },

    -- git 
     tpope/vim-fugitive ,
    {
         lewis6991/gitsigns.nvim ,
        tag =  release  -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    },

    -- Markdown
    -- install without yarn or npm
    { "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
     preservim/vim-markdown , -- primarily for fenced code highlighting
     dhruvasagar/vim-table-mode ,

    -- treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    { "nvim-treesitter/nvim-treesitter-textobjects", -- for textobject selections
        dependencies = "nvim-treesitter/nvim-treesitter", },
    { nvim-treesitter/nvim-treesitter-refactor , -- for symbol under cursor highlighting
        dependencies = "nvim-treesitter/nvim-treesitter"},
    {"nvim-treesitter/nvim-treesitter-context", -- for the sticky context lines
        dependencies = "nvim-treesitter/nvim-treesitter"},
    { nvim-treesitter/playground ,
        dependencies = "nvim-treesitter/nvim-treesitter"},

    -- LSP
    {  VonHeikemen/lsp-zero.nvim ,
      dependencies = {
        -- LSP Support
        { neovim/nvim-lspconfig },
        { williamboman/mason.nvim },
        { williamboman/mason-lspconfig.nvim },

        -- Autocompletion
        { hrsh7th/nvim-cmp }, -- completion engine
        { hrsh7th/cmp-buffer }, -- completion provider based on buffer
        { hrsh7th/cmp-path }, -- based on the filesystem
        { saadparwaiz1/cmp_luasnip }, -- based on snippets
        { hrsh7th/cmp-nvim-lsp }, -- based on lsp
        { hrsh7th/cmp-nvim-lua }, -- based on neovim lua api

        -- Snippets
        { L3MON4D3/LuaSnip }, -- snippet engine
        { rafamadriz/friendly-snippets }, -- snippet provider
      }
    },
    { tzachar/cmp-fuzzy-path , dependencies = { hrsh7th/nvim-cmp ,  tzachar/fuzzy.nvim }},
    {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"},
     hrsh7th/cmp-cmdline ,

    { j-hui/fidget.nvim , -- adds a nice fidget that tracks lsp progress
        config= function() require"fidget".setup{} end, tag="legacy"},

    -- Rust
     simrat39/rust-tools.nvim ,
     rust-lang/rust.vim ,
     Canop/nvim-bacon ,

    -- LaTex
     lervag/vimtex ,

    -- Lua
     milisims/nvim-luaref , -- add help docs about Lua
     nanotee/luv-vimdocs , -- add help docs about libuv which is used by Lua

    -- Debugger
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"}},
    "mfussenegger/nvim-dap-python", -- configs for debugpy
    "theHamsta/nvim-dap-virtual-text",
     jbyuki/one-small-step-for-vimkind ,
    {"jonboh/nvim-dap-rr", dependencies = {"nvim-dap", "telescope.nvim"}},

    -- Obsidian
     epwalsh/obsidian.nvim ,

    -- Dashboard
    {  goolord/alpha-nvim ,
        dependencies = {  nvim-tree/nvim-web-devicons  },
        config = function ()
            require alpha .setup(require alpha.themes.startify .config) 
            -- TODO: go to .config/nvim and debug?
        end
    },
    -- AI
    { "jackMort/ChatGPT.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        },
    },

    -- TODO:  Add git configurations. I need to quickly -> **learn to properly use fugitive**
        -- navigating log --graph
        -- navigate history
        -- blame
    -- TODO: check https://github.com/tpope/vim-unimpaired, might adapt mappings
    -- TODO: check https://maxwellrules.com/misc/nvim_jupyter.html
    -- TODO: configure snippets
    -- TODO: https://github.com/Houl/repmo-vim
}, {
    dev = {
        path="~/devel",
        patterns = {},
        fallback=false
    }
})
