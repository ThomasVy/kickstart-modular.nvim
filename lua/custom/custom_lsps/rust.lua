return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    ft = { 'rust' },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          --   "n",
          -- vim.keymap.set(
          --   "<leader>ca",
          --   function()
          --     vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
          --     -- or vim.lsp.buf.codeAction() if you don't want grouping.
          --   end,
          --   { silent = true, buffer = bufnr }
          -- )
          vim.keymap.set(
            "n",
            "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
            function()
              vim.cmd.RustLsp({ 'hover', 'actions' })
            end,
            { silent = true, buffer = bufnr }
          )
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Add clippy lints for Rust if using rust-analyzer
            checkOnSave = true,
            -- Enable diagnostics if using rust-analyzer
            diagnostics = {
              enable = true
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
            files = {
              excludeDirs = {
                ".direnv",
                ".git",
                ".github",
                ".gitlab",
                "bin",
                "node_modules",
                "target",
                "venv",
                ".venv",
              },
            },
          },
        },
      }
    },

    config = function(_, opts)
      local mason_registry = require('mason-registry')
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"

      local liblldb_path = extension_path .. 'lldb/lib/liblldb'
      local this_os = vim.uv.os_uname().sysname;

      -- The path is different on Windows
      if this_os:find "Windows" then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
      else
        -- The liblldb extension is .so for Linux and .dylib for MacOS
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end

      local cfg = require('rustaceanvim.config')
      opts.dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      }
    end
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
}
