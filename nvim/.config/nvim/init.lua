local vim = vim
local Plug = vim.fn['plug#']

-- vim settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.termguicolors = true

-- unmap space and set to leader
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })


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

-- set colorscheme
vim.cmd('silent! colorscheme onedark')

-- syntax highlighting
require('nvim-treesitter.configs').setup {
    ensure_installed = {'c', 'haskell', 'rust', 'python', 'lua'},
    highlight = {
        enable = true,
    },
}


-- telescope keybindings
local telescope = require('telescope')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup {
    defaults = {
        vimgrep_arguments = { 'rg',
                              '--hidden',
                              '--color=never',
                              '--no-heading',
                              '--with-filename',
                              '--line-number',
                              '--column',
                              '--smart-case'
                            },
                        },
    pickers = {
        find_files = {
            find_command = { 'rg',
                             '--files',
                             '--iglob',
                             '!.git',
                             '--hidden' },
        },
    },
}
-- language servers
require('nvim-autopairs').setup {}
require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = { 'lua_ls', 'rust_analyzer', 'hls', 'clangd' },
}

require('lspconfig').lua_ls.setup {}
require('lspconfig').rust_analyzer.setup {}
require('lspconfig').hls.setup {}
require('lspconfig').clangd.setup {}

local cmp = require('cmp')
cmp.setup({
  snippet = {
      expand = function(args)
          vim.snippet.expand(args.body)
      end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer'},
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').cssls.setup {
    capabilities = capabilities,
}
