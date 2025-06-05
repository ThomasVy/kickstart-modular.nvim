return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    opts = {
      mappings = {
        -- Use tab for completion
        complete = {
          insert = "", -- Explicitly set an empty string. It lets regular copilot plugin overrides CopilotChat.nvim
        },
        reset = {
          normal = "<C-x>",
          insert = "<C-x>",
        },
      },
    },
  },
  {
    'tpope/vim-fugitive',
  },
}
