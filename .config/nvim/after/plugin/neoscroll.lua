require( neoscroll ).setup({
    -- Set any options as needed
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t[ <C-u> ] = { scroll , { -vim.wo.scroll ,  true ,  35 }}
t[ <C-d> ] = { scroll , {  vim.wo.scroll ,  true ,  35 }}
t[ <C-b> ] = { scroll , { -vim.api.nvim_win_get_height(0) ,  true ,  45 }}
t[ <C-f> ] = { scroll , {  vim.api.nvim_win_get_height(0) ,  true ,  45 }}
t[ <C-y> ] = { scroll , { -0.10 ,  false ,  10 }}
t[ <C-e> ] = { scroll , {  0.10 ,  false ,  10 }}
t[ zt ]    = { zt , { 25 }}
t[ zz ]    = { zz , { 25 }}
t[ zb ]    = { zb , { 25 }}

require( neoscroll.config ).set_mappings(t)
