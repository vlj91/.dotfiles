-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
map("n", "<leader>goB", ":GBrowse<CR>", { desc = "Open line in browser" })

return {
{
    "n",
    "<leader><space>",
    function()
      require("telescope.builtin").find_files({
        cwd = require("lazyvim.util").root(), -- always use git root
        prompt_title = "Find Files (Git Root)",
      })
    end,
    desc = "Find Files (Git Root)",
  },
}
