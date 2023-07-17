return {
  "ThePrimeagen/harpoon",

  config = function ()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    local keymap = vim.keymap

    keymap.set("n", "<leader>a", mark.add_file)
    keymap.set("n", "<leader>t", ui.toggle_quick_menu)
  end
}
