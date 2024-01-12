local utils = require "astronvim.utils"

return {
  'nvim-treesitter/nvim-treesitter',
  opts = function(_, opts)
    opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
      'json',
      'jsonc',
      'javascript',
      'typescript',
      'tsx'
    })
  end,
  -- config = function()
  --   require('nvim-treesitter.configs').setup({
  --     auto_install = true,
  --     autotag = {
  --       enable = true
  --     },
  --   })
  -- end,
}
