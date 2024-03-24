return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local trouble = require 'trouble'
    vim.keymap.set('n', '<leader>xx', trouble.toggle, { desc = 'Trouble: Toggle' })
  end,
}
