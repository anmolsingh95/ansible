return {
  'stevearc/conform.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local servers = {
      ruff = {},
      black = {},
      stylua = {},
      gofumpt = {},
      yamlfix = {},
      mdformat = {},
    }
    require('mason').setup()
    local ensure_installed = vim.tbl_keys(servers or {})
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofumpt' },
        python = { 'ruff', 'black' },
        yaml = { 'yamlfix' },
        yml = { 'yamlfix' },
        markdown = { 'mdformat' },
      },
    }
  end,
}
