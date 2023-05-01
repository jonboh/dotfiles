local lsp = require( lsp-zero )

lsp.preset( lsp-only ) -- lsp-only does not configure cmp, so that we 

local mappings = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set( n ,  hd , vim.lsp.buf.definition, bufopts)
    vim.keymap.set( n ,  hD , vim.lsp.buf.declaration, bufopts)
    vim.keymap.set( n ,  hi , vim.lsp.buf.implementation, bufopts)
    vim.keymap.set( n ,  ht , vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set( n ,  hr , vim.lsp.buf.references, bufopts)
    vim.keymap.set( n ,  <C-k> , vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set( i ,  <C-k> , vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set( n ,  K , vim.lsp.buf.hover, bufopts)
    vim.keymap.set( n ,  hn , vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set( n ,  <leader>f , vim.lsp.buf.formatting, bufopts) -- disabled in favor of formatter.nvim
    vim.keymap.set( n ,  ha , vim.lsp.buf.code_action, bufopts)
    vim.keymap.set( n , "he", vim.diagnostic.open_float)
    vim.keymap.set( n , "]d", vim.diagnostic.goto_next)
    vim.keymap.set( n , "[d", vim.diagnostic.goto_prev)
end

lsp.on_attach(mappings)

lsp.skip_server_setup({ rust_analyzer })

-- Python LSP Configuration
-- require( lspconfig ).pylsp.setup({
    --     cmd={ pylsp ,
    --     on_attach = mappings,
    -- })

lsp.setup()

-- Rust LSP Configuration
local rust_lsp = lsp.build_options( rust_analyzer , {})
rust_analyzer_cmd = { rustup ,  run ,  stable ,  rust-analyzer }
rust_lsp[ cmd ] = rust_analyzer_cmd
rust_lsp[ settings ] = {
    ["rust-analyzer"] = {
        checkOnSave = {
            command = "clippy"
        }
    }
}

rt = require("rust-tools")
local extension_path = vim.fn.stdpath("data").."/mason".."/packages".."/codelldb".."/extension"
local codelldb_path = extension_path ..  /adapter/codelldb 
local liblldb_path = extension_path ..  /lldb/lib/liblldb.so   -- MacOS: This may be .dylib

local opts = {
    -- ... other configs
    server=rust_lsp,
    dap = {
        adapter = require( rust-tools.dap ).get_codelldb_adapter(
        codelldb_path, liblldb_path)
    }
}

-- Normal setup
require( rust-tools ).setup(opts)

local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap
nnoremap( ho , "<cmd>:ClangdSwitchSourceHeader<CR>") -- TODO: add this on attach

local cmp = require( cmp )
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}
local luasnip = require( luasnip )

cmp.setup({
    mapping = {
        [ <C-y> ] = cmp.mapping.confirm({select = true}),
        [ <C-e> ] = cmp.mapping.abort(),
        [ <C-u> ] = cmp.mapping.scroll_docs(-4),
        [ <C-d> ] = cmp.mapping.scroll_docs(4),
        [ <C-p> ] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item(cmp_select_opts)
            else
                cmp.complete()
            end
        end),
        [ <C-n> ] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item(cmp_select_opts)
            else
                cmp.complete()
            end
        end),
    ["<Tab>"] = cmp.mapping(function(fallback) 
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                -- fallback()
            end
        end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback) 
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                -- fallback()
            end
        end,{ "i", "s" }),

    },
    snippet = {
        expand = function(args)
            require( luasnip ).lsp_expand(args.body)
        end,
    },
    window = {
        documentation = {
            max_height = 15,
            max_width = 60,
        }
    },
    formatting = {
        fields = { abbr ,  menu ,  kind },
        format = function(entry, item)
            local short_name = {
                nvim_lsp =  LSP ,
                -- nvim_lsp_signature_help =  LSPh ,
                nvim_lua =  nvim ,
                luasnip =  snip ,
                fuzzy_path =  path 
            }

            local menu_name = short_name[entry.source.name] or entry.source.name

            item.menu = string.format( [%s] , menu_name)
            return item
        end,
    },
    sources = {
        -- { name = "nvim_lsp_signature_help" },
        -- { name = "cmp_tabnine", priority = 8 },
        { name = "nvim_lsp", priority = 8 },
        { name = "luasnip", priority = 7 },
        { name = "buffer", priority = 7 }, -- first for locality sorting?
        -- { name = "spell", keyword_length = 3, priority = 5, keyword_pattern = [[\w\+]] },
        -- { name = "dictionary", keyword_length = 3, priority = 5, keyword_pattern = [[\w\+]] }, -- from uga-rosa/cmp-dictionary plug
        -- { name =  rg },
        { name = "nvim_lua", priority = 5 },
        -- { name =  path  },
        { name = "fuzzy_path", priority = 4 }, -- from tzacher
        -- { name = "calc", priority = 3 },
    },
    sorting = {
        priority_weight = 1.0,
        comparators = {
            -- compare.score_offset, -- not good at all
            cmp.config.compare.locality,
            cmp.config.compare.recently_used,
            cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            cmp.config.compare.offset,
            cmp.config.compare.order,
            -- compare.scopes, -- what?
            -- compare.sort_text,
            -- compare.exact,
            -- compare.kind,
            -- compare.length, -- useless 
        },
    }

})
