local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M={}
function M.get_program()
      return coroutine.create(function(coro)
        local opts = {}
        pickers
          .new(opts, {
            prompt_title = "Path to executable",
            finder = finders.new_oneshot_job({ "fd", "--exclude", ".git", "--no-ignore", "--type", "x"}, {}),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(buffer_number)
              actions.select_default:replace(function()
                actions.close(buffer_number)
                coroutine.resume(coro, action_state.get_selected_entry()[1])
              end)
              return true
            end,
          })
          :find()
      end)
    end
return M
