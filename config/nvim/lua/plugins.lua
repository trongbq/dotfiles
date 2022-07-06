vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use { "wbthomason/packer.nvim" }

  use { "jiangmiao/auto-pairs" }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup({
        transparent_background = false
      })
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/playground",
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-h"] = "which_key"
            }
          }
        }
      })
    end
  }

  use { "folke/which-key.nvim" }

  use { "neovim/nvim-lspconfig" }

  use {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  }

  use {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline"
  }

  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('nvim-tree').setup({
          update_focused_file = {
            enable = true,
          }
        })
      end
  }
end)
