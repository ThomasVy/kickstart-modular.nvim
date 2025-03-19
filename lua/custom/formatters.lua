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
    local notify = require("notify")

    local function show_notification(message)
        notify(message, "info", { title = "conform.nvim" })
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
        local is_global = not args.bang
        if is_global then
            vim.g.disable_autoformat = not vim.g.disable_autoformat
            if vim.g.disable_autoformat then
                show_notification("Autoformat-on-save disabled globally")
            else
                show_notification("Autoformat-on-save enabled globally")
            end
        else
            vim.b.disable_autoformat = not vim.b.disable_autoformat
            if vim.b.disable_autoformat then
                show_notification("Autoformat-on-save disabled for this buffer")
            else
                show_notification("Autoformat-on-save enabled for this buffer")
            end
        end
    end, {
        desc = "Toggle autoformat-on-save",
        bang = true,
    })

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
            c = { "clang-format" },
            cpp = { "clang-format" },
            hcl = { "packer_fmt" },
            terraform = { "terraform_fmt" },
            tf = { "terraform_fmt" },
            ["terraform-vars"] = { "terraform_fmt" },
            dockerfile = { "hadolint" }
        },

        format_after_save = function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return
            {
                async = true,
                lsp_format = 'fallback',
            }
        end
        ,
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
