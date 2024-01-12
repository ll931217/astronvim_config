local utils = require "astronvim.utils"

return {
    {
        'jose-elias-alvarez/typescript.nvim',
        init = function()
            astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "tsserver")
        end,
        ft = {
            'typescript',
            'typescriptreact',
            'javascript',
            'javascriptreact',
        },
        opts = function()
            return { server = require('astronvim.utils.lsp').config 'tsserver' }
        end,
        settings = {
            typescript = {
                inlayHints = {
                    insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
                }
            },
            javascript = {
                inlayHints = {
                    insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
                }
            }
        }
    },
    {
        'MunifTanjim/prettier.nvim',
        config = function()
            require('prettier').setup({
                bin = 'prettierd',
                cli_options = {
                    config_precedence = "prefer-file"
                }
            })
        end,
        requires = {
            'jay-babu/mason-null-ls.nvim',
            'neovim/nvim-lspconfig',
            'jose-elias-alvarez/null-ls.nvim',
        },
    },
    {
        'dmmulroy/tsc.nvim',
        cmd = { 'TSC' },
        opts = {},
    }
}
