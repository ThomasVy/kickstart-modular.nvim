local setup = function()
    -- Autoformatting Setup
    local conform = require 'conform'
    conform.setup {
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
            json = { 'prettier' },

            cpp = { 'clangd' },
            c = { 'clangd' },
        },
    }

    conform.formatters.injected = {
        options = {
            ignore_errors = false,
            lang_to_formatters = {
                sql = { 'sleek' },
            },
        },
    }


    vim.keymap.set('n', '<leader>f', function()
        conform.format { async = true, lsp_format = 'fallback' }
    end, { desc = '[F]ormat Buffer' })

    -- disable allow autoformatting on save if environment variable is set
    if vim.env.DONT_AUTOFORMAT_ON_SAVE then
        return
    end

    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('custom-conform', { clear = true }),
        callback = function(args)
            require('conform').format {
                bufnr = args.buf,
                lsp_fallback = true,
                quiet = true,
            }
        end,
    })
end

setup()

return { setup = setup }
