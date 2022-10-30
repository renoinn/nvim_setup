local servers = {
  'tsserver',
  'eslint',
  'gopls',
  'jsonls',
  'sumneko_lua',
  'yamlls',
}

require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = servers,
})

require('mason-lspconfig').setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = require('keymapping').on_attach,
    }
  end,
}
