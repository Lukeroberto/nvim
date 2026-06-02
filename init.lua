vim.g.mapleader = " "
vim.g.maplocalleader = "  "


-- Fast Buffer Moving
vim.keymap.set("n", "<C-J>", ":bprev<CR>")
vim.keymap.set("n", "<C-K>", ":bnext<CR>")

-- Terminal Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- Options
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.textwidth = 80

-- filetype detection, plugins, indentation
vim.cmd.filetype("plugin indent on")

-- color theme
vim.o.background = 'light'
vim.cmd.colorscheme 'retrobox'
--vim.pack.add({"https://github.com/rose-pine/neovim"})
--vim.cmd("colorscheme rose-pine")

-- plenary + telescope
vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim'
})
vim.pack.add({
	'https://github.com/nvim-telescope/telescope.nvim'
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Center for writing
vim.pack.add({'https://github.com/shortcuts/no-neck-pain.nvim'})

-- treesitter + context
vim.pack.add({
	'https://github.com/nvim-treesitter/nvim-treesitter'
})
vim.pack.add({
	'https://github.com/nvim-treesitter/nvim-treesitter-context'
})

-- Use tree sitter for folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- LSP Shortcuts
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })


-- Helper function to organize imports and format
local function format_python()
  -- 1. Sort imports via Ruff code action
  vim.lsp.buf.code_action({
    context = { only = { "source.organizeImports" } },
    apply = true,
  })
  -- 2. Format the file
  vim.lsp.buf.format({ async = false })
end

-- Format manually with <leader>f
vim.keymap.set('n', '<leader>f', function()
  format_python()
end, { desc = 'Format and organize imports' })

-- Format automatically on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    format_python()
  end,
})


-- LSP Configs
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.lsp.config('ty', {
	settings = {
		ty = {
			-- ty language server settings go here
		}
	}
})

-- Required: Enable the language server
vim.lsp.enable('ty')
-- Enable Ruff for python linting/formatting
vim.lsp.enable('ruff')

-- Lean nvim 
--vim.pack.add({
--	'https://github.com/Julian/lean.nvim'
--})
--require('lean').setup{ mappings = true}
