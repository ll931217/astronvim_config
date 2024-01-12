return {
  dartls = function(_, opts) require('flutter-tools').setup { lsp = opts } end,
  tsserver = function(_, opts) require('typescript').setup { server = opts } end,
}
