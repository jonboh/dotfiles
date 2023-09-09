local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

local telescope = require( telescope )
local telescope_builtin = require( telescope.builtin )
--require("telescope").load_extension("git_worktree") -- not yet working

-- files
grep_word = function()
    telescope_builtin.grep_string { search = vim.fn.expand("<cword>") }
end

nnoremap("<leader>f", require("jonbo.telescope").find_files)
nnoremap("<leader>s", telescope_builtin.live_grep)
vnoremap("<leader>s", "\"zy<cmd>exec  Telescope grep_string search=  . escape(@z,    )<cr>")
nnoremap("<leader>tw", grep_word)
nnoremap("<leader>tt", telescope_builtin.resume)
nnoremap("<leader>tq", telescope_builtin.quickfix)
nnoremap("<leader>/", function() telescope_builtin.current_buffer_fuzzy_find({
    sorting_strategy="ascending",
    layout_config={prompt_position="top"}
}) end)

-- git
nnoremap("<leader>tgb", telescope_builtin.git_branches)
nnoremap("<leader>tgf", telescope_builtin.git_files)
-- nnoremap("<leader>tgw", telescope.extensions.git_worktree.git_worktrees)
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion

-- vim related
search_dotfiles = function()
    require( jonbo.telescope ).search_dotfiles({ hidden = true }) -- config files
end
nnoremap("<leader>tk", telescope_builtin.keymaps)
nnoremap("<leader>vb", telescope_builtin.buffers) --view open buffers
nnoremap("<leader>th", telescope_builtin.help_tags) -- easily access help with preview
nnoremap("hs", telescope_builtin.lsp_dynamic_workspace_symbols)
nnoremap("<leader>rc", search_dotfiles)
nnoremap("<leader>tr", telescope_builtin.registers)
nnoremap("<leader>:", telescope_builtin.commands)
nnoremap("<leader><C-r>", telescope_builtin.command_history)

-- telescope file explorer
nnoremap("<leader>b", telescope.extensions.file_browser.file_browser)

