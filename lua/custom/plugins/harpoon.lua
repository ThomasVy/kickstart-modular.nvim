return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup()

        vim.keymap.set('n', '<leader>ja', function()
            harpoon:list():add()
        end, { desc = 'Harpoon [A]dd' })
        vim.keymap.set('n', '<leader>jl', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Harpoon [L]ist' })

        -- Set <space>1..<space>5 be my shortcuts to moving to the files
        for _, idx in ipairs { 1, 2, 3, 4, 5 } do
            vim.keymap.set('n', string.format('<space>j%d', idx), function()
                harpoon:list():select(idx)
            end, { desc = string.format('Harpoon  [%d]', idx) })
        end
    end,
}
