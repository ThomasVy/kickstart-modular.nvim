return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup()

        vim.keymap.set('n', '<leader>ny', function()
            harpoon:list():add()
        end, { desc = 'Harpoo[N] Add' })
        vim.keymap.set('n', '<leader>nl', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Harpoo[N] [L]ist' })

        -- select
        vim.keymap.set('n', '<leader>na', function()
            harpoon:list():select(1)
        end, { desc = 'Harpoon 1' })
        vim.keymap.set('n', '<leader>ns', function()
            harpoon:list():select(2)
        end, { desc = 'Harpoon 2' })
        vim.keymap.set('n', '<leader>nd', function()
            harpoon:list():select(3)
        end, { desc = 'Harpoon 3' })
        vim.keymap.set('n', '<leader>nf', function()
            harpoon:list():select(4)
        end, { desc = 'Harpoon 4' })

        --replace
        vim.keymap.set('n', '<leader>nra', function()
            harpoon:list():select(1)
        end, { desc = 'Replace Harpoon 1' })
        vim.keymap.set('n', '<leader>nrs', function()
            harpoon:list():select(2)
        end, { desc = 'Replace Harpoon 2' })
        vim.keymap.set('n', '<leader>nrd', function()
            harpoon:list():select(3)
        end, { desc = 'Replace Harpoon 3' })
        vim.keymap.set('n', '<leader>nrf', function()
            harpoon:list():select(4)
        end, { desc = 'Replace Harpoon 4' })
    end,
}
