return function()
  require('mason').setup({
    ensure_installed = {
      'tsserver',
      'eslint-lsp',
      'gopls',
      'json-lsp',
      'lua-language-server',
      'yaml-language-server',
    },
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      }
    }
  })
end
