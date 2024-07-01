return {
    -- git signs
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    --neo git
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true,
        vim.api.nvim_set_keymap('n', '<leader>g', '<Cmd>Neogit<CR>', {})
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
        vim.api.nvim_set_keymap('n', '<leader>cc', '<Cmd>CopilotChatToggle<CR>', {})
    },
    --copilot
    {
        'github/copilot.vim',
        lazy = false,
        config = function()
            vim.g.copilot_no_tab_map = false
            vim.api.nvim_set_keymap('i', '<C-y>', '<Cmd>CopilotAccept()<CR>', {})
        end
    },
}
