-- ヘルプを日本語表記に
vim.opt.helplang= 'ja','en'

-- netrwを無効化
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- クリップボード連携
vim.opt.clipboard = 'unnamedplus'

-- 文字コード
vim.opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"


-- 行番号と相対行番号を表示する
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.relativenumber = true

-- タブを4文字に設定する
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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
vim.opt.swapfile = false

-- shellはfishを使う
vim.opt.shell = 'fish'

-- タイトルを出す
vim.opt.title = true

-- 置換状態を表示させる
vim.opt.inccommand = split

-- ヤンクした内容をハイライトする
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#553311" })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 200 })
  end,
})
