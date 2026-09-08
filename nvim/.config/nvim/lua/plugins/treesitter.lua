-- syntax highlighting
local parsers = { 'c', 'haskell', 'rust', 'python', 'lua', 'vim', 'vimdoc', 'go', 'markdown', 'markdown_inline' }

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf, lang)
        end
    end,
})
