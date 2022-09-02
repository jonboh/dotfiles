local Remap = require("jonbo.keymap")
local nnoremap = Remap.nnoremap

--nnoremap("<C-p>", function()
--    require( telescope.builtin ).git_files()
--end)

nnoremap("<leader>pf", function()
    require( telescope.builtin ).find_files()
end)

nnoremap("<leader>pb", function()
    require( telescope.builtin ).buffers()
end)

-- git
nnoremap("<leader>gb", function()
    require( telescope.builtin ).git_branches()
end)

-- vim related
-- easily access help with preview
nnoremap("<leader>vh", function()
    require( telescope.builtin ).help_tags()
end)

-- config files
nnoremap("<leader>vrc", function()
    local tel = require( jonbo.telescope )
    tel.search_dotfiles({ hidden = true })
end)

