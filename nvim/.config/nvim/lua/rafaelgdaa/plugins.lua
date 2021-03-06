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
	max_jobs = 4, -- Added this because the popup window was failing.
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	auto_reload_compiled = false,
})
-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("noib3/nvim-cokeline")
	use("akinsho/toggleterm.nvim")
	use("moll/vim-bbye")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("SmiteshP/nvim-gps")
	use("folke/which-key.nvim")
	use("norcalli/nvim-colorizer.lua")
	-- use("andymass/vim-matchup")
	-- use("nacro90/numb.nvim")
	-- use("monaqa/dial.nvim")
	-- use("folke/zen-mode.nvim")
	-- use("karb94/neoscroll.nvim")
	-- use("folke/todo-comments.nvim")
	-- use("kevinhwang91/nvim-bqf")
	-- use("MattesGroeger/vim-bookmarks")
	-- use("lunarvim/vim-solidity")
	-- use("tpope/vim-repeat")
	-- use("Shatur/neovim-session-manager")
	-- use("rcarriga/nvim-notify")
	-- use("tversteeg/registers.nvim")
	-- use("davidgranstrom/nvim-markdown-preview")
	-- use("williamboman/nvim-lsp-installer") -- simple to use language server installer

	-- Mason installs lsps,daps,formaters
  use("williamboman/mason-lspconfig.nvim")
	use("williamboman/mason.nvim")

	-- LINE
	use("feline-nvim/feline.nvim")

	-- DASHBOARD
	use("glepnir/dashboard-nvim")

	-- THEME
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- Cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"tzachar/cmp-tabnine",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
			})
		end,

		run = "./install.sh",
	})

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("simrat39/symbols-outline.nvim")
	use("ray-x/lsp_signature.nvim")
	use("b0o/SchemaStore.nvim")
	use("folke/trouble.nvim")
	use("RRethy/vim-illuminate")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")
	use("f-person/git-blame.nvim")
	use("ruifm/gitlinker.nvim")
	use("mattn/vim-gist")
	use("mattn/webapi-vim")

	-- Test
	use({
		"nvim-neotest/neotest",
		requires = {
			"antoinemadec/FixCursorHold.nvim",
			"olimorris/neotest-rspec",
		},
	})
	use("vim-test/vim-test")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("suketa/nvim-dap-ruby")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
