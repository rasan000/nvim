return {
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = { 'c', 'yaml', 'xml', 'sql', 'java', 'bash', 'json', 'fish', 'markdown', 'c_sharp', 'html', 'css', 'python', 'kotlin', 'lua', 'fish', 'dockerfile', 'kotlin', 'vim', 'vimdoc', 'javascript', 'typescript', 'terraform' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true }
      })
    end
  },

}
