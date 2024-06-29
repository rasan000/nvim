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
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
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
        lazy=false
    },

}
