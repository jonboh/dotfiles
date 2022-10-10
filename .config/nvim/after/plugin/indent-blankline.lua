vim.opt.list = true
--vim.opt.listchars:append "space:⋅" -- weird blue coloring on indent points
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    char = "▎",
    space_char_blankline = " ",
    show_current_context = false, -- current context not working correctly
    show_current_context_start = false, -- underline not correctly colored on windows terminal
    use_treesitter_scope = false,
}
-- TODO: Fix coloring
