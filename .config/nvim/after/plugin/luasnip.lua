local ls = require "luasnip"
local types require("luasnip.util.types")

ls.config.set_config {
    updateevents = "TextChanged,TextChangedI"

    -- TODO: setup ext_opts to get virtual text on choiceNode
}
