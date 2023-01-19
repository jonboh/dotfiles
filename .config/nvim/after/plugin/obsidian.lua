local vault_dir ="~/doc/vault" 
require("obsidian").setup({
    dir = vault_dir,
    daily_notes = {
        folder = "Journal",
    },
    completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        use_advanced_uri = true,
    },
    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 16 random uppercase letters to the suffix.
          for _ = 1, 16 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return suffix -- removed the time so that links work correctly on MOCs
    end

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
vim.keymap.set( n ,  <leader>ot , ":e "..vault_dir.."/TODO.md<CR>")

-- vim.keymap.set( n ,   ,  <cmd>ObsidianNew<CR> )
