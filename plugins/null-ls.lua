return {
  'jose-elias-alvarez/null-ls.nvim',
  opts = function(_, config)
    -- config variable is the default configuration table for the setup functino call
    local null_ls = require 'null-ls'

    config.on_attach = function(client, bufnr)
      local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
      local event = "BufWritePre" -- or "BufWritePost"
      local async = event == "BufWritePost"

      if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "<Leader>f", function()
          vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
        end, { buffer = bufnr, desc = "[lsp] format" })

        -- format on save
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        vim.api.nvim_create_autocmd(event, {
          buffer = bufnr,
          group = group,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, async = async })
          end,
          desc = "[lsp] format on save",
        })
      end

      if client.supports_method("textDocument/rangeFormatting") then
        vim.keymap.set("x", "<Leader>f", function()
          vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
        end, { buffer = bufnr, desc = "[lsp] format" })
      end
    end

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.eslint,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.prettierd,
      -- null_ls.builtins.formatting.stylua,
    }
    return config -- return final config table to use in require("null-ls").setup(config)
  end
}
