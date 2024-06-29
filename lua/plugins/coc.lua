return {

    -- coc
    {'neoclide/coc.nvim', branch = 'release',
        config = function()
            vim.api.nvim_create_user_command('Format', 'call CocAction("format")', {})
        end
    },
}
