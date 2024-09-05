return {
    {
        'jiaoshijie/undotree',
        opts = {
            position = 'right',
        },
        keys = { -- load the plugin only when using it's keybinding:
            { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", 'Toggle Undo Tree' },
        },
    },
}
