local opt = vim.opt

opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0

-- Popup menu in cmd completion
opt.wildoptions = "pum"
opt.pumblend = 5

vim.cmd("colorscheme kanagawa-wave")
--vim.cmd("colorscheme kanagawa-lotus") -- light
--vim.cmd("colorscheme kanagawa-dragon") -- dark
