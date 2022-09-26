local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local cmp = require( cmp )
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require( luasnip ).lsp_expand(args.body) -- For `luasnip` users.
        -- require( snippy ).expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      [ <C-b> ] = cmp.mapping.scroll_docs(-4),
      [ <C-f> ] = cmp.mapping.scroll_docs(4),
      [ <C-Space> ] = cmp.mapping.complete(),
      [ <C-e> ] = cmp.mapping.abort(),
      [ <CR> ] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name =  nvim_lsp  },
      { name =  vsnip  }, -- For vsnip users.
      -- { name =  luasnip  }, -- For luasnip users.
      -- { name =  ultisnips  }, -- For ultisnips users.
      -- { name =  snippy  }, -- For snippy users.
    }, {
      { name =  buffer  },
    })
  })
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
  vim.keymap.set( i ,  <C-h> , vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set( n ,  K , vim.lsp.buf.hover, bufopts)
  vim.keymap.set( n ,  <leader>rn , vim.lsp.buf.rename, bufopts)
  vim.keymap.set( n ,  <leader>f , vim.lsp.buf.formatting, bufopts)
  vim.keymap.set( n ,  <leader>ca , vim.lsp.buf.code_action, bufopts)
    nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
    nnoremap("[d", function() vim.diagnostic.goto_next() end)
    nnoremap("]d", function() vim.diagnostic.goto_prev() end)
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
		cmd = { "clangd-12", "--background-index" },
        on_attach = on_attach,
}

-- Python
require lspconfig .pylsp.setup{
		on_attach = on_attach,
    --config param available at 
    --https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
    --https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
}
