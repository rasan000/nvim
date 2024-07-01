return {

    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = { 'node_modules', '.git' }
                },
                sorting_strategy = 'ascending',
                winblend = 4,
                layout_strategy = 'vertical',
                layout_config = {
                    height = 0.9,
                    prompt_position = 'top'
                },
                extensions = {
                    coc = {
                        prefer_locations = false,
                    }
                }
            })
            vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>Telescope live_grep <CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>tb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>th', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
        end
    },
    {
        'nvim-telescope/telescope-frecency.nvim',
        config = function()
            require('telescope').load_extension 'frecency'
        end,
    },
    {
        'fannheyward/telescope-coc.nvim',
        config = function()
            require('telescope').load_extension 'coc'
            vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>Telescope coc type_definitions<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>Telescope coc diagnostics<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>Telescope.frecency<CR>', { noremap = true, silent = true })
        end,
    },
    {
        'BurntSushi/ripgrep',
    },
}
