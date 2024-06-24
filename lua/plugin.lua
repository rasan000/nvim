-- 将来的にプラグインの設定ファイルは分けたい
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- package
require('lazy').setup({

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function ()
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                ensure_installed = {'c','json','kotlin', 'lua','fish','dockerfile','kotlin', 'vim', 'vimdoc', 'javascript', 'typescript'},
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true }
            })
        end
    },

    --barbar
    {
        'romgrk/barbar.nvim',
        config = function()
            require('barbar').setup()
            vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>BufferNext<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>e', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
        end
    },

    -- coc
    {'neoclide/coc.nvim', branch = 'release',
        config = function()
            vim.api.nvim_create_user_command('Format', 'call CocAction("format")', {})
        end
    },

    -- surround
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup({ })
        end
    }, 

    --auto pair
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
    },

    -- git signs
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    -- comment
    {
    'echasnovski/mini.comment',
        config = function()
            require('mini.comment').setup()
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
                direction = 'float',  -- 浮動ウィンドウに設定
                border = 'double',  -- または 'single', 'shadow', 'curved'
            })
            vim.api.nvim_create_user_command('Term', function() require('toggleterm').toggle() end, {})
        end
    },

    -- cursorlline
    {
        'yamatsum/nvim-cursorline',
        config = function()
            require('nvim-cursorline').setup()
        end
    },

    -- neogit
    {
        'TimUntersberger/neogit',
        config = function()
            require('neogit').setup()
            vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Neogit<CR>', { noremap = true, silent = true })
        end
    },

    --copilot
    {
        'github/copilot.vim',
        lazy=false
    },

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
            vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep <CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fn', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
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
            vim.api.nvim_set_keymap('n', 'gd', '<cmd>Telescope coc definitions<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'gy', '<cmd>Telescope coc type_definitions<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>Telescope coc diagnostics<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>Telescope.extensions.frecency.frecency()<CR>', { noremap = true, silent = true })
        end,
    },
    --color scheme
    {
        'EdenEast/nightfox.nvim',
        config = function()
            require('nightfox').setup({
                options = {
                    styles = {
                        comments = 'italic',
                        keywords = 'bold',
                        type = 'italic,bold'
                    },
                }
            })
            vim.cmd('colorscheme nightfox')
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
    
    -- Fern file_manager
    {
        'lambdalisue/fern.vim',
        requires = { 'lambdalisue/fern-renderer-nerdfont.vim', 'lambdalisue/nerdfont.vim', 'lambdalisue/glyph-palette.vim', 'lambdalisue/fern-git-status.vim' },
        config = function()
            vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>Fern . -reveal=%<CR>', { noremap = true, silent = true })
            vim.g['fern#renderer'] = 'nerdfont'
            vim.g['fern#default_hidden'] = 1
        end
    },
    {'lambdalisue/fern-renderer-nerdfont.vim'},
    {'lambdalisue/nerdfont.vim'},
    {'lambdalisue/glyph-palette.vim'},
    {'lambdalisue/fern-git-status.vim'},

    -- scroolbar
    {
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
        end
    },

    --eazy motion
    {
        'easymotion/vim-easymotion',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(easymotion-overwin-f)', {})
            vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>(easymotion-overwin-f2)', {})
            vim.api.nvim_set_keymap('n', '<leader>w', '<Plug>(easymotion-overwin-w)', {})
            vim.api.nvim_set_keymap('n', '<leader>l', '<Plug>(easymotion-overwin-line)', {})
        end
    },
    
    -- スクロールを滑らかに
    {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup({
                easing_function = 'linear',
            })
            
        end
    }, 
})


