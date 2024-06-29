-- プラグイン読み込み用のファイル
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインフォルダから読み込む
require('lazy').setup('plugins', {
    spec = {
        { import = 'plugins'},
        checker = { enabled = true},
    }
})


