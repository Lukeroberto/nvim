local lsp = require("lsp-zero")

lsp.preset("recommended")




lsp.on_attach(function(clinet, bufnr) 
    lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()