
local telescope_config = function ()
  local utils = require("blnvdanil.lazy.plugins.telescope.utils")
  local set_keymap = vim.keymap.set;

  set_keymap('n', '<leader>ff', utils.find_files, {})
  set_keymap('n', '<leader>fg', utils.live_grep, {})
  set_keymap('n', '<leader>fb', utils.buffers, {})
  set_keymap('n', '<C-p>', utils.git_files, {})

  local telescope = require("telescope")

  telescope.setup {
    defaults = {
      layout_config = {
        vertical = { width = 0.5 }
      },
      wrap_results = true,
      path_display = {truncate = 3},
      dynamic_preview_title = true,

      color_devicons = true,
      mappings = {
        n = {
          ["j"] = false,
          ["k"] = "move_selection_next",
          ["l"] = "move_selection_previous",
          [";"] = false,
        }
      },

      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim",
      }
    },
    pickers = {
      find_files = {
        -- theme = "dropdown",
      }
    },
  }

  require("telescope").load_extension('harpoon')
end

return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.2',

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = telescope_config,
}
