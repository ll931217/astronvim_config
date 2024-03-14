-- config variable is the default configuration table for the setup functino call
local null_ls = require 'null-ls'
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local config = {}

config.sources = {
  null_ls.builtins.code_actions.refactoring,
  null_ls.builtins.completion.luasnip,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.gofmt,
  require('none-ls.code_actions.eslint_d'),
  require('none-ls.diagnostics.eslint_d'),
}

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

local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    'textDocument/formatting',
    vim.lsp.util.make_formatting_params({}),
    function(err, res, ctx)
      if err then
        local err_msg = type(err) == 'string' and err or err.message
        vim.notify('LSP formatting request failed: ' .. err_msg, vim.log.levels.WARN)
        return
      end

      if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_get_option_value('modified', { buf = bufnr }) then
        return
      end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or 'utf-16')
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd 'silent noautocmd update'
        end)
      end
    end
  )
end

-- config.on_attach = function(client, bufnr)
--   if client.supports_method('textDocument/formatting') then
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--     vim.api.nvim_create_autocmd('BufWritePost', {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         vim.notify('LSP formatting', vim.log.levels.INFO)
--         async_formatting(bufnr)
--       end,
--     })
--   end
-- end

require('null-ls').setup(config)
