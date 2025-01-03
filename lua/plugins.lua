local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
    use 'wbthomason/packer.nvim'	
	use 'ellisonleao/gruvbox.nvim'
    use 'm4xshen/autoclose.nvim'
    use 'neovim/nvim-lspconfig'
   	use {
   	    'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use  {
        'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate' -- Automatically update Tree-sitter parsers
    }
    use'hrsh7th/nvim-cmp'
    use'hrsh7th/cmp-nvim-lsp'
    use 'tpope/vim-fugitive'

    -- lsp-zero and its dependencies
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            {'williamboman/mason.nvim'}, -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-buffer'}, -- Optional
            {'hrsh7th/cmp-path'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'}, -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'}, -- Required
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
        }
    }
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
