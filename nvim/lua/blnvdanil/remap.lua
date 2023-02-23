vim.g.mapleader = " "

local map = vim.keymap.set

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set({"n", "v"}, "h", ";")
vim.keymap.set({"n", "v"}, "j", "h")
vim.keymap.set({"n", "v"}, "k", "j")
vim.keymap.set({"n", "v"}, "l", "k")
vim.keymap.set({"n", "v"}, ";", "l")

map({"n"}, "<A-j>", "<C-w>h")
map({"n"}, "<A-k>", "<C-w>j")
map({"n"}, "<A-l>", "<C-w>k")
map({"n"}, "<A-;>", "<C-w>l")

