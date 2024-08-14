local lspconfig = require 'lspconfig'
lspconfig.clangd.setup {
  filetypes = { 'h', 'hpp', 'c', 'cpp', 'cuh', 'cu', 'objc', 'objcpp', 'proto' },
  capabilities = capabilities,
  settings = {
    on_attach = {
      vim.keymap.set('n', '<leader>o', '<Cmd>ClangdSwitchSourceHeader<CR>', { silent = true }),
    },
  },
}
