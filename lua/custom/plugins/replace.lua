return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    init = function()
      vim.keymap.set('n', '<leader>sr', '<cmd>GrugFar<cr>', { desc = '[S]earch and [R]eplace', silent = true })
    end,
    opts = {},
  },
}
