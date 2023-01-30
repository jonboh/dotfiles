local neoscroll = require("neoscroll")

local easing = "sine"
local zz_time_ms = 15
local jump_time_ms = 25

neoscroll.setup({
	post_hook = function(info)
		if info ~= "center" then
			return
		end

		-- The `defer_fn` is a bit of a hack.
		-- We use it so that `neoscroll.init.scroll` will be false when we call `neoscroll.zz`
		-- As long as we don t input another neoscroll mapping in the timeout,
		-- we should be able to center the cursor.
		local defer_time_ms = 5
		vim.defer_fn(function()
			neoscroll.zz(zz_time_ms, easing)
		end, defer_time_ms)
	end,
})

local mappings = {}

mappings["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", jump_time_ms, easing, " center " } }
mappings["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", jump_time_ms, easing, " center " } }
mappings[ zt ]    = { zt , {jump_time_ms}}
mappings[ zz ]    = { zz , {jump_time_ms}}
mappings[ zb ]    = { zb , {jump_time_ms}}

require("neoscroll.config").set_mappings(mappings)
