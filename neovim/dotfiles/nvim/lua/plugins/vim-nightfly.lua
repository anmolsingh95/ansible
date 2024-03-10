return {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000,
    config = function()
        vim.o.termguicolors = true
        vim.cmd.colorscheme("nightfly")
    end,
}
