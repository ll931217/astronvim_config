--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Set colorscheme to use
  -- colorscheme = "default_theme",
  colorscheme = "catppuccin-mocha",

  -- Override highlight groups in any theme
  -- highlights = {
  --   -- duskfox = { -- a table of overrides/changes to the default
  --   --   Normal = { bg = "#000000" },
  --   -- },
  --   default_theme = function(highlights) -- or a function that returns a new table of colors to set
  --     local C = require "default_theme.colors"
  --
  --     highlights.Normal = { fg = C.fg, bg = C.bg }
  --     return highlights
  --   end,
  -- },


  ["neo-tree"] = {
      window = {
          mappings = {
              ["space"] = false,
          }
      }
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },
}

require('user.neovide')
vim.opt.conceallevel = 2

-- Autocmd to set pwd as the opened folder dir
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Set working directory as the opened directory',
  group = vim.api.nvim_create_augroup('cdpwd', { clear = true }),
  command = 'cd $PWD',
})

return config
