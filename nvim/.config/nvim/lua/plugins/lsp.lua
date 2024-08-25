require('nvim-autopairs').setup {}
require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = { 'lua_ls', 'rust_analyzer', 'hls', 'clangd' },
}

require('lspconfig').lua_ls.setup {}
require('lspconfig').rust_analyzer.setup {}
require('lspconfig').hls.setup {}
require('lspconfig').clangd.setup {}

