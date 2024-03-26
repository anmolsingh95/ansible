return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files { hidden = true }
      end, { desc = 'Find all files' })
      vim.keymap.set('n', '<leader>fg', function()
        builtin.git_files { hidden = true }
      end, { desc = 'Find git files' })
      vim.keymap.set('n', '<leader>lg', function()
        builtin.live_grep { hidden = true }
      end, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = 'Help tags' })
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {},
          },
        },
      }
      require('telescope').load_extension 'ui-select'
    end,
  },
}
