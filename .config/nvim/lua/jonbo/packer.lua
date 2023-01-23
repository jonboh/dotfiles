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
--  TODO: Time for a new opportunity? it has support for showcmd output. on virtual text?
--     use({ -- this is nice but considerably degrades the responsiveness of nvim, passing for now. 
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
    use { j-hui/fidget.nvim , -- adds a nice fidget that tracks lsp progress
        config= function() require"fidget".setup{} end}

    -- Lua
    use { milisims/nvim-luaref } -- will add help docs about Lua
    use { nanotee/luv-vimdocs } -- will add help docs about libuv which is used by Lua

    -- Debugger
    use("mfussenegger/nvim-dap")
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use("mfussenegger/nvim-dap-python") -- configs for debugpy
    use("theHamsta/nvim-dap-virtual-text")
    -- use( jbyuki/one-small-step-for-vimkind )

    -- Obsidian
    use{ epwalsh/obsidian.nvim }

    -- Dashboard
    use {
         goolord/alpha-nvim ,
        requires = {  nvim-tree/nvim-web-devicons  },
        config = function ()
            require alpha .setup(require alpha.themes.startify .config) 
            -- TODO: configure to quickly go to main sessions
            -- TODO: obsidian view?
            -- TODO: go to .config/nvim and debug?
        end
    }
    -- Games
    use  ThePrimeagen/vim-be-good 

    if packer_bootstrap then -- Automatically set up configuration after clonning packer.nvim
        require( packer ).sync()
    end

    -- TODO: setup github integration with https://github.com/pwntester/octo.nvim
        -- be able to review PRs from nvim woah! :D
    -- TODO:  Add git configurations. I need to quickly
        -- navigating log --graph
        -- navigate history
        -- blame
    -- TODO: check https://github.com/tpope/vim-unimpaired, might adapt mappings
    -- TODO: get a way to mass replace accross files in current project
    -- TODO: check https://maxwellrules.com/misc/nvim_jupyter.html
    -- TODO: configure snippets
    -- TODO: check https://github.com/stevearc/oil.nvim. edit your filesystem on a neovim buffer
    -- TODO: configure treesitter syntactic selection and navigation: https://youtu.be/stqUbv-5u2s?t=763
end)
