local utils = require "astronvim.utils"

return {
    {
        'ray-x/lsp_signature.nvim',
        event = 'BufRead',
        config = function() require('lsp_signature').setup() end,
    },
    {
        'onsails/lspkind.nvim',
        opts = function(_, opts)
            -- use codicons preset
            opts.preset = 'codicons'
            -- set some missing symbol types
            opts.symbol_map = {
                Array = '',
                Boolean = '',
                Key = '',
                Namespace = '',
                Null = '',
                Number = '',
                Object = '',
                Package = '',
                String = '',
            }
            return opts
        end,
    },
    {
        'nvimtools/none-ls.nvim',
        lazy = true,
        event = 'VeryLazy',
        dependencies = { 'nvimtools/none-ls-extras.nvim' },
        config = function()
            -- require 'user.configs.none-ls'
        end,
    },
    -- {
    --     'jose-elias-alvarez/typescript.nvim',
    --     init = function()
    --         astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "tsserver")
    --     end,
    --     ft = {
    --         'typescript',
    --         'typescriptreact',
    --         'javascript',
    --         'javascriptreact',
    --     },
    --     opts = function()
    --         return { server = require('astronvim.utils.lsp').config 'tsserver' }
    --     end,
    --     settings = {
    --         typescript = {
    --             inlayHints = {
    --                 insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
    --             }
    --         },
    --         javascript = {
    --             inlayHints = {
    --                 insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
    --             }
    --         }
    --     }
    -- },
    -- {
    --     'MunifTanjim/prettier.nvim',
    --     config = function()
    --         require('prettier').setup({
    --             bin = 'prettierd',
    --             cli_options = {
    --                 config_precedence = "prefer-file"
    --             }
    --         })
    --     end,
    --     requires = {
    --         'jay-babu/mason-null-ls.nvim',
    --         'neovim/nvim-lspconfig',
    --         'jose-elias-alvarez/null-ls.nvim',
    --     },
    -- },
    -- {
    --     'dmmulroy/tsc.nvim',
    --     cmd = { 'TSC' },
    --     opts = {},
    -- },
}
