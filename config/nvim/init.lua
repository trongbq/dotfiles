local indent = 2

vim.opt.expandtab = true -- Use spaces instead of tab
vim.opt.shiftwidth = indent -- Size of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.ignorecase = true -- Ignore case
vim.opt.incsearch = true -- Search like modern browsers
vim.opt.cursorline = true -- Show the current line
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.scrolloff = 10 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.smartcase = true -- No ignore case with capitals
vim.opt.splitbelow = true -- New window below the current one
vim.opt.splitright = true -- New window right of the current one
vim.opt.termguicolors = true -- True color support
vim.opt.wildmode = "list:longest" -- Support command line completion
vim.opt.list = false -- Show invisible characters
vim.opt.number = true -- Print line number
vim.opt.relativenumber = false -- Relative line numbers
vim.opt.wrap = true -- Enable line wrap
vim.opt.cmdheight = 2 -- Extra space to display command message
vim.opt.timeoutlen = 400 -- Don't wait for more than 400ms for normal mode commands
vim.opt.foldlevelstart = 20
vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Set leader to space
vim.g.mapleader = " "


require("plugins")
require("mappings")
require("lsp")
require("completion")

-- Set color scheme
vim.g.catppuccin_flavour = "mocha"
vim.cmd[[colorscheme catppuccin]]

-- Explicitly call it here since calling in config does not work
-- https://github.com/kyazdani42/nvim-tree.lua/issues/767
require'nvim-tree'.setup {}
