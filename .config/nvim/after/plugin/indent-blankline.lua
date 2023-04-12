vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
vim.cmd([[highlight IndentBlanklineContextChar guifg=#af00af gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextStart guisp=#af00af gui=underline]])
require("indent_blankline").setup {
    char="▎"   ,
    space_char_blankline = "",
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
}
