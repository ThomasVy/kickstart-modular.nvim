--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
-- Enable the following language servers
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
-- Ensure the servers and tools above are installed
--  To check the current status of installed tools and/or manually install
--  other tools, you can run
--    :Mason
--
--  You can press `g?` for help in this menu.
require('custom.custom_lsps.rust')

local servers = {
    clangd = {
        filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
        settings = {
            on_attach = {
                vim.keymap.set('n', '<M-o>', '<Cmd>ClangdSwitchSourceHeader<CR>', { silent = true }),
            },
            clangd = {
                fallbackFlags = {
                    '-std=c++20'
                }
            }
        },
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm"
        },
    },
    dockerls = {},
    docker_compose_language_service = {},
    terraformls = {},
    -- gopls = {},
    pyright = {},
    -- rust_analyzer = {} Don't install!! Install the rust-analyzer via
    -- rustup add component rust-analyzer
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`tsserver`) will work just fine
    ts_ls = {
        init_options = {
            preferences = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
                importModuleSpecifierPreference = 'non-relative',
                importModuleSpecifierEnding = 'minimal',
            },
        },
    },
    html = {},
    cssls = {},
    codelldb = {},
    --

    lua_ls = {
        -- cmd = {...},
        -- filetypes = { ...},
        -- capabilities = {},
        settings = {
            Lua = {
                completion = {
                    callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
            },
        },
    },
}

return servers
