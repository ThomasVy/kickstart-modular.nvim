return {
  -- lazy.nvim
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup { presets = { inc_rename = true } }
    end,
  },
  -- {
  --   'stevearc/dressing.nvim',
  --   opts = {},
  --   config = function()
  --     require('dressing').setup { input = {
  --       override = function(conf)
  --         conf.col = -1
  --         conf.row = 0
  --         return conf
  --       end,
  --     } }
  --   end,
  -- },
}
