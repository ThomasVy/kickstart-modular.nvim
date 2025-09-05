return {
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = {
            "giuxtaposition/blink-cmp-copilot",
            {
                'L3MON4D3/LuaSnip',
                version = 'v2.*',
                build = (function()
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
                config = function()
                    require('custom.snippets_config')
                end,
            }
        },

        opts = {
            keymap = {
                preset = 'default',
                ['<C-e>'] = { function(cmp) cmp.show() end },
            },
            snippets = { preset = "luasnip" },
            appearance = {
                nerd_font_variant = 'mono',
                kind_icons = {
                    Copilot = "",
                    Text = '󰉿',
                    Method = '󰊕',
                    Function = '󰊕',
                    Constructor = '󰒓',
                    Field = '󰜢',
                    Variable = '󰆦',
                    Property = '󰖷',
                    Class = '󱡠',
                    Interface = '󱡠',
                    Struct = '󱡠',
                    Module = '󰅩',
                    Unit = '󰪚',
                    Value = '󰦨',
                    Enum = '󰦨',
                    EnumMember = '󰦨',
                    Keyword = '󰻾',
                    Constant = '󰏿',
                    Snippet = '󱄽',
                    Color = '󰏘',
                    File = '󰈔',
                    Reference = '󰬲',
                    Folder = '󰉋',
                    Event = '󱐋',
                    Operator = '󰪚',
                    TypeParameter = '󰬛',
                },
            },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets' },
                providers = {
                },
            },
            cmdline = {
                completion = { menu = { auto_show = true } }
            },
            fuzzy = { implementation = 'lua' },
            signature = { enabled = true },
        },
        opts_extend = { 'sources.default' },
    },
}
