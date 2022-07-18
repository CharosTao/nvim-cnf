-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- CoC.nvim
  --use {'neoclide/coc.nvim', branch = 'release'}
  --use 'folke/tokyonight.nvim'
  -- tree
  use {
  	'kyazdani42/nvim-tree.lua',
  	requires = {
    	'kyazdani42/nvim-web-devicons', -- optional, for file icons
  	},
  }
  -- status line
  --[[use {
  	'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }]]
  use 'feline-nvim/feline.nvim'
  -- tabby
  use {
    "nanozuki/tabby.nvim",
    config = function() require("tabby").setup() end,
  }
  -- theme nightfox
  use "EdenEast/nightfox.nvim" -- Packer
  use 'lewis6991/gitsigns.nvim'
  -- tag = 'release' -- To use the latest release
  -- ***********
  -- lspconfig
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use "williamboman/nvim-lsp-installer"

  use {
    'ojroques/nvim-lspfuzzy',
    requires = {
      {'junegunn/fzf'},
      {'junegunn/fzf.vim'},  -- to enable preview (optional)
      },
    }
  use 'lewis6991/impatient.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
	use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
end)

