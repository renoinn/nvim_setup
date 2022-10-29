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
  ensure_installed = {
    'tsserver',
    'eslint',
    'gopls',
    'jsonls',
    'sumneko_lua',
    'yamlls',
  },
})

require("lspconfig").tsserver.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").gopls.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").sumneko_lua.setup {}
require("lspconfig").yamlls.setup {}

--local on_attach_lsp = require('keymapping').on_attach,
require('mason-lspconfig').setup_handlers {
  function (server_name) -- default handler (optional)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = require('keymapping').on_attach,
    }
  end,
}
