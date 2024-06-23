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

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {"c","json","kotlin", "lua","fish","dockerfile","kotlin", "vim", "vimdoc", "javascript", "typescript"},
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
            require("toggleterm").setup({
                size = 20,
                winblend = 4,
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
                file_ignore_patterns = { '^node_modules/', '^.git' }
            })
            vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep <CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fn', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
        end
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension "frecency"
        end,
    },
    --color scheme
    {
        'EdenEast/nightfox.nvim',
        config = function()
            require('nightfox').setup({
                options = {
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                        type = "italic,bold"
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
    
    -- nvim-tree
    {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup({
                 filters = { custom = { '^node_modules/', '^.git'} }, 
                --デフォルト設定-- ここでデフォルトmapping込みの設定にすり替え
                on_attach = function(bufnr)
                    local api = require "nvim-tree.api"
                    local function opts(desc)
                        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end
                    vim.keymap.set('n', '<C-]>',   api.tree.change_root_to_node,        opts('CD'))
                    vim.keymap.set('n', '<C-e>',   api.node.open.replace_tree_buffer,   opts('Open: In Place'))
                    vim.keymap.set('n', '<C-k>',   api.node.show_info_popup,            opts('Info'))
                    vim.keymap.set('n', '<C-r>',   api.fs.rename_sub,                   opts('Rename: Omit Filename'))
                    vim.keymap.set('n', '<C-t>',   api.node.open.tab,                   opts('Open: New Tab'))
                    vim.keymap.set('n', '<C-v>',   api.node.open.vertical,              opts('Open: Vertical Split'))
                    vim.keymap.set('n', '<C-x>',   api.node.open.horizontal,            opts('Open: Horizontal Split'))
                    vim.keymap.set('n', '<BS>',    api.node.navigate.parent_close,      opts('Close Directory'))
                    vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
                    vim.keymap.set('n', '<Tab>',   api.node.open.preview,               opts('Open Preview'))
                    vim.keymap.set('n', '>',       api.node.navigate.sibling.next,      opts('Next Sibling'))
                    vim.keymap.set('n', '<',       api.node.navigate.sibling.prev,      opts('Previous Sibling'))
                    vim.keymap.set('n', '.',       api.node.run.cmd,                    opts('Run Command'))
                    vim.keymap.set('n', '-',       api.tree.change_root_to_parent,      opts('Up'))
                    vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
                    vim.keymap.set('n', 'bd',      api.marks.bulk.delete,               opts('Delete Bookmarked'))
                    vim.keymap.set('n', 'bt',      api.marks.bulk.trash,                opts('Trash Bookmarked'))
                    vim.keymap.set('n', 'bmv',     api.marks.bulk.move,                 opts('Move Bookmarked'))
                    vim.keymap.set('n', 'B',       api.tree.toggle_no_buffer_filter,    opts('Toggle Filter: No Buffer'))
                    vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
                    vim.keymap.set('n', 'C',       api.tree.toggle_git_clean_filter,    opts('Toggle Filter: Git Clean'))
                    vim.keymap.set('n', '[c',      api.node.navigate.git.prev,          opts('Prev Git'))
                    vim.keymap.set('n', ']c',      api.node.navigate.git.next,          opts('Next Git'))
                    vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
                    vim.keymap.set('n', 'D',       api.fs.trash,                        opts('Trash'))
                    vim.keymap.set('n', 'E',       api.tree.expand_all,                 opts('Expand All'))
                    vim.keymap.set('n', 'e',       api.fs.rename_basename,              opts('Rename: Basename'))
                    vim.keymap.set('n', ']e',      api.node.navigate.diagnostics.next,  opts('Next Diagnostic'))
                    vim.keymap.set('n', '[e',      api.node.navigate.diagnostics.prev,  opts('Prev Diagnostic'))
                    vim.keymap.set('n', 'F',       api.live_filter.clear,               opts('Live Filter: Clear'))
                    vim.keymap.set('n', 'f',       api.live_filter.start,               opts('Live Filter: Start'))
                    vim.keymap.set('n', 'g?',      api.tree.toggle_help,                opts('Help'))
                    vim.keymap.set('n', 'gy',      api.fs.copy.absolute_path,           opts('Copy Absolute Path'))
                    vim.keymap.set('n', 'ge',      api.fs.copy.basename,                opts('Copy Basename'))
                    vim.keymap.set('n', 'H',       api.tree.toggle_hidden_filter,       opts('Toggle Filter: Dotfiles'))
                    vim.keymap.set('n', 'I',       api.tree.toggle_gitignore_filter,    opts('Toggle Filter: Git Ignore'))
                    vim.keymap.set('n', 'J',       api.node.navigate.sibling.last,      opts('Last Sibling'))
                    vim.keymap.set('n', 'K',       api.node.navigate.sibling.first,     opts('First Sibling'))
                    vim.keymap.set('n', 'L',       api.node.open.toggle_group_empty,    opts('Toggle Group Empty'))
                    vim.keymap.set('n', 'M',       api.tree.toggle_no_bookmark_filter,  opts('Toggle Filter: No Bookmark'))
                    vim.keymap.set('n', 'm',       api.marks.toggle,                    opts('Toggle Bookmark'))
                    vim.keymap.set('n', 'O',       api.node.open.no_window_picker,      opts('Open: No Window Picker'))
                    vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
                    vim.keymap.set('n', 'P',       api.node.navigate.parent,            opts('Parent Directory'))
                    vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))
                    vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
                    vim.keymap.set('n', 'R',       api.tree.reload,                     opts('Refresh'))
                    vim.keymap.set('n', 'o',       api.node.run.system,                 opts('Run System'))
                    vim.keymap.set('n', 'S',       api.tree.search_node,                opts('Search'))
                    vim.keymap.set('n', 'u',       api.fs.rename_full,                  opts('Rename: Full Path'))
                    vim.keymap.set('n', 'U',       api.tree.toggle_custom_filter,       opts('Toggle Filter: Hidden'))
                    vim.keymap.set('n', 'W',       api.tree.collapse_all,               opts('Collapse'))
                    vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
                    vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy Name'))
                    vim.keymap.set('n', 'Y',       api.fs.copy.relative_path,           opts('Copy Relative Path'))
                    vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
                    vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
                end
            })
            vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>ee', '<cmd>NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
        end
    },

    -- scroolbar
    {
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
        end
    },

})


