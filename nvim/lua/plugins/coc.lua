return {
    {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            -- フォーマットに関するコマンド
            vim.api.nvim_create_user_command('Format', 'call CocAction("format")', {})
            vim.api.nvim_set_keymap('n', '<leader>fo', ':Format<cr>', { noremap = true, silent = true })

            -- 何故かcopilotのtabが効いてしまうときがあるので防ぐ
            vim.g.copilot_no_tab_map = true
            -- キーマップ
            local opts = {
                silent = true,
                noremap = true,
                expr = true,
                replace_keycodes = false
            }
            vim.keymap.set("i", "<cr>",
                [[coc#pum#visible() ? coc#pum#confirm() : "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"]], opts)
            vim.keymap.set("i", "<tab>", 'coc#pum#visible() ? coc#pum#next(0) : "<tab>"', opts)
            vim.keymap.set("i", "<s-tab>", [[coc#pum#visible() ? coc#pum#prev(0) : "<c-h>"]], opts)

            -- よく使う言語など
            vim.g.coc_global_extensions = { 'coc-html', 'coc-emmet', 'coc-json', 'coc-css', 'coc-yaml', 
                'coc-vimlsp', 'coc-tsserver', 'coc-eslint', 'coc-sumneko-lua', 'coc-docker', 'coc-snippets', 'coc-python',
                 'coc-pairs', 'coc-webview', 'coc-markdown-preview-enhanced', 'coc-xml',
                'coc-tsserver', 
            }
        end
    },
}
