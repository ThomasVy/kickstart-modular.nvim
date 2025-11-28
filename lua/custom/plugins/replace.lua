return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    init = function()
      vim.keymap.set('n', '<leader>sr', '<cmd>GrugFar<cr>', { desc = '[S]earch and [R]eplace', silent = true })
      vim.keymap.set('v', '<leader>sr', function()
        local highlighted_text = vim.inspect(vim.api.nvim_get_hl(0, { name = 'Normal' }))
        require('grug-far').open({
          prefills = {
            search = highlighted_text,
          }
        }
        )
      end, { desc = '[S]earch and [R]eplace', silent = true })
    end,
    opts = {
      engines = {
        ripgrep = {
          defaults = {
            flags = '--fixed-strings --smart-case'
          }
        }
      }
    },
  },
}
