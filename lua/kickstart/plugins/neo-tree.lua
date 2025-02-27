-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require('neo-tree').setup {
                event_handlers = {
                    -- {
                    --     event = 'file_open_requested',
                    --     handler = function()
                    --         -- auto close
                    --         -- vim.cmd("Neotree close")
                    --         -- OR
                    --         require('neo-tree.command').execute { action = 'close' }
                    --     end,
                    -- },
                },
                close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
                filesystem = {
                    filtered_items = {
                        visible = false,
                        hide_dotfiles = false,
                        hide_hidden = false,
                        hide_by_name = require('custom.hiddenfolders').hiddenfolders,
                    },
                    follow_current_file = {
                        enabled = false, -- This will find and focus the file in the active buffer every time
                        --               -- the current file is changed while the tree is open.
                        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                    },
                    hijack_netrw_behavior = 'disabled',
                },
                buffers = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    },
                },
            }
            vim.keymap.set('n', '\\', '<Cmd>Neotree toggle<CR>', { desc = 'Neotree toggle' })
        end,
    },
}
