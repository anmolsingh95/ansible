-- Set leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- set indentation
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set expandtab")
vim.cmd("filetype plugin indent on")
vim.cmd("autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType lua setlocal tabstop=4 shiftwidth=4 expandtab")
