return {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('tokyonight-storm')
        vim.cmd.hi 'Comment gui=none'
    end,
}
