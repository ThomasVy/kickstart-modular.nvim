return {
    -- lazy.nvim
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            'MunifTanjim/nui.nvim',
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            'rcarriga/nvim-notify',
        },
        opts = {
            messages = { view = 'mini', view_warn = 'mini' },
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
                    ['vim.lsp.util.stylize_markdown'] = false,
                    ['cmp.entry.get_documentation'] = false,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = true,
            },
            routes = {
                {
                    filter = {
                        event = 'msg_show',
                        kind = '',
                        find = 'written',
                    },
                    opts = { skip = true },
                },
                { filter = { event = 'notify', find = 'No information available' }, opts = { skip = true } },
            },
        },
    },
    -- {
    --   'stevearc/dressing.nvim',
    --   opts = {},
    --   config = function()
    --     require('dressing').setup { input = {
    --       override = function(conf)
    --         conf.col = -1
    --         conf.row = 0
    --         return conf
    --       end,
    --     } }
    --   end,
    -- },
}
