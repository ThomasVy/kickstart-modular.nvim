return {
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require('oil').setup {
                default_file_explorer = true,
                delete_to_trash = false,
                skip_confirm_for_simple_edits = true,
                keymaps = {
                    ['g?'] = 'actions.show_help',
                    ['<CR>'] = 'actions.select',
                    ['<C-x>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
                    ['<C-h>'] = false,
                    ['<C-t>'] = false,
                    ['<C-p>'] = 'actions.preview',
                    ['<C-c>'] = 'actions.close',
                    ['<C-l>'] = false,
                    ['-'] = 'actions.parent',
                    ['_'] = 'actions.open_cwd',
                    ['`'] = 'actions.cd',
                    ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory', mode = 'n' },
                    ['gs'] = 'actions.change_sort',
                    ['gx'] = 'actions.open_external',
                    ['g.'] = 'actions.toggle_hidden',
                    ['g\\'] = 'actions.toggle_trash',
                },
            }
            vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
        end,
    },
}
