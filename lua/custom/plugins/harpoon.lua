return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup { settings = { save_on_toggle = true } }
        local harpoon_extensions = require 'harpoon.extensions'
        harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

        vim.keymap.set('n', '<M-e>', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Harpoo[N] [L]ist' })

        vim.keymap.set('n', '<leader>nc', function()
            harpoon:list():clear()
        end, { desc = 'Harpoo[N] [C]lear' })

        vim.keymap.set('n', '<leader>l', function()
            harpoon:list():next { ui_nav_wrap = true }
        end, { desc = 'Harpoon Next' })

        vim.keymap.set('n', '<leader>a', function()
            harpoon:list():add()
        end, { desc = 'Harpoon Add' })

        -- select
        vim.keymap.set('n', '<M-h>', function()
            harpoon:list():select(1)
        end, { desc = 'Harpoon 1' })
        vim.keymap.set('n', '<M-j>', function()
            harpoon:list():select(2)
        end, { desc = 'Harpoon 2' })
        vim.keymap.set('n', '<M-k>', function()
            harpoon:list():select(3)
        end, { desc = 'Harpoon 3' })
        vim.keymap.set('n', '<M-l>', function()
            harpoon:list():select(4)
        end, { desc = 'Harpoon 4' })

        --replace
        vim.keymap.set('n', '<leader>nra', function()
            harpoon:list():replace_at(1)
        end, { desc = 'Replace Harpoon 1' })
        vim.keymap.set('n', '<leader>nrs', function()
            harpoon:list():replace_at(2)
        end, { desc = 'Replace Harpoon 2' })
        vim.keymap.set('n', '<leader>nrd', function()
            harpoon:list():replace_at(3)
        end, { desc = 'Replace Harpoon 3' })
        vim.keymap.set('n', '<leader>nrf', function()
            harpoon:list():replace_at(4)
        end, { desc = 'Replace Harpoon 4' })
    end,
}
