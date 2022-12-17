local builtin = require('telescope.builtin')

function find_files()
  builtin.find_files({
    layout_strategy='horizontal',
    layout_config={
      width=0.95,
      prompt_position="top",
      preview_width=0.6
    },
    sorting_strategy="ascending"
  })
end

vim.keymap.set('n', '<leader>ff', find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})


local status, telescope = pcall(require, "telescope")

if (not status) then
  print("Telescope is not installed")
  return
end

require('telescope').setup{
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  pickers = {
    find_files = {
--      theme = "dropdown",
    }
  },
}

require("telescope").load_extension('harpoon')

