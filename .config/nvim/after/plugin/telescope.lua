local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

local telescope_builtin = require( telescope.builtin )

-- files
nnoremap("<leader>tf", telescope_builtin.find_files) -- TODO: dont show hidden files
-- TODO: grep does not work

-- git
nnoremap("<leader>gb", telescope_builtin.git_branches)
nnoremap("<leader>gf", telescope_builtin.git_files)

-- vim related
nnoremap("<leader>vk", telescope_builtin.keymaps)
nnoremap("<leader>vb", telescope_builtin.buffers) --view open buffers
nnoremap("<leader>vh", telescope_builtin.help_tags) -- easily access help with preview
nnoremap("<leader>vrc", function()
    require( jonbo.telescope ).search_dotfiles({ hidden = true }) -- config files
end)

