return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup { settings = { save_on_toggle = true } }
        local harpoon_extensions = require 'harpoon.extensions'
        harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

        vim.keymap.set('n', '<M-e>', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Harpoo[N] [L]ist' })

        -- vim.keymap.set('n', '<leader>nc', function()
        --     harpoon:list():clear()
        -- end, { desc = 'Harpoo[N] [C]lear' })

        -- vim.keymap.set('n', '<leader>l', function()
        --     harpoon:list():next { ui_nav_wrap = true }
        -- end, { desc = 'Harpoon Next' })

        vim.keymap.set('n', '<leader>a', function()
            harpoon:list():add()
        end, { desc = 'Harpoon Add' })

        -- select
        vim.keymap.set('n', '<M-a>', function()
            harpoon:list():select(1)
        end, { desc = 'Harpoon 1' })
        vim.keymap.set('n', '<M-s>', function()
            harpoon:list():select(2)
        end, { desc = 'Harpoon 2' })
        vim.keymap.set('n', '<M-d>', function()
            harpoon:list():select(3)
        end, { desc = 'Harpoon 3' })
        vim.keymap.set('n', '<M-f>', function()
            harpoon:list():select(4)
        end, { desc = 'Harpoon 4' })

        function Harpoon_files()
            local contents = {}
            local marks_length = harpoon:list():length()
            local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
            for index = 1, marks_length do
                local harpoon_file_path = harpoon:list():get(index).value
                local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ':t')

                if current_file_path == harpoon_file_path then
                    contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, file_name)
                else
                    contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index,
                        file_name)
                end
            end

            return table.concat(contents)
        end

        vim.opt.showtabline = 2
        vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "User" }, {
            callback = function(ev)
                vim.o.tabline = Harpoon_files()
            end
        })
        --
        -- --replace
        -- vim.keymap.set('n', '<leader>nra', function()
        --     harpoon:list():replace_at(1)
        -- end, { desc = 'Replace Harpoon 1' })
        -- vim.keymap.set('n', '<leader>nrs', function()
        --     harpoon:list():replace_at(2)
        -- end, { desc = 'Replace Harpoon 2' })
        -- vim.keymap.set('n', '<leader>nrd', function()
        --     harpoon:list():replace_at(3)
        -- end, { desc = 'Replace Harpoon 3' })
        -- vim.keymap.set('n', '<leader>nrf', function()
        --     harpoon:list():replace_at(4)
        -- end, { desc = 'Replace Harpoon 4' })
    end,
}
