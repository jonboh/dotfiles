local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local sorters = require("telescope.sorters")

require("telescope").setup({
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

        file_ignore_patterns = {
            "vcpkg/", 
            "vcpkg\\", 
            "build/", 
            "build\\",
            "target/", 
            "target\\",
    }
--		mappings = {
--			i = {
--				["<C-x>"] = false,
--				["<C-q>"] = actions.send_to_qflist,
--			},
--		},
	},
	extensions = {
            file_browser = {
                hidden = true,
              path = "%:p:h",
            },
          }
})
require("telescope").load_extension("file_browser")
 -- this plugin implements the fzf fuzzy finding algorithm which will allow to
 -- search terms with spaces regardless of the order of the words
require( telescope ).load_extension( fzf )

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = os.getenv("XDG_CONFIG_HOME") .. "/nvim",
		hidden = true,
	})
end

return M
