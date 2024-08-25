local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- plugins 
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter')
Plug('tpope/vim-surround')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('shaunsingh/nord.nvim')
Plug('olimorris/onedarkpro.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('windwp/nvim-autopairs')

vim.call('plug#end')


require('lua.plugins.telescope')
require('lua.plugins.treesitter')
require('lua.plugins.lsp')
require('lua.plugins.nvim-cmp')

-- set colorscheme
vim.cmd('silent! colorscheme onedark')
