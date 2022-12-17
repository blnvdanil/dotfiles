local status1, mark = pcall(require, "harpoon.mark")
local status2, ui = pcall(require, "harpoon.ui")

if (not status1 or not status2) then
  print("Harpoon is not installed.")
  return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>t", ui.toggle_quick_menu) 

