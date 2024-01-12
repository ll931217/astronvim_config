local utils = require "astronvim.utils"

local function check_json_key_exists(filename, key)
  -- Open the file in read mode
  local file = io.open(filename, "r")
  if not file then
    return false -- File does not exist
  end

  -- Read the contents of the file
  local contents = file:read("*all")
  file:close()

  -- Parse the JSON content
  local json_parsed, json = pcall(vim.json.decode, contents)
  if not json_parsed or type(json) ~= "table" then
    return false -- Invalid JSON
  end

  -- Check if the key exists in the JSON
  return json[key] ~= nil
end

return {
    {
        'williamboman/mason-lspconfig.nvim',
        opts = function(_, opts)
            opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
                'jsonls',
                'tsserver'
            })
        end
    },
    {
        'jay-babu/mason-null-ls.nvim',
        opts = function(_, opts)
            opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { 'prettierd', 'eslint_d' })
            if not opts.handlers then opts.handlers = {} end

            local has_prettier = function(util)
                return check_json_key_exists(vim.fn.getcwd() .. '/package.json', 'prettier')
                    or util.root_has_file '.prettierrc'
                    or util.root_has_file '.prettierrc.json'
                    or util.root_has_file '.prettierrc.yml'
                    or util.root_has_file '.prettierrc.yaml'
                    or util.root_has_file '.prettierrc.json5'
                    or util.root_has_file '.prettierrc.js'
                    or util.root_has_file '.prettierrc.cjs'
                    or util.root_has_file '.prettierrc.toml'
                    or util.root_has_file 'prettier.config.js'
                    or util.root_has_file 'prettier.config.cjs'
            end

            local has_eslint = function(util)
                return check_json_key_exists(vim.fn.getcwd() .. '/package.json', 'eslintConfig')
                    or util.root_has_file '.eslintrc'
                    or util.root_has_file '.eslintrc.js'
                    or util.root_has_file '.eslintrc.cjs'
                    or util.root_has_file '.eslintrc.yaml'
                    or util.root_has_file '.eslintrc.yml'
                    or util.root_has_file '.eslintrc.json'
            end

            opts.handlers.prettierd = function()
                local null_ls = require 'null-ls'
                null_ls.register(null_ls.builtins.formatting.prettierd.with { condition = has_prettier })
            end

            opts.handlers.eslint_d = function()
                local null_ls = require 'null-ls'
                null_ls.register(null_ls.builtins.diagnostics.eslint_d.with { condition = has_eslint })
                null_ls.register(null_ls.builtins.formatting.eslint_d.with { condition = has_eslint })
                null_ls.register(null_ls.builtins.code_actions.eslint_d.with { condition = has_eslint })
            end
        end
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        opts = function(_, opts)
            opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
                'js'
            })
        end
    },
    {
        'vuki656/package-info.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' },
        opts = {},
        event = 'BufRead package.json'
    }
}
