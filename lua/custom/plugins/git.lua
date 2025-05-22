return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    opts = {
      mappings = {
        -- complete = {
        --   detail = "Use @<Tab> or /<Tab> for options.",
        --   insert = "<C-Space>"
        -- }
      },
    },
  },
  {
    'tpope/vim-fugitive',
  },
}
