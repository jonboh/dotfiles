local vault_dir ="~/doc/vault"
require("obsidian").setup({
    dir = vault_dir,
    completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
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

search_obsidian_notes_files = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Vault Notes >",
		cwd = vault_dir,
		hidden = false,
	})
end
grep_obsidian_notes = function()
	require("telescope.builtin").live_grep({
		prompt_title = "< Vault Grep >",
		cwd = vault_dir,
		hidden = false,
	})
end

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
vim.keymap.set( n ,  <leader>os , grep_obsidian_notes, {silent=true})
vim.keymap.set( n ,  <leader>ob ,  <cmd>ObsidianBacklinks<CR> , {silent=true})
vim.keymap.set( n ,  <leader>on , ":ObsidianNew ", {silent=true})
vim.keymap.set( n ,  <leader>ot , ":e "..vault_dir.."/TODO.md<CR>", {silent=true})
vim.keymap.set( n ,  <leader>of , search_obsidian_notes_files, {silent=true})
