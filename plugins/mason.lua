return {
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            -- ensure_installed = { 'sumneko_lua' },
        },
    },
    {
        'jay-babu/mason-null-ls.nvim',
        opts = {
            ensure_installed = { 'eslint' },
        }
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        opts = {},
    }
}
