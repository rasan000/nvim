local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- package
require("lazy").setup({
    --nvim tree
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require('nvim-tree').setup({
                view = {
                    width = 30,
                    side = 'left'
                }
            })
            vim.api.nvim_create_user_command('Ex', function () vim.cmd.NvimTreeToggle() end, {})
        end
    },
    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {"c","json","kotlin", "lua", "vim", "vimdoc", "javascript", "typescript"},
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    -- coc
    {'neoclide/coc.nvim', branch = 'release'},
    -- surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({ })
        end
    }, 

    --auto pair
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    -- git
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

    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6'
    },
    --terminal
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]],
                direction = 'horizontal',  -- 浮動ウィンドウに設定
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
    }   

})

