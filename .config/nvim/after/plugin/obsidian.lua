require("obsidian").setup({
    dir = "~/doc/obsidian",
    notes_subdir = "Zettlekasten",
    daily_notes = {
        folder = "Journal",
    },
    completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        use_advanced_uri = true,
    }
})

-- TODO: check difference with https://github.com/epwalsh/obsidian.nvim#using-nvim-treesitter

vim.keymap.set( n ,  gf ,
  function()
    if require( obsidian ).util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true}
)
vim.keymap.set( n ,  <leader>os ,  <cmd>ObsidianSearch<CR> )
vim.keymap.set( n ,  <leader>ob ,  <cmd>ObsidianBacklinks<CR> )
vim.keymap.set( n ,  <leader>on , ":ObsidianNew ")

-- vim.keymap.set( n ,   ,  <cmd>ObsidianNew<CR> )
