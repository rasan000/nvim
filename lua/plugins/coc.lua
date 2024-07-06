return {
    {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            -- 設定
            vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

            vim.opt.writebackup = false
            vim.opt.updatetime = 300

            -- フォーマットに関するコマンド
            vim.api.nvim_create_user_command('Format', 'call CocAction("format")', {})
            vim.api.nvim_set_keymap('n', '<leader>fo', ':Format<cr>', { noremap = true, silent = true })

            -- インストール
            vim.api.nvim_set_keymap('n', '<leader>cl', '<Cmd>CocList<cr>', { noremap = true, silent = true })

            -- Use K to show documentation in preview window
            function _G.show_docs()
                local cw = vim.fn.expand('<cword>')
                if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                    vim.api.nvim_command('h ' .. cw)
                elseif vim.api.nvim_eval('coc#rpc#ready()') then
                    vim.fn.CocActionAsync('doHover')
                else
                    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
                end
            end
            vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

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
            vim.keymap.set("i", "<C-n>", 'coc#pum#visible() ? coc#pum#next(0) : "<C-n>"', opts)
            vim.keymap.set("i", "<C-p>", [[coc#pum#visible() ? coc#pum#prev(0) : "<C-p>"]], opts)
            vim.keymap.set("i", "<Tab>", 'coc#pum#visible() ? coc#pum#next(0) : "<Tab>"', opts)
            vim.keymap.set("i", "<s-tab>", [[coc#pum#visible() ? coc#pum#prev(0) : "<c-h>"]], opts)
            vim.g.coc_global_extensions = { 'coc-html', 'coc-emmet', 'coc-json', 'coc-css', 'coc-yaml', 'coc-vimlsp',
                'coc-tsserver', 'coc-eslint', 'coc-sumneko-lua', 'coc-docker', 'coc-snippets', 'coc-python', 'coc-pairs',
                'coc-webview', 'coc-markdown-preview-enhanced', 'coc-xml', 'coc-tsserver', 'coc-java', 'coc-kotlin' }
        end
    }
}
