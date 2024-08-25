local vim = vim
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
