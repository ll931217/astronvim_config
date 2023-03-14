return {
  -- You can disable default plugins as follows:
  -- ["Darazaki/indent-o-matic"] = { disable = true },

  -- Flutter
  {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    after = 'mason-lspconfig.nvim',
    config = function()
      require('flutter-tools').setup{
        ui = {
          notification_style = 'plugin'
        },
        lsp = astronvim.lsp.server_settings('dartls'),
      }
    end,
  },

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
    tag = "*",
    config = function() require("nvim-surround").setup() end,
  },
  -- Remembers the last location the cursor was located in file
  {
    "vladdoster/remember.nvim",
    config = function()
      require("remember").setup({
        open_folds = true,
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end
  },
  { "nvim-telescope/telescope-hop.nvim" },

  -- Debugging
  {
    "mxsdev/nvim-dap-vscode-js",
    requires = {"mfussenegger/nvim-dap"}
  },
  {
    'microsoft/vscode-js-debug',
    opt = true,
    run = 'npm install --legacy-peer-deps && npm run compile' ,
  },
  {
    "mfussenegger/nvim-dap",
    opt = true,
    module = "dap",
    requires = {
      -- "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      -- "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      -- { "leoluz/nvim-dap-go", module = "dap-go" },
      -- { "jbyuki/one-small-step-for-vimkind", module = "osv" },
      { "mxsdev/nvim-dap-vscode-js" },
      {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npm run compile",
      },
    },
    config = function()
      require "configs.dap"
    end,
    disable = vim.fn.has "win32" == 1,
  },
}
