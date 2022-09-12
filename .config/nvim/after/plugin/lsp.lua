local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

require cmp .setup {
  sources = {
    { name =  nvim_lsp  },
    { name =  buffer  }
  }
}
nnoremap( [d , vim.diagnostic.goto_prev)
nnoremap( ]d , vim.diagnostic.goto_next)
nnoremap( <leader>o , "<cmd>:ClangdSwitchSourceHeader<CR>")
-- nnoremap("<leader>vd", vim.diagnostic.open_float)
-- vim.keymap.set( n ,  <space>e , vim.diagnostic.open_float, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set( n ,  gd , vim.lsp.buf.definition, bufopts)
  vim.keymap.set( n ,  gD , vim.lsp.buf.declaration, bufopts)
  vim.keymap.set( n ,  gi , vim.lsp.buf.implementation, bufopts)
  vim.keymap.set( n ,  gt , vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set( n ,  gr , vim.lsp.buf.references, bufopts)
  vim.keymap.set( n ,  <C-h> , vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set( n ,  K , vim.lsp.buf.hover, bufopts)
  vim.keymap.set( n ,  <leader>rn , vim.lsp.buf.rename, bufopts)
  vim.keymap.set( n ,  <leader>f , vim.lsp.buf.formatting, bufopts)
  vim.keymap.set( n ,  <leader>ca , vim.lsp.buf.code_action, bufopts)
end
--[[
function()
--			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
--			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
--			nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
 --               filter = function(code_action)
  --                  if not code_action or not code_action.data then
   --                     return false
    --                end

  --                  local data = code_action.data.id
 --                   return string.sub(data, #data - 1, #data) == ":0"
   --             end,
     --           apply = true
    --        }) end)
	--		nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end
--]]



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
