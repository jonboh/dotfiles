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
-- vim.keymap.set( n ,  <space>e , vim.diagnostic.open_float, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set( n ,  gd , vim.lsp.buf.definition, bufopts) -- TODO: add zt to command to place cursor above
  vim.keymap.set( n ,  gD , vim.lsp.buf.declaration, bufopts)
  vim.keymap.set( n ,  gi , vim.lsp.buf.implementation, bufopts)
  vim.keymap.set( n ,  gt , vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set( n ,  gr , vim.lsp.buf.references, bufopts)
  vim.keymap.set( i ,  <C-h> , vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set( i ,  <C-t> , vim.lsp.buf.hover, bufopts)
  vim.keymap.set( n ,  <leader>rn , vim.lsp.buf.rename, bufopts)
--  vim.keymap.set( n ,  <leader>f , vim.lsp.buf.formatting, bufopts) -- disabled in favor of formatter.nvim
  vim.keymap.set( n ,  <leader>ca , vim.lsp.buf.code_action, bufopts)
  vim.keymap.set( n , "<leader>vd", vim.diagnostic.open_float)
  vim.keymap.set( n , "[d", vim.diagnostic.goto_next)
  vim.keymap.set( n , "]d", vim.diagnostic.goto_prev)
end

-- LSP Configuration
-- C++ 
nnoremap( <leader>o , "<cmd>:ClangdSwitchSourceHeader<CR>") -- TODO: add this on attach
require lspconfig .clangd.setup {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()), -- advertise capabilities
		cmd = { "clangd", "--background-index" },
        on_attach = on_attach,
}

-- Python
require lspconfig .pylsp.setup{
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    --ignore = {  },
                    maxLineLength = 100
                }
            }
        }
    }   --config param available at 
    --https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
    --https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
}

-- CMake
require lspconfig .cmake.setup{}

