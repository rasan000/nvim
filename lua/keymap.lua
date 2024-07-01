-- leader
vim.g.mapleader = ' '
-- 表示行での移動にする
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })

-- ハイライトを消す
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':noh<Return>', { noremap = true, silent = true })

-- ノーマルモードのみコロンをセミコロン
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = true })

-- 全て選択 
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- jj jk でノーマルモードに戻る、jkは保存しながら
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'っｊ', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'ｊｊ', '<ESC>', { noremap = true, silent = true })

-- ウィンドウ分割
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', { noremap = true, silent = true })

-- ウィンドウ間の移動
vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', { noremap = true, silent = true })

-- 強制終了
vim.api.nvim_set_keymap('n', '<leader>q', ':q!<CR>', { noremap = true, silent = true })

-- 削除時はヤンクしない
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'X', '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'X', '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'C', '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'C', '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 's', '"_s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 's', '"_s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'S', '"_S', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'S', '"_S', { noremap = true, silent = true })

-- 切り取り時は0レジスタにいれる
vim.api.nvim_set_keymap('n', 'd', '"0d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"0d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'D', '"0D', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'D', '"0D', { noremap = true, silent = true })

-- 入力中に移動したい時 
vim.api.nvim_set_keymap('i', '<C-f>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<Left>', { noremap = true, silent = true })

-- leader+rで:%s///g
vim.api.nvim_set_keymap('n', '<leader>r', ':%s///g<Left><Left><Left>', { noremap = true, silent = true })

-- leader+cでカレントフォルダを現在のフォルダに変更する
vim.api.nvim_set_keymap('n', '<leader>cd', ':lcd %:p:h<CR>', { noremap = true, silent = true })

--設定ファイルを開く
vim.api.nvim_set_keymap('n', '<leader><F1>', ':edit $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><F2>', ':CocCommand snippets.editSnippets<CR>', { noremap = true, silent = true })
