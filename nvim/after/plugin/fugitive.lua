local map = vim.keymap.set;

vim.g.fugitive_gitlab_domains = {'https://gitlab.foliant.app'}

map("n", "<leader>gs", vim.cmd.Git)


