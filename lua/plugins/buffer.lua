return {

    --barbar
    {
        'romgrk/barbar.nvim',
        config = function()
            require('barbar').setup({
                -- ちらつき防止
                auto_hide = true,
            })
            vim.api.nvim_set_keymap('n', 'sn', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'sp', '<cmd>BufferNext<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'sr', '<cmd>BufferRestore<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>e', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>o', '<Cmd>BufferCloseAllButCurrent<CR>', { noremap = true, silent = true })
        end
    },

}
