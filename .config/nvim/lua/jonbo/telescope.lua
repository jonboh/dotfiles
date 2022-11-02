local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        file_ignore_patterns = {"build", "vcpkg"}
--		mappings = {
--			i = {
--				["<C-x>"] = false,
--				["<C-q>"] = actions.send_to_qflist,
--			},
--		},
	},
	extensions = {
            file_browser = {
                hijack_netwr = true, -- TODO: fix hijacking

              path = "%:p:h",
            },
          }
})
require("telescope").load_extension("file_browser")

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = os.getenv("XDG_CONFIG_HOME") .. "/nvim",
		hidden = true,
	})
end

return M
