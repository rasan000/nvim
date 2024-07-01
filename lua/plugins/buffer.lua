return {

    --barbar
    {
        'romgrk/barbar.nvim',
        config = function()
            require('barbar').setup({
                -- ちらつき防止
                auto_hide = true,
            })
            vim.api.nvim_set_keymap('n', '<leader>j', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>BufferNext<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>BufferRestore<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>w', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>q', '<Cmd>BufferCloseAllButCurrent<CR>', { noremap = true, silent = true })
        end
    },

}
