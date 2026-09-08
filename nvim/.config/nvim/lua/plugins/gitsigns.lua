local vim = vim

require('gitsigns').setup {
    signs                   = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signcolumn              = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl                   = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame      = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
    },
    on_attach               = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(gs.next_hunk)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(gs.prev_hunk)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', gs.stage_hunk)
        map({ 'n', 'v' }, '<leader>hr', gs.reset_hunk)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', gs.blame_line)
    end
}
