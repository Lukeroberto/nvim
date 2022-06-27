require('plugins')
require('lualine').setup({options = {theme = 'gruvbox'}})
require('lspconfig').pyright.setup{}

vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[set tabstop=4]])

