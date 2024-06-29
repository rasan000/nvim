return {
    -- neogit
    {
        'TimUntersberger/neogit',
        config = function()
            require('neogit').setup()
            vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>Neogit<CR>', { noremap = true, silent = true })
        end
    },
    -- git signs
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    --chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        vim.api.nvim_set_keymap('n', '<leader>p', '<Cmd>CopilotChatToggle<CR>', {})
    },
    --copilot
    {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set('i', '<C-g>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
            vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Next()', { silent = true, expr = true })
            vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#Previous()', { silent = true, expr = true })
            vim.api.nvim_set_keymap("i", "<C-d>", 'copilot#Dismiss()', { silent = true, expr = true })
            vim.api.nvim_set_keymap("i", "<C-s>", 'copilot#Suggest()', { silent = true, expr = true })
        end
    },
}
