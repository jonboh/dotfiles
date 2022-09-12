-- This file can be loaded by calling `lua require( plugins )` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require( packer ).startup(function(use)
    -- Packer can manage itself
    use( wbthomason/packer.nvim )


    -- Color Scheemes
    use( folke/tokyonight.nvim )

    -- Utilities
    use( mbbill/undotree ) 

    -- treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("nvim-treesitter/nvim-treesitter-context") -- for the sticky context lines
    
    -- telescope
    use {
        "nvim-telescope/telescope.nvim", branch =  0.1.x ,
            requires = { { nvim-lua/plenary.nvim } }
    }

    -- LSP
    use( neovim/nvim-lspconfig ) -- Configurations for Nvim LSP
    use("hrsh7th/nvim-cmp") -- completion engine
    use("hrsh7th/cmp-nvim-lsp") -- source for builtin nvim lsp client

    -- Debugger
    use("mfussenegger/nvim-dap")
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use("theHamsta/nvim-dap-virtual-text")
    use("mfussenegger/nvim-dap-python") -- configs for debugpy

    -- ThePrimegean List
    --use("sbdchd/neoformat")
--
    ---- Simple plugins can be specified as strings
    --use("TimUntersberger/neogit")
--
    ---- TJ created lodash of neovim
    --use("nvim-lua/plenary.nvim")
    --use("nvim-lua/popup.nvim")
    --use("nvim-telescope/telescope.nvim")
--
    ---- All the things
    --use("neovim/nvim-lspconfig")
    --use("hrsh7th/cmp-nvim-lsp")
    --use("hrsh7th/cmp-buffer")
    --use("hrsh7th/nvim-cmp")
    --use("tzachar/cmp-tabnine", { run = "./install.sh" })
    --use("onsails/lspkind-nvim")
    --use("nvim-lua/lsp_extensions.nvim")
    --use("glepnir/lspsaga.nvim")
    --use("simrat39/symbols-outline.nvim")
    --use("L3MON4D3/LuaSnip")
    --use("saadparwaiz1/cmp_luasnip")
--
    ---- Primeagen doesn"t create lodash
    --use("ThePrimeagen/git-worktree.nvim")
    --use("ThePrimeagen/harpoon")
--

    --use("nvim-treesitter/playground")

    --use("mfussenegger/nvim-dap")
    --use("rcarriga/nvim-dap-ui")
    --use("theHamsta/nvim-dap-virtual-text")
end)
