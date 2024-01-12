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
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      mappings = {}, -- Disable default mappings
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
        {
          name = "tutorial",
          path = "~/vaults/tutorial",
        },
      },

      -- see below for full list of options 👇
    },
  }
}
