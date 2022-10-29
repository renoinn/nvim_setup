local map = vim.keymap

map.set('i', ',df', "<C-r>=strftime('%Y-%m-%d %H:%M:%S')<Return>")

map.set('n', '<c-w><c-t>', '<cmd>NeoTreeShow<cr>')
map.set('n', '<c-w><c-g>', '<cmd>NeoTreeFloatToggle git_status<cr>')
map.set('n', 'j', 'gj')
map.set('n', 'k', 'gk')
map.set('n', '<c-l>', '<c-w><c-l>')
map.set('n', '<c-k>', '<c-w><c-k>')
map.set('n', '<c-j>', '<c-w><c-j>')
map.set('n', '<c-h>', '<c-w><c-h>')
map.set('n', '<c-f>', 'gt<cr>')
map.set('n', '<c-b>', 'gT<cr>')
map.set('n', '<c-m>', '<c-v>') -- for windows
map.set('n', '<c-e>', '$')
map.set('n', '<c-a>', '0')

map.set('n', '<space>xx', '<cmd>TroubleToggle<cr>')
map.set('n', '<space>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
map.set('n', '<space>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
map.set('n', '<space>xq', '<cmd>TroubleToggle quickfix<cr>')
map.set('n', '<space>xl', '<cmd>TroubleToggle loclist<cr>')
map.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')

map.set('n', '<space>gh', '<cmd>Lspsaga lsp_finder<cr>')
map.set('n', '<space>ga', '<cmd>Lspsaga code_action<cr>')
map.set('n', '<space>gr', '<cmd>Lspsaga rename<cr>')
map.set('n', '<space>gs', '<cmd>Lspsaga show_line_diagnostics<cr>')
map.set('n', 'K', '<cmd>Lspsaga show_line_diagnostics<cr>')
map.set('n', 'J', '<cmd>Lspsaga signature_help<cr>')
map.set('n', 'H', '<cmd>Lspsaga preview_definition<cr>')

local builtin = require('telescope.builtin')
map.set('n', 'ff', builtin.find_files, {})
map.set('n', 'fg', builtin.live_grep, {})
map.set('n', 'fb', builtin.buffers, {})
map.set('n', 'fh', builtin.help_tags, {})

local M = {}

function M.on_attach (client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

return M
