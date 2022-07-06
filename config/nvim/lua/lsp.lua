local nvim_lsp = require 'lspconfig'

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gp', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>fr', "<cmd>Telescope lsp_references<cr>", opts)
  vim.keymap.set('n', '<leader>fd', "<cmd>Telescope diagnostics<cr>", opts)
  vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
