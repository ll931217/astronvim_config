return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = { 'lua' },
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,
      autotag = {
        enable = true
      }
    })
  end,
}
