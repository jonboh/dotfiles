local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

local telescope = require( telescope )
local telescope_builtin = require( telescope.builtin )
--require("telescope").load_extension("git_worktree") -- not yet working

-- files
live_grep = function()
    telescope_builtin.live_grep()--{ search = vim.fn.input("Grep For > ")}
end
grep_word = function()
    telescope_builtin.grep_string { search = vim.fn.expand("<cword>") }
end
nnoremap("<leader>tf", telescope_builtin.find_files) -- TODO: dont show hidden files
nnoremap("<leader>trg", live_grep)
nnoremap("<leader>tw", grep_word)
nnoremap("<leader>tt", telescope_builtin.resume)

-- git
nnoremap("<leader>tgb", telescope_builtin.git_branches)
nnoremap("<leader>tgf", telescope_builtin.git_files)
nnoremap("<leader>tgw", telescope.extensions.git_worktree.git_worktrees)
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion

-- vim related
search_dotfiles = function()
    require( jonbo.telescope ).search_dotfiles({ hidden = true }) -- config files
end
nnoremap("<leader>tk", telescope_builtin.keymaps)
nnoremap("<leader>tvb", telescope_builtin.buffers) --view open buffers
nnoremap("<leader>th", telescope_builtin.help_tags) -- easily access help with preview
nnoremap("<leader>tvrc", search_dotfiles)
nnoremap("<leader>tr", telescope_builtin.registers)

-- telescope file explorer
nnoremap("<leader>tb", telescope.extensions.file_browser.file_browser)

