local map = vim.keymap

map.set('i', ',df', "<C-r>=strftime('%Y-%m-%d %H:%M:%S')<Return>")

map.set('n', '<c-w><c-t>', '<cmd>NeoTreeFocusToggle<cr>')
map.set('n', '<c-w><c-b>', '<cmd>NeoTreeFloatToggle buffers<cr>')
map.set('n', '<c-w><c-g>', '<cmd>NeoTreeFloatToggle git_status<cr>')
map.set('n', 'j', 'gj')
map.set('n', 'k', 'gk')
map.set('n', '<c-l>', '<c-w><c-l>')
map.set('n', '<c-k>', '<c-w><c-k>')
map.set('n', '<c-j>', '<c-w><c-j>')
map.set('n', '<c-h>', '<c-w><c-h>')
--map.set('n', '<c-f>', 'gt<cr>')
--map.set('n', '<c-b>', 'gT<cr>')
map.set('n', '<c-m>', '<c-v>') -- for windows
map.set('n', '<c-e>', '$')
map.set('n', '<c-a>', '0')

-- buffer
map.set('n', '<c-f>', '<cmd>bnext<cr>')
map.set('n', '<c-b>', '<cmd>bprevious<cr>')
map.set('n', '<c-w><c-d>', '<cmd>bd %<cr><cmd>bd#<cr>')

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

-- attach keymap for lsp loaded
function M.on_attach(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
end

return M
