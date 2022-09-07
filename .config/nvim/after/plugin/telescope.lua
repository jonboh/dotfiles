local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

--nnoremap("<C-p>", function()
--    require( telescope_builtin.builtin ).git_files()
--end)
local telescope_builtin = require( telescope.builtin )
nnoremap("<leader>f", telescope_builtin.find_files)


nnoremap("<leader>k", telescope_builtin.keymaps)
-- git
nnoremap("<leader>gb", telescope_builtin.git_branches)
nnoremap("<leader>gf", telescope_builtin.git_files)

-- vim related
nnoremap("<leader>vb", telescope_builtin.buffers) --view open buffers
nnoremap("<leader>vh", telescope_builtin.help_tags) -- easily access help with preview
nnoremap("<leader>vrc", function()
    require( jonbo.telescope ).search_dotfiles({ hidden = true }) -- config files
end)

