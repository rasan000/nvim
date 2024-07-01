-- クリップボード連携
vim.opt.clipboard = 'unnamedplus'

-- IMEをONOFFする。
-- ZENHANのパスが通っていることが前提
vim.cmd [[
    let &shell='/usr/bin/bash --login'
    autocmd InsertLeave * :call system('${zenhan} 0')
    autocmd CmdlineLeave * :call system('${zenhan} 0')
]]
-- プラグイン
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- package
require("lazy").setup({
    -- surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'echasnovski/mini.comment',
        config = function()
            require('mini.comment').setup()
        end
    },
})

--keymap 系
vim.keymap.set ( 'n', 'x', '"_x' )
vim.keymap.set ( 'v', 'x', '"_x' )
vim.keymap.set ( 'n', 'X', '"_X' )
vim.keymap.set ( 'v', 'X', '"_X' )
