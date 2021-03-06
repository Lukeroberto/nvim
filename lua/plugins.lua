vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
	function(use)
		use 'wbthomason/packer.nvim'

		use 'ellisonleao/gruvbox.nvim'

		use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}}

		use 'neovim/nvim-lspconfig'

		use 'nvim-treesitter/nvim-treesitter'

		use 'junegunn/fzf'

		use {'neoclide/coc.nvim', branch = 'release'}
end})
