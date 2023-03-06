local lsp = require( lsp-zero )

lsp.preset( recommended )

local mappings = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set( n ,  hd , vim.lsp.buf.definition, bufopts)
    vim.keymap.set( n ,  hD , vim.lsp.buf.declaration, bufopts)
    vim.keymap.set( n ,  hi , vim.lsp.buf.implementation, bufopts)
    vim.keymap.set( n ,  ht , vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set( n ,  hr , vim.lsp.buf.references, bufopts)
    vim.keymap.set( n ,  <C-h> , vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set( i ,  <C-h> , vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set( n ,  hh , vim.lsp.buf.hover, bufopts)
    vim.keymap.set( n ,  hn , vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set( n ,  <leader>f , vim.lsp.buf.formatting, bufopts) -- disabled in favor of formatter.nvim
    vim.keymap.set( n ,  ha , vim.lsp.buf.code_action, bufopts)
    vim.keymap.set( n , "he", vim.diagnostic.open_float)
    vim.keymap.set( n , "]d", vim.diagnostic.goto_next)
    vim.keymap.set( n , "[d", vim.diagnostic.goto_prev)
end

lsp.on_attach(mappings)

lsp.skip_server_setup({ rust_analyzer })

lsp.setup()

local rust_lsp = lsp.build_options( rust_analyzer , {})
rust_analyzer_cmd = { rustup ,  run ,  stable ,  rust-analyzer }
rust_lsp[ cmd ] = rust_analyzer_cmd

rt = require("rust-tools")
rt.setup({server=rust_lsp})



local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap
nnoremap( ho , "<cmd>:ClangdSwitchSourceHeader<CR>") -- TODO: add this on attach

