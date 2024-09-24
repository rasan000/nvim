-- ヘルプを日本語表記に
vim.opt.helplang = 'ja', 'en'
--コマンド候補
vim.opt.wildmenu = true
-- 折り返し無し
-- vim.opt.wrap = false

-- netrwを無効化
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- クリップボード連携
vim.opt.clipboard = 'unnamedplus'

-- ちらつきぼうし
vim.opt.showtabline = 1

-- 文字コード
vim.opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"


-- 行番号
vim.opt.number = true
vim.opt.swapfile = false

-- タブを2文字に設定する
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- 検索
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- その他
vim.opt.showmatch = true

-- マウスを有効にする
vim.opt.mouse = "a"

-- バッファ削除時に保存されていないバッファを閉じる
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false

-- fishだとzenhanの切り替えがうまく動かなかったのでなし
vim.opt.shell = 'fish'

-- タイトルを出す
vim.opt.title = true

-- 置換状態を表示させる
vim.opt.inccommand = split

-- ヤンクした内容をハイライトする
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#FFFFFF" })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 200 })
    end,
})

vim.cmd [[
    let &shell='/usr/bin/bash --login'
]]
vim.api.nvim_set_keymap('i', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'ｊｊ', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'っ', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })

-- 少し透明にする
-- vim.opt.winblend = 10
