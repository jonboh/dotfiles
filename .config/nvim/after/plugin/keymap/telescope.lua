local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

local telescope_builtin = require( telescope.builtin )
--require("telescope").load_extension("git_worktree") -- not yet working

-- files
nnoremap("<leader>tf", telescope_builtin.find_files) -- TODO: dont show hidden files
nnoremap("<leader>tg", function()
    telescope_builtin.live_grep(
--    { search = vim.fn.input("Grep For > ")}
)
end)

nnoremap("<leader>tw", function()
    telescope_builtin.grep_string { search = vim.fn.expand("<cword>") }
end)

-- git
nnoremap("<leader>gb", telescope_builtin.git_branches)
nnoremap("<leader>gf", telescope_builtin.git_files)
--not yet working
--nnoremap("<leader>gw", require( telescope ).extensions.git_worktree.git_worktrees)
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion

-- vim related
nnoremap("<leader>vk", telescope_builtin.keymaps)
nnoremap("<leader>vb", telescope_builtin.buffers) --view open buffers
nnoremap("<leader>vh", telescope_builtin.help_tags) -- easily access help with preview
nnoremap("<leader>vrc", function()
    require( jonbo.telescope ).search_dotfiles({ hidden = true }) -- config files
end)

