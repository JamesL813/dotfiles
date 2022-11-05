return {
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},
	["simrat39/rust-tools.nvim"] = {},
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},
	["ThePrimeagen/vim-be-good"] = {},
	["Mofiqul/vscode.nvim"] = {},
}
