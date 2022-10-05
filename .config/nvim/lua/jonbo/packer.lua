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
    use{"ThePrimeagen/harpoon", requires =  nvim-lua/plenary.nvim  }

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

    -- TODO: add formatters

    -- ThePrimegean List
    --use("sbdchd/neoformat")
    ---- TJ created lodash of neovim
    --use("nvim-lua/popup.nvim")
    ---- All the things
    --use("tzachar/cmp-tabnine", { run = "./install.sh" })
    --use("onsails/lspkind-nvim")
    --use("nvim-lua/lsp_extensions.nvim")
    --use("glepnir/lspsaga.nvim")
    --use("simrat39/symbols-outline.nvim")
    --use("L3MON4D3/LuaSnip")
    --use("saadparwaiz1/cmp_luasnip")
    ---- Primeagen doesn"t create lodash
    --use("ThePrimeagen/harpoon")
    --use("nvim-treesitter/playground")

end)
