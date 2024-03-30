return {
  {
    'ahmedkhalf/project.nvim',
    config = function() require('user.configs.project') end,
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function() require('nvim-surround').setup() end,
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'VeryLazy',
    config = function() require('nvim-ts-autotag').setup() end,
  },
  -- Remembers the last location the cursor was located in file
  {
    'vladdoster/remember.nvim',
    lazy = false,
    config = function()
      require('remember').setup({
        open_folds = true,
      })
    end,
  },
  {
    'phaazon/hop.nvim',
    lazy = false,
    branch = 'v2',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  { 'nvim-telescope/telescope-hop.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    config = function() require('user.configs.telescope') end,
  },
  {
    'aserowy/tmux.nvim',
    event = 'VeryLazy',
    config = function()
      require('tmux').setup()
    end,
  },
  {
    "https://git.sr.ht/~swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left"  } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
      { "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
    },
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>bf',
        function()
          require('conform').format({ async = true, lsp_fallback = true })
        end,
        mode = '',
        desc = 'Format buffer',
      }
    },
    config = function()
      require 'user.configs.conform'
    end,
  },
}
