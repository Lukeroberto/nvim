vim.g.mapleader = " "

-- Fast Buffer Moving
vim.keymap.set("n", "<C-J>", ":bnext<CR>")
vim.keymap.set("n", "<C-K>", ":bprev<CR>")

-- Search/Replace
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.cmd([[set inccommand=nosplit]])

-- Others
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.cmd([[set noswapfile]])

-- Theme
vim.o.background = "dark"
require("gruvbox").setup({
	transparent_mode = true
})
vim.cmd([[colorscheme gruvbox]])

--Package management
return require('packer').startup(function(use)
	use {'wbthomason/packer.nvim'}
	
	use {'ellisonleao/gruvbox.nvim'}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {'nvim-treesitter/nvim-treesitter-context'}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requres = { {'nvim-lua/plenary.nvim'} }
	}

	if packer_bootstrap then 
		require('packer').sync()
	end
end)
	
