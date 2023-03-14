-- use mason-lspconfig to configure LSP installations
return { -- overrides `require("mason-lspconfig").setup(...)`
  -- ensure_installed = { 'sumneko_lua', 'dartls' },
  ensure_installed = { 'sumneko_lua' },
}
