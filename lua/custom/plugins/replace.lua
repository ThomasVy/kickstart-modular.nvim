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

      vim.keymap.set('v', '<leader>sl', function()
        local highlighted_text = vim.inspect(vim.api.nvim_get_hl(0, { name = 'Normal' }))
        require('grug-far').open({
          prefills = {
            search = highlighted_text,
            paths = vim.fn.expand("%"),
          }
        }
        )
      end, { desc = '[S]earch and replace [L]ocally' })

      vim.keymap.set('n', '<leader>sl', function()
        require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } })
      end, { desc = '[S]earch and replace [L]ocally' })
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
