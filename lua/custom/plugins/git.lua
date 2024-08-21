return {

   {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    {
      'tpope/vim-fugitive',
      config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git Status Bar' })

        -- local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup('ThePrimeagen_Fugitive', {})
        --
        -- local autocmd = vim.api.nvim_create_autocmd
        -- autocmd('BufWinEnter', {
        --   group = ThePrimeagen_Fugitive,
        --   pattern = '*',
        --   callback = function()
        --     if vim.bo.ft ~= 'fugitive' then
        --       return
        --     end
        --
        --     local bufnr = vim.api.nvim_get_current_buf()
        --     vim.keymap.set('n', '<leader>gp', function()
        --       vim.cmd.Git 'push'
        --     end, { buffer = bufnr, remap = false, desc = 'Git push' })
        --
        --     -- rebase always
        --     vim.keymap.set('n', '<leader>gP', function()
        --       vim.cmd.Git { 'pull', '--rebase' }
        --     end, { buffer = bufnr, remap = false, desc = 'Git pull' })
        --
        --     -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        --     -- needed if i did not set the branch up correctly
        --     vim.keymap.set('n', '<leader>gt', ':Git push -u origin ', { buffer = bufnr, remap = false, desc = 'Git push upstream' })
        --   end,
        -- })

        vim.keymap.set('n', '<leader>gm', '<cmd>Gdiffsplit!<CR>', { desc = '3 way merge' })
        vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = 'Diff' })
        vim.keymap.set('n', '<leader>gh', '<cmd>diffget //2<CR>', { desc = 'Grab from left side' })
        vim.keymap.set('n', '<leader>gl', '<cmd>diffget //3<CR>', { desc = 'Grab from right side' })
        vim.keymap.set('n', '<leader>gp', '<cmd>diffput //1<CR>', { desc = 'Put both into 1' })
      end,
    },
  },
}
