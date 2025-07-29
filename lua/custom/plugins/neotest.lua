return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",


    "nvim-neotest/neotest-vim-test",
    "alfaix/neotest-gtest"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-gtest").setup({

          is_test_file = function(file_path)
            local elems = vim.split(file_path, require("neotest.lib").files.sep, { plain = true })
            local filename = elems[#elems]
            if filename == "" then -- directory
              return false
            end
            local extsplit = vim.split(filename, ".", { plain = true })
            local extension = extsplit[#extsplit]
            local fname_last_part = extsplit[#extsplit - 1]
            local result = extension == "cpp"
                and (vim.startswith(filename, "test_") or vim.startswith(filename, "Test"))
            return result
          end,

        })
      }
    })
  end,
  keys = {
    {
      "<leader>tn",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Neotest",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run Neotest on Current File",
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Run debugger on nearest test",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Neotest Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Open Neotest Output",
    },
  }
}
