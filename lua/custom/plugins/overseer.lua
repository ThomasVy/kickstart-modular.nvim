return {
  'stevearc/overseer.nvim',
  opts = {},
  keys = {
    { "<leader>ot", "<cmd>OverseerToggle<cr>",      desc = "Toggle Overseer" },
    { "<leader>or", "<cmd>OverseerRun<cr>",         desc = "Run Task" },
    { "<leader>ob", "<cmd>OverseerBuild<cr>",       desc = "Build Task" },
    { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" }
  },
  config = function()
    require("overseer").setup({
      templates = { "builtin", "user.cpp_build" },
    })
  end
}
