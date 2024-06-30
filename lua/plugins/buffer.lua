return {

    --barbar
    {
        'romgrk/barbar.nvim',
        config = function()
            require('barbar').setup({
                -- ちらつき防止
                auto_hide = true,
            })
            vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>BufferNext<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>BufferRestore<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-w>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-q>', '<Cmd>BufferCloseAllButCurrent<CR>', { noremap = true, silent = true })
        end
    },

}
