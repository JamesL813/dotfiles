local M = {}

M.ui = {
	statusline = {
		separator_style = "default", -- default/round/block/arrow
		overriden_modules = nil,
	},

	-- lazyload it when there are 1+ buffers
	tabufline = {
		enabled = true,
		lazyload = true,
		overriden_modules = nil,
	},

	--custom themes
	changed_themes = {
		vscode_dark = {
			base_16 = {
				base0D = "#0000FF",
			},
			base_30 = {
				red = "#FF0000",
			},
		},
	},
}

M.treesitter = {
	ensure_installed = {
		"html",
		"markdown",
		"yaml",
		"lua",
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	view = {
		-- side = "right",
	},
}

M.blankline = {
	filetype_exclude = {
		"help",
		"terminal",
		"alpha",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"nvchad_cheatsheet",
		"lsp-installer",
		"",
	},
}

M.mason = {
	ensure_installed = {},
}

return M
