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
-- leader
vim.g.mapleader = " "
