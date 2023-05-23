-- Ecodings
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Indents
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.breakindent = true
vim.opt.expandtab = true

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true

-- CMD and status line
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

-- Backups
vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*" }
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Block comments
vim.opt.formatoptions:append { "r" }

vim.opt.path:append { "**" }
vim.opt.wildignore:append { "*/node_modules/*" }
vim.opt.backspace = { "eol", "indent", "start" }
vim.opt.inccommand = "split"
vim.opt.wrap = true
vim.opt.shell = "bash" -- turn it into fish later
vim.opt.scrolloff = 5
vim.opt.title = true
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"

-- Pasting with "p" from clipboard
vim.opt.clipboard:append { 'unnamedplus' }

-- Netrw
vim.g.netrw_liststyle = 3
