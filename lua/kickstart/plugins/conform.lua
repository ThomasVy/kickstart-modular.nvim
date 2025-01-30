return {
    { -- Autoformat
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                '<leader>f',
                function()
                    require('conform').format { async = true, lsp_fallback = true }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
            formatters_by_ft = {
                lua = { 'stylua' },
                -- Conform can also run multiple formatters sequentially
                python = { 'isort', 'black' },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                javascript = { 'prettierd', 'prettier', stop_after_first = true },
                groovy = { 'npm-groovy-lint' },
                go = { 'goimports', 'gofmt' },
                rust = { 'rustfmt', lsp_format = 'fallback' },
                cmake = { 'cmake_format' },

                cpp = { 'clangd' },
                c = { 'clangd' },
            },
        },
    },
}
-- vim: ts=2 sts=2 sw=2 et
