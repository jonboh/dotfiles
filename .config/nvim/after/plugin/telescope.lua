local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

--nnoremap("<C-p>", function()
--    require( telescope_builtin.builtin ).git_files()
--end)
local telescope_builtin = require( telescope.builtin )
nnoremap("<leader>f", telescope_builtin.find_files)

nnoremap("<leader>b", telescope_builtin.buffers)

nnoremap("<leader>k", telescope_builtin.keymaps)
-- git
nnoremap("<leader>gb", telescope_builtin.git_branches)
nnoremap("<leader>gf", telescope_builtin.git_files)

-- vim related
-- easily access help with preview
nnoremap("<leader>vh", telescope_builtin.help_tags)
-- config files
nnoremap("<leader>vrc", function()
    require( jonbo.telescope ).search_dotfiles({ hidden = true })
end)

