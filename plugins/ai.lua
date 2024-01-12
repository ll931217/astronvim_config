return {
    {
        'jackMort/ChatGPT.nvim',
        commit = '2107f7037c775bf0b9bff9015eed68929fcf493e',
        event = 'VeryLazy',
        config = function()
            require('chatgpt').setup()
        end,
        requires = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        }
    },
    {
        'Exafunction/codeium.vim',
        lazy = false,
        config = function()
            vim.keymap.set('i', '<C-a>', function() return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end,
    },
    -- {
    --     "TabbyML/vim-tabby",
    --     event = 'VeryLazy',
    --     -- keys = { { "<Leader>at", desc = "Tabby" } },
    --     config = function()
    --         vim.g.tabby_trigger_mode = 'auto'
    --         vim.g.tabby_keybinding_accept = '<Tab>'
    --         vim.g.tabby_keybinding_trigger_or_dismiss = '<C-\\>'
    --         vim.call("tabby#OnVimEnter")
    --     end
    -- },
    {
        'David-Kunz/gen.nvim',
        lazy = false,
        opts = {
            model = "llama2",
            display_mode = "split",
        },
        config = function ()
            require('gen').prompts['Fix_Code'] = {
                prompt = "Fix the following code. Output the code below the selected code.",
                replace = false,
            }
        end
    },
    -- {
    --     'nomnivore/ollama.nvim',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'stevearc/dressing.nvim',
    --     },
    --     cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },
    --     keys = {
    --         {
    --             "<leader>aop",
    --             ":<c-u>lua require('ollama').prompt()<cr>",
    --             desc = "ollama prompt",
    --             mode = { "n", "x" },
    --             silent = true,
    --         },
    --         {
    --             "<leader>aoa",
    --             function() require('ollama-chat').prompt('Ask') end,
    --             desc = "ollama prompt Ask",
    --             mode = { "n" },
    --             silent = true,
    --         },
    --         {
    --             "<leader>aos",
    --             function() require('ollama-chat').prompt('Synonyms') end,
    --             desc = "ollama prompt Synonyms",
    --             mode = { "n", "v" },
    --             silent = true,
    --         },
    --         {
    --             "<leader>aod",
    --             function() require('ollama-chat').prompt('Define') end,
    --             desc = "ollama prompt Define",
    --             mode = { "n", "v" },
    --             silent = true,
    --         },
    --     },
    --     opts = {
    --         model = 'llama2',
    --         model_code = 'codellama',
    --         url = 'http://127.0.0.1:11434',
    --         serve = {
    --             on_start = false,
    --             command = 'ollama',
    --             args = {
    --                 'serve',
    --             },
    --             stop_command = 'pkill',
    --             stop_args = {
    --                 '-SIGTERM',
    --                 'ollama',
    --             }
    --         }
    --     }
    -- },
}
