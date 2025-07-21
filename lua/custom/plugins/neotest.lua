return {
  -- "nvim-neotest/neotest",
  -- dependencies = {
  --   "nvim-neotest/nvim-nio",
  --   "nvim-lua/plenary.nvim",
  --   "antoinemadec/FixCursorHold.nvim",
  --   "nvim-treesitter/nvim-treesitter",
  --
  --
  --   "nvim-neotest/neotest-vim-test",
  --   "vim-test/vim-test"
  -- },
  -- config = function()
  --   require("neotest").setup({
  --     adapters = {
  --       require("neotest-vim-test")({ allow_file_types = { "haskell", "elixir" } }),
  --     }
  --   })
  -- end,
  'vim-test/vim-test',
  dependencies = {
    'tpope/vim-dispatch', -- Recommended for async execution
  },
  config = function()
    -- vim-test configuration (example)
    vim.g['test#framework'] = 'google_test' -- Or 'google_test', 'ctest', 'pytest', etc.
    vim.g['test#neovim_only'] = 1
    vim.g['test#cpp#google_test#make_command'] = 'cl'

    -- Keybindings (example)
    vim.api.nvim_set_keymap('n', '<leader>tn', ':TestNearest<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ts', ':TestSuite<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ts', ':TestVisit<CR>', { noremap = true, silent = true })
  end,
}
