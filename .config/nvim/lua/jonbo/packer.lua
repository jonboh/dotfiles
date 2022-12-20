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
    use  lewis6991/impatient.nvim 
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
	use{ nvim-tree/nvim-web-devicons ,
        config = function() require( nvim-web-devicons ).setup{} end
    }
    use{ lambdalisue/suda.vim } -- write with sudo
--     use({ -- this is nice but considerably degrades the responsiveness of nvim, passing for now
--     "folke/noice.nvim",
--     event = "VimEnter",
--     config = function()
--         require("noice").setup(
--         {
--             routes = {
--                 {
--                     view = "notify",
--                     filter = { event = "msg_showmode" },
--                 },
--             },
--         }
--         )
--     end,
--     requires = {
--         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--         "MunifTanjim/nui.nvim",
--         "rcarriga/nvim-notify",
--     }
-- })

    -- git 
    use { tpope/vim-fugitive }
    use { ThePrimeagen/git-worktree.nvim } -- cool but does not seem to work on windows
    use {  sindrets/diffview.nvim , requires =  nvim-lua/plenary.nvim  }
    use {
         lewis6991/gitsigns.nvim ,
        tag =  release  -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use {
       pwntester/octo.nvim ,
      requires = {
         nvim-lua/plenary.nvim ,
         nvim-telescope/telescope.nvim ,
         kyazdani42/nvim-web-devicons ,
      }
    }

    -- Markdown
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- treesitter
    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
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

    -- Games
    use  ThePrimeagen/vim-be-good 

    -- TODO: setup github integration with https://github.com/pwntester/octo.nvim
        -- be able to review PRs from nvim woah! :D
    -- TODO: add https://github.com/jbyuki/one-small-step-for-vimkind for debugging nvim configs
    -- TODO: complete config for diffview, gitsigns and neogit. I need to quickly
            -- resolve merge conflicts
            -- navigating log --graph
            -- navigate history
            -- blame
        -- check lazygit and gitui
        -- give fugitive a try
    -- check https://github.com/tpope/vim-unimpaired, might adapt mappings
    -- TODO: get a way to mass replace accross files in current project
    -- TODO: check https://gitlab.com/yorickpeterse/nvim-window, tmux style interactive window focus
    -- TODO: check https://maxwellrules.com/misc/nvim_jupyter.html
    -- TODO: rework lsp configuration with lsp-zero
    --      - this will include mason 
    --      - snippets and more

end)
