local options = {
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { 'stylelua' },

    javascript = { { 'prettierd', 'prettier' } },
    typescript = { { 'prettierd', 'prettier' } },
    css = { { 'prettierd', 'prettier' } },
    html = { { 'prettierd', 'prettier' } },

    python = { 'isort', 'black' },

    sh = { 'shfmt' },
  },
  format_on_save = { timeout_ms = 500, lsp_fallback = true },
}

require('conform').setup(options)
