-- LSP Configuration
-- C++ 
require lspconfig .clangd.setup {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()), -- advertise capabilities
		on_attach = on_attach,
}

-- Python
require lspconfig .pylsp.setup{
		on_attach = on_attach,
    --config param available at 
    --https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
    --https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
}
