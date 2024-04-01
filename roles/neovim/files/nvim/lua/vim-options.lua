-- Set leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set up keybinds for Rust projects
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function()
    vim.keymap.set('n', '<leader>bd', ':!cargo build<CR>', { buffer = true })
    vim.keymap.set('n', '<leader>br', ':!cargo build --release<CR>', { buffer = true })
    vim.keymap.set('n', '<leader>tt', ':!cargo test<CR>', { buffer = true })
  end,
})

-- Set up keybinds for C++ projects
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    vim.keymap.set('n', '<leader>bd', ':!make<CR>', { buffer = true })
    vim.keymap.set('n', '<leader>br', ':!make release<CR>', { buffer = true })
  end,
})

-- let j and k move up and down lines that have been wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Configure shiftwidth for TypeScript and JavaScript files
vim.cmd [[
  autocmd FileType typescript,typescriptreact,javascript let g:sleuth_automatic = 0
  autocmd FileType typescript,typescriptreact,javascript set shiftwidth=2
]]
