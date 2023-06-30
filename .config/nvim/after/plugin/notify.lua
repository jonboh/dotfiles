require( notify ).setup({
    background_colour = "#000000",
    max_width=function()
       return math.floor(vim.api.nvim_win_get_width(0)/2)
    end
})
