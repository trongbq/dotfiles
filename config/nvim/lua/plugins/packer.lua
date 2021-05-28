vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.startup(function()
  use 'wbthomason/packer.nvim'                   -- Packer can manage itself

  use 'nvim-treesitter/nvim-treesitter'

  use 'nvim-treesitter/playground'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-compe'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' }
  }

  use 'lifepillar/vim-gruvbox8'

  use 'jiangmiao/auto-pairs'

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }
end)
