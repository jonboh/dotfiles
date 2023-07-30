local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath( data ).. /site/pack/packer/start/packer.nvim 
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ git ,  clone ,  --depth ,  1 ,  https://github.com/wbthomason/packer.nvim , install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require( packer ).startup(function(use)
    -- Packer can manage itself
    use( wbthomason/packer.nvim )

    -- Color Scheemes
    use( folke/tokyonight.nvim )

    -- navigation
    use {
        "nvim-telescope/telescope.nvim", branch =  0.1.x ,
            requires = { { nvim-lua/plenary.nvim } }
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { nvim-telescope/telescope-fzf-native.nvim , 
        run =  cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build  }
    use{"ThePrimeagen/harpoon", requires =  nvim-lua/plenary.nvim  }
    use{ ggandor/leap.nvim , requires= tpope/vim-repeat }
    use {"jonboh/wezterm-mux.nvim"}

    -- Utilities
    use {  nvim-lualine/lualine.nvim ,
          requires = {  kyazdani42/nvim-web-devicons , opt = true }
        }
    use( mbbill/undotree )
    use{ terrortylor/nvim-comment }
    use{ anuvyklack/pretty-fold.nvim }
    use  lewis6991/impatient.nvim 
    use{ MTDL9/vim-log-highlighting }
    use "lukas-reineke/indent-blankline.nvim" -- TODO: configure or use https://github.com/echasnovski/mini.indentscope
    use {  mhartington/formatter.nvim  }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
            }
        end
    }
	use{ nvim-tree/nvim-web-devicons ,
        config = function() require( nvim-web-devicons ).setup{} end
    }
    use{ lambdalisue/suda.vim } -- write with sudo
    use {"akinsho/toggleterm.nvim", tag =  * , config = function()
      require("toggleterm").setup()
    end}
    use({
     "folke/noice.nvim",
    requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
})

    -- git 
    use { tpope/vim-fugitive }
    use {
         lewis6991/gitsigns.nvim ,
        tag =  release  -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- Markdown
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use( preservim/vim-markdown ) -- primarily for fenced code highlighting
    use( dhruvasagar/vim-table-mode )

    -- treesitter
    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
    use({ "nvim-treesitter/nvim-treesitter-textobjects", -- for textobject selections
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter", })
    use({ nvim-treesitter/nvim-treesitter-refactor , -- for symbol under cursor highlighting
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter"})
    use({"nvim-treesitter/nvim-treesitter-context", -- for the sticky context lines
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter"})
    use({ nvim-treesitter/playground ,
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter"})

    -- LSP
    use {
       VonHeikemen/lsp-zero.nvim ,
      requires = {
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
    }
    use { tzachar/cmp-fuzzy-path , requires = { hrsh7th/nvim-cmp ,  tzachar/fuzzy.nvim }}
    use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
    use({ hrsh7th/cmp-cmdline })

    use { j-hui/fidget.nvim , -- adds a nice fidget that tracks lsp progress
        config= function() require"fidget".setup{} end, tag="legacy"}

    -- Rust
    use  simrat39/rust-tools.nvim 
    use  rust-lang/rust.vim 
    use  Canop/nvim-bacon 

    -- LaTex
    use  lervag/vimtex 

    -- Lua
    use { milisims/nvim-luaref } -- add help docs about Lua
    use { nanotee/luv-vimdocs } -- add help docs about libuv which is used by Lua

    -- Graphviz
    use { liuchengxu/graphviz.vim }

    -- Debugger
    use("mfussenegger/nvim-dap")
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use("mfussenegger/nvim-dap-python") -- configs for debugpy
    use("theHamsta/nvim-dap-virtual-text")
    use( jbyuki/one-small-step-for-vimkind )

    -- Obsidian
    use{ epwalsh/obsidian.nvim }

    -- Dashboard
    use {
         goolord/alpha-nvim ,
        requires = {  nvim-tree/nvim-web-devicons  },
        config = function ()
            require alpha .setup(require alpha.themes.startify .config) 
            -- TODO: go to .config/nvim and debug?
        end
    }
    -- AI
    use({
  "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    -- tag= "*" -- aka latest tag
})

    -- Games
    use  ThePrimeagen/vim-be-good 

    if packer_bootstrap then -- Automatically set up configuration after clonning packer.nvim
        require( packer ).sync()
    end
    -- TODO:  Add git configurations. I need to quickly
        -- navigating log --graph
        -- navigate history
        -- blame
    -- TODO: check https://github.com/tpope/vim-unimpaired, might adapt mappings
    -- TODO: get a way to mass replace accross files in current project
        -- check https://github.com/nvim-pack/nvim-spectre?
    -- TODO: check https://maxwellrules.com/misc/nvim_jupyter.html
    -- TODO: configure snippets
    -- TODO: check https://github.com/stevearc/oil.nvim. edit your filesystem on a neovim buffer
    -- TODO: https://github.com/Houl/repmo-vim
end)
