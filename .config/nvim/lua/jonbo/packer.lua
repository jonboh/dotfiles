-- This file can be loaded by calling `lua require( plugins )` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

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
    use{"ThePrimeagen/harpoon", requires =  nvim-lua/plenary.nvim  }
    use{ ggandor/leap.nvim , requires= tpope/vim-repeat }
    use{ karb94/neoscroll.nvim }


    -- Utilities
    use {  nvim-lualine/lualine.nvim ,
          requires = {  kyazdani42/nvim-web-devicons , opt = true }
        }
    use( mbbill/undotree ) 
    use{ terrortylor/nvim-comment }
    use{ anuvyklack/pretty-fold.nvim }
    -- use({ -- this is nice but considerably degrades the responsiveness of nvim, passing for now
    --     "folke/noice.nvim",
    --     event = "VimEnter",
    --     config = function()
    --         require("noice").setup()
    --     end,
    --     requires = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     }
    -- })
    use{ MTDL9/vim-log-highlighting }
    use "lukas-reineke/indent-blankline.nvim"
    use {  mhartington/formatter.nvim  }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    -- git 
    use { ThePrimeagen/git-worktree.nvim } -- cool but does not seem to work on windows
    use {  TimUntersberger/neogit , requires =  nvim-lua/plenary.nvim  }
    use {  sindrets/diffview.nvim , requires =  nvim-lua/plenary.nvim  }
    use { 
         lewis6991/gitsigns.nvim ,
        tag =  release  -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use( nvim-treesitter/nvim-treesitter-refactor ) -- for symbol under cursor highlighting
    use("nvim-treesitter/nvim-treesitter-context") -- for the sticky context lines

    -- LSP
    use( neovim/nvim-lspconfig ) -- Configurations for Nvim LSP
    use("hrsh7th/nvim-cmp") -- completion engine
    use("hrsh7th/cmp-buffer") -- source for in buffer completions
    use("hrsh7th/cmp-nvim-lsp") -- source for builtin nvim lsp client

    -- Debugger
    use("mfussenegger/nvim-dap")
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use("theHamsta/nvim-dap-virtual-text") -- TODO: configure!
    use("mfussenegger/nvim-dap-python") -- configs for debugpy
    use  lewis6991/impatient.nvim 

    -- Games
    use  ThePrimeagen/vim-be-good 

    -- TODO: improve current word highlighting. treesitter refactor does not highlight from function signature
    -- TODO: check more plugins from rcarriga dotfiles and https://github.com/rockerBOO/awesome-neovim#plugin-manager
    -- TODO: check neovim-tasks, quick cmake running
    -- TODO: check quick fix integration with cmake report
    -- TODO: complete config for diffview, gitsigns and neogit. I need to quickly
            -- stage/unstage hunks
            -- resolve merge conflicts
            -- navigating log --graph
            -- navigate history
            -- blame
            -- neogit has some performance problems in big projects...
        -- check lazygit and gitui
        -- give fugitive a try
    -- TODO: get a way to mass replace accross files in current project
    -- TODO: check https://gitlab.com/yorickpeterse/nvim-window, tmux style interactive window focus
    --use("onsails/lspkind-nvim")
    --use("glepnir/lspsaga.nvim")
    --use("L3MON4D3/LuaSnip")
    --use("saadparwaiz1/cmp_luasnip")

end)
