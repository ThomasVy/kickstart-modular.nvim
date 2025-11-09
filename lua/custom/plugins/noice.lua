return {
    -- lazy.nvim
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            'MunifTanjim/nui.nvim',
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
            signature = {
                enabled = true,
                auto_open = {
                    enabled = false,
                    trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                    luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                    throttle = 50,  -- Debounce lsp signature help request by 50ms
                },
                view = nil,         -- when nil, use defaults from documentation
                ---@type NoiceViewOptions
                opts = {},          -- merged with defaults from documentation
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
}
