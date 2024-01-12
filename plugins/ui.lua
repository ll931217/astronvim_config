local function on_file_remove(args)
    local ts_clients = vim.lsp.get_active_clients { name = "tsserver" }
    for _, ts_client in ipairs(ts_clients) do
        ts_client.request("workspace/executeCommand", {
            command = "_typescript.applyRenameFile",
            arguments = {
                {
                    sourceUri = vim.uri_from_fname(args.source),
                    targetUri = vim.uri_from_fname(args.destination),
                }
            }
        })
    end
end

require('notify').setup({
    background_colour = '#000000',
})

return {
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    { "LudoPinelli/comment-box.nvim", event = "VeryLazy" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function() require("user.configs.noice") end
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        opts = function(_, opts)
            local events = require 'neo-tree.events'
            opts.event_handlers = {
                {
                    event = events.FILE_MOVED,
                    handler = on_file_remove
                },
                {
                    event = events.FILE_RENAMED,
                    handler = on_file_remove
                }
            }
        end
    },
    {
        "catppuccin/nvim",
        lazy = false,
        as = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavor = "macchiato",
                background = {
                    light = "latte",
                    dark = "macchiato",
                },
                transparent_background = true,
                integrations = {
                    treesitter = true,
                    nvimtree = true,
                    gitsigns = true,
                    notify = true,
                    mason = true,
                    neotree = true,
                    dap = {
                        enabled = true,
                        enable_ui = true,
                    },
                    telescope = {
                        enabled = true,
                        style = "nvchad",
                    }
                }
            })
        end,
    },
    { 'tpope/vim-abolish' },
}
