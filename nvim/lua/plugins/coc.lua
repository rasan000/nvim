return {
    -- coc
    {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            -- フォーマットに関するコマンド
            vim.api.nvim_create_user_command('Format', 'call CocAction("format")', {})
            vim.api.nvim_set_keymap('n', '<leader>fo', ':Format<CR>', { noremap = true, silent = true })

            -- 何故かcopilotのtabが効いてしまうときがあるので防ぐ
            vim.g.copilot_no_tab_map = true
            -- キーマップ
            local opts = {
                silent = true,
                noremap = true,
                expr = true,
                replace_keycodes = false
            }
            vim.keymap.set("i", "<CR>",
                [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
            vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(0) : "<Tab>"', opts)
            vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(0) : "<C-h>"]], opts)

            -- よく使う言語など
            vim.g.coc_global_extensions = { 'coc-html', 'coc-emmet', 'coc-json', 'coc-css', 'coc-yaml', 'coc-yank',
                'coc-vimlsp', 'coc-tsserver', 'coc-eslint', 'coc-sumneko-lua', 'coc-docker', 'coc-snippets', 'coc-python',
                'coc-java', 'coc-kotlin', 'coc-pairs'
            }
        end
    },
}
