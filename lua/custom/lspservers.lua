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
                vim.keymap.set('n', '<M-o>', '<Cmd>LspClangdSwitchSourceHeader<CR>', { silent = true }),
            },
            clangd = {
                fallbackFlags = {
                    '-std=c++23'
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
    tailwindcss = {},
    -- delve = {},
    pyright = {},
    -- rust_analyzer = {} Don't install!! Install the rust-analyzer via
    -- rustup add component rust-analyzer
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`tsserver`) will work just fine
    powershell_es = {
        filetypes = { 'ps1' },
        settings = {
            on_attach = function(client, bufnr)
                -- Enable capabilities like completion, hover, etc.
                -- You may have additional keymaps defined in your general on_attach function
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                -- other on_attach functions here (e.g., keymaps)
            end


        }


    },

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
