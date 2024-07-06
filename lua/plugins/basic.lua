return {
    -- surround
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup({})
        end
    },

    --comment
    {
        'echasnovski/mini.comment',
        config = function()
            require('mini.comment').setup({
                mappings = {
                    comment_visual = '<Leader>/',
                    comment_line = '<Leader>/',
                }
            })
        end
    },

    --terminal
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup({
                size = 20,
                winblend = 15,
                open_mapping = [[<c-\>]],
                direction = 'horizontal',
                border = 'double', -- または 'single', 'shadow', 'curved'
            })
            vim.api.nvim_create_user_command('Term', function() require('toggleterm').toggle() end, {})
            local opts = { noremap = true, silent = true }

            vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], opts)
        end
    },

    --color scheme
    {
        'EdenEast/nightfox.nvim',
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = true,
                    styles = {
                        comments = 'italic',
                        keywords = 'bold',
                        type = 'italic,bold'
                    },
                }
            })
            vim.cmd('colorscheme nordfox')
        end
    },

    -- indentline
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup()
        end
    },

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    },

    --eazy motion
    {
        'easymotion/vim-easymotion',
        config = function()
            vim.api.nvim_set_keymap('n', 'f', '<Plug>(easymotion-overwin-f)', {})
            vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>(easymotion-overwin-f2)', {})
            vim.api.nvim_set_keymap('n', '<leader>w', '<Plug>(easymotion-overwin-w)', {})
            vim.api.nvim_set_keymap('n', '<leader>l', '<Plug>(easymotion-overwin-line)', {})
        end
    },

    --which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    -- csv
    {
        'cameron-wags/rainbow_csv.nvim',
        config = true,
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        },
        cmd = {
            'RainbowDelim',
            'RainbowDelimSimple',
            'RainbowDelimQuoted',
            'RainbowMultiDelim'
        }
    },
}
