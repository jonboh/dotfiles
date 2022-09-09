local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

local telescope_builtin = require( telescope.builtin )

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

-- vim related
nnoremap("<leader>vk", telescope_builtin.keymaps)
nnoremap("<leader>vb", telescope_builtin.buffers) --view open buffers
nnoremap("<leader>vh", telescope_builtin.help_tags) -- easily access help with preview
nnoremap("<leader>vrc", function()
    require( jonbo.telescope ).search_dotfiles({ hidden = true }) -- config files
end)

