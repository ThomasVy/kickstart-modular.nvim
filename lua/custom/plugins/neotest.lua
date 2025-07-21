return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "alfaix/neotest-gtest",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-gtest").setup({})
      }
    })
  end,
  keys = {
    { "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>",                     desc = "Run nearest test" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",   desc = "Run tests in file" },
    { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>",              desc = "Toggle test summary" },
    { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<CR>", desc = "Open test output" }
  }
}
