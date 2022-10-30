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

-- local lspconfig = require('lspconfig')
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     flags = {
--       debounce_text_changes = 150,
--     },
--     capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     on_attach = require('keymapping').on_attach,
--   }
-- end

require('mason-lspconfig').setup_handlers {
  function (server_name) -- default handler (optional)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = on_attach,
    }
  end,
}
