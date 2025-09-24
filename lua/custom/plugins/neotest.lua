return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "orjangj/neotest-ctest",
  },
  config = function()
    -- Optional, but recommended, if you have enabled neotest's diagnostic option
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          -- Convert newlines, tabs and whitespaces into a single whitespace
          -- for improved virtual text readability
          local message = diagnostic.message:gsub("[\r\n\t%s]+", " ")
          return message
        end,
      },
    }, neotest_ns)

    require("neotest").setup({
      adapters = {
        -- Load with default config
        require("neotest-ctest").setup({
          is_test_file = function(file)
            -- by default, returns true if the file stem ends with _test and the file extension is
            -- one of cpp/cc/cxx.

            return file:match("test") and file:match("%.cpp$") or file:match("%.cc$") or file:match("%.cxx$")
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
