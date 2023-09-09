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

        preview = {
              filesize_limit = 1, -- top at 1 mb
              timeout = 100, -- ms
        },

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

M.find_files = function()
	require("telescope.builtin").find_files({
        file_ignore_patterns = { -- TODO: add only for <<leader>-f>
            "vcpkg/", 
            "vcpkg\\", 
            "build/", 
            "build\\",
            "target/", 
            "target\\",
        }
    })
end


return M
