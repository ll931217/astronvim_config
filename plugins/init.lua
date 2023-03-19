return {
  -- You can disable default plugins as follows:
  -- ["Darazaki/indent-o-matic"] = { disable = true },

  -- Flutter
  { 'akinsho/flutter-tools.nvim' },

  -- FUN!!!
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function() require("catppuccin").setup() end,
  },
  {
    'jackMort/ChatGPT.nvim',
    config = function()
      require('chatgpt').setup({})
    end,
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    }
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- Utility tools
  {
    'ahmedkhalf/project.nvim',
    config = function() require('user.configs.project') end,
  },
  {
    "kylechui/nvim-surround",
    lazy = false,
    tag = "*",
    config = function() require("nvim-surround").setup() end,
  },
  -- Remembers the last location the cursor was located in file
  {
    "vladdoster/remember.nvim",
    lazy = false,
    config = function()
      require("remember").setup({
        open_folds = true,
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    lazy = false,
    branch = "v2",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end
  },
  { "nvim-telescope/telescope-hop.nvim" },
}
