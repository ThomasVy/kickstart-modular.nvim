return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  config = function()
    local ufo = require("ufo")
    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    })
    vim.o.foldlevel = 99
  end,
}
