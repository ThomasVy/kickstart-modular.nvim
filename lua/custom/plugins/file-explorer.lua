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
                    {
                        event = 'file_open_requested',
                        handler = function()
                            -- auto close
                            -- vim.cmd("Neotree close")
                            -- OR
                            require('neo-tree.command').execute { action = 'close' }
                        end,
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = false,
                        hide_dotfiles = false,
                        hide_by_name = {
                            'node_modules',
                        },
                    },
                    follow_current_file = {
                        enabled = true, -- This will find and focus the file in the active buffer every time
                        --               -- the current file is changed while the tree is open.
                        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                    },
                },
                buffers = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    },
                },
            }
            vim.keymap.set('n', '-', '<Cmd>Neotree toggle<CR>', { desc = 'Neotree toggle' })
        end,
    },
    -- {
    --     'stevearc/oil.nvim',
    --     opts = {},
    --     -- Optional dependencies
    --     -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    --     dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
    --
    --     config = function()
    --         local oil = require 'oil'
    --         oil.setup {
    --             default_file_explorer = false,
    --             prompt_save_on_select_new_entry = true,
    --             delete_to_trash = false,
    --             skip_confirm_for_simple_edits = true,
    --             lsp_file_methods = {
    --                 -- Time to wait for LSP file operations to complete before skipping
    --                 timeout_ms = 1000,
    --                 -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    --                 -- Set to "unmodified" to only save unmodified buffers
    --                 autosave_changes = true,
    --             },
    --             view_options = {
    --                 -- Show files and directories that start with "."
    --                 show_hidden = true,
    --                 -- This function defines what is considered a "hidden" file
    --                 is_hidden_file = function(name, bufnr)
    --                     return vim.startswith(name, '.')
    --                 end,
    --                 -- This function defines what will never be shown, even when `show_hidden` is set
    --                 is_always_hidden = function(name, bufnr)
    --                     return false
    --                 end,
    --                 -- Sort file names in a more intuitive order for humans. Is less performant,
    --                 -- so you may want to set to false if you work with large directories.
    --                 natural_order = true,
    --                 -- Sort file and directory names case insensitive
    --                 case_insensitive = false,
    --                 sort = {
    --                     -- sort order can be "asc" or "desc"
    --                     -- see :help oil-columns to see which columns are sortable
    --                     { 'type', 'asc' },
    --                     { 'name', 'asc' },
    --                 },
    --             },
    --         }
    --     end,
    -- },
}
