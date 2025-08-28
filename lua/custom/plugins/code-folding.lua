return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  keys = {
    { "zR", function() require("ufo").openAllFolds() end,               desc = "Open all folds" },
    { "zM", function() require("ufo").closeAllFolds() end,              desc = "Close all folds" },
    { "zr", function() require("ufo").openFoldsExceptKinds() end,       desc = "Open folds except kinds" },
    { "zm", function() require("ufo").closeFoldsWith() end,             desc = "Close folds with" },
    { "zK", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek folded lines under cursor" },
  },
  config = function()
    local ufo = require("ufo")
    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
    })
    vim.o.foldlevel = 99
    vim.o.foldcolumn = "1"
    vim.o.foldcolumn = 'auto:9'
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  end,
}
