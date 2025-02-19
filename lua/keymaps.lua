-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>z', '<cmd>LspRestart<cr>', { desc = 'Restarts LSP' })
vim.keymap.set('n', '<leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })
vim.keymap.set('n', '<leader>sl', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]earch and replace [L]ocally' })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>l', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss noice' })
vim.keymap.set('n', '<leader>L', '<cmd>Telescope noice<CR>', { desc = 'Open noice message' })
vim.keymap.set('x', 'p', [["_dP]])
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>i', function()
    vim.diagnostic.open_float()
end, { desc = 'Open diagnostic floating' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set({ 'n', 'v', 'o' }, 'L', '$')
vim.keymap.set({ 'n', 'v', 'o' }, 'H', '^')

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
-- Does another search and replace on the word you just replaced --
vim.keymap.set('n', 'g.', '/\\V\\C<C-r>"<CR>cgn<C-a><Esc>')

-- Adds line down
vim.keymap.set('n', 'gj', 'o<Esc>')
vim.keymap.set('n', 'gk', 'O<Esc>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Quickfix list
vim.keymap.set('n', '<M-j>', '<CMD>cnext<CR>', { desc = 'Go to the next item in the quickfix list' })
vim.keymap.set('n', '<M-k>', '<CMD>cprev<CR>', { desc = 'Go to the previous item in the quickfix list' })
vim.keymap.set('n', '<M-c>', '<CMD>cclose<CR>', { desc = 'Close the quickfix list' })
vim.keymap.set('n', '<M-o>', '<CMD>copen<CR>', { desc = 'Open the quickfix list' })

-- These mappings control the size of splits (height/width)
vim.keymap.set('n', '<M-,>', '<c-w>5<')
vim.keymap.set('n', '<M-.>', '<c-w>5>')
vim.keymap.set('n', '<M-t>', '<C-W>+')
vim.keymap.set('n', '<M-s>', '<C-W>-')

-- Split window
vim.keymap.set('n', '<M-x>', ':vsplit<CR>', { desc = 'Split Screen [V]ertically' })
vim.keymap.set('n', '<M-q>', ':close<CR>', {desc = 'Close Buffer'})
-- format
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat Buffer'})
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

