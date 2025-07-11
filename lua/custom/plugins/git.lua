return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      {
        "github/copilot.vim"
      },
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
      model = 'claude-sonnet-4',
      auto_insert_mode = false,
      context = 'buffer'
    },
  },
  {
    'tpope/vim-fugitive',
  },
}
