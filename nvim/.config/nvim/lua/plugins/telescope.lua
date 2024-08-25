local vim = vim
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
