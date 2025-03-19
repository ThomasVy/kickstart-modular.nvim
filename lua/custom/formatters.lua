local setup = function(ensured_installed)
    vim.list_extend(ensured_installed, {
        'stylua', -- Used to format Lua code
        'emmet-language-server',
        'tailwindcss-language-server',
        'prettier',
        'fixjson',
        'hadolint'
        -- 'clangd',
        -- 'isort',
        -- 'black',
        -- 'npm-groovy-lint',
        -- 'cmakelang',
    })
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
            json = { 'fixjson' },
            c = { "clang_format" },
            cpp = { "clang_format" },
            hcl = { "packer_fmt" },
            terraform = { "terraform_fmt" },
            tf = { "terraform_fmt" },
            ["terraform-vars"] = { "terraform_fmt" },
            dockerfile = { "hadolint" }
        },
        -- format_on_save = {
        --     -- enable only if environment variable is set
        --     enabled = not vim.env.DONT_AUTOFORMAT_ON_SAVE,
        --     lsp_format = 'fallback',
        --     timeout_ms = 500,
        -- },
        format_after_save = {
            enabled = not vim.env.DONT_AUTOFORMAT_AFTER_SAVE,
            async = true,
            lsp_format = 'fallback',
        },
        formatters = {
            isort = {
                command = 'isort',
                args = {
                    '-',
                },
            },
            clang_format = {
                command = 'clang-format',
                args = {
                    "--style=file",
                    '--fallback-style=Webkit'
                },
            },
        },
        notify_on_error = true,
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
end

return { setup = setup }
