return {
  'theprimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Add file to Harpoon quick menu' })
    vim.keymap.set('n', '<leader>d', mark.rm_file, { desc = 'Remove file from Harpoon quick menu' })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Toggle Harpoon quick menu' })
    vim.keymap.set('n', '<C-j>', ui.nav_next, { desc = 'Navigate to the next file in the Harpoon quick menu' })
    vim.keymap.set('n', '<C-k>', ui.nav_prev, { desc = 'Navigate to the previous file in the Harpoon quick menu' })
  end,
}
