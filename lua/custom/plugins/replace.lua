return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    init = function()
      vim.keymap.set('n', '<leader>sr', '<cmd>GrugFar<cr>', { desc = '[S]earch and [R]eplace', silent = true })
      vim.keymap.set('v', '<leader>sr', function()
        require('grug-far').open({ prefills = { search = vim.inspect(vim.api.nvim_get_hl(0, { name = 'Normal' })) } })
      end, { desc = '[S]earch and [R]eplace', silent = true })

      vim.keymap.set('v', '<leader>sl', function()
        require('grug-far').open({ prefills = { search = vim.inspect(vim.api.nvim_get_hl(0, { name = 'Normal' })), paths = vim.fn.expand("%") } })
      end, { desc = '[S]earch and replace [L]ocally' })

      vim.keymap.set('n', '<leader>sl', function()
        require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } })
      end, { desc = '[S]earch and replace [L]ocally' })

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('my-grug-far-custom-keybinds', { clear = true }),
        pattern = { 'grug-far' },
        callback = function()
          vim.keymap.set('n', '<localleader>z', function()
            local state = unpack(require('grug-far').get_instance(0):toggle_flags({ '--fixed-strings' }))
            vim.notify('grug-far: toggled --fixed-strings ' .. (state and 'ON' or 'OFF'))
          end, { buffer = true })
        end,
      })
    end,
    opts = {},
  },
}
