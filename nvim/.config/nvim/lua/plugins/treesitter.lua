-- syntax highlighting
require('nvim-treesitter.configs').setup {
    ensure_installed = {'c', 'haskell', 'rust', 'python', 'lua'},
    highlight = {
        enable = true,
    },
}

