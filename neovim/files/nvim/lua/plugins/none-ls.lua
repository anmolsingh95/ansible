return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- lua
                null_ls.builtins.formatting.stylua,

                -- javascript
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.formatting.prettier,

                -- python
                null_ls.builtins.diagnostics.ruff,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            },
        })

        vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ async = true })
        end)
    end,
}
