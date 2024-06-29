return {

    --barbar
    {
        'romgrk/barbar.nvim',
        config = function()
            require('barbar').setup({
                auto_hide = true,
            })
            vim.api.nvim_set_keymap('n', 'sj', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'sk', '<cmd>BufferNext<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'sr', '<cmd>BufferRestore<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>e', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>q', '<Cmd>BufferCloseAllButCurrent<CR>', { noremap = true, silent = true })

        end
    },

}
