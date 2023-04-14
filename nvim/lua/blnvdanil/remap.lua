vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

map("v", "L", ":m '<-2<CR>gv=gv")
map("v", "K", ":m '>+1<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", "\"_dP")
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

map("n", "Q", "<nop>")

map({"n", "v"}, "h", ";")
map({"n", "v"}, "j", "h")
map({"n", "v"}, "k", "j")
map({"n", "v"}, "l", "k")
map({"n", "v"}, ";", "l")

map({"n"}, "<A-j>", "<C-w>h")
map({"n"}, "<A-k>", "<C-w>j")
map({"n"}, "<A-l>", "<C-w>k")
map({"n"}, "<A-;>", "<C-w>l")

