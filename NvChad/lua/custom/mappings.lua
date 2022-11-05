-- lua/custom/mappings
local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
	n = {
		-- ["<leader>h"] = "",
	},
}

M.general = {

	n = {
		["<C-n>"] = { "<cmd> Telescope <CR>", "Open Telescope" },
		["Y"] = { "y$", "y consistancy" },
		["U"] = { "<C-R>", "redo is U" },

		["H"] = { "b", "jump to first non-whitespace character of a line" },
		["J"] = { "}", "jump down a paragraph" },
		["K"] = { "{", "jump up a paragraph" },
		["L"] = { "w", "jump to the end of a line" },

		["<A-h>"] = { "^", "jump to first non-whitespace character of a line" },
		["<A-j>"] = { "G", "jump down a paragraph" },
		["<A-k>"] = { "gg", "jump up a paragraph" },
		["<A-l>"] = { "$", "jump to the end of a line" },

		["<TAB>"] = { ">>", "Indent line" },
		["<S-Tab>"] = { "<<", "Unindent line" },

		["."] = {
			function()
				require("nvchad_ui.tabufline").tabuflineNext()
			end,
			"goto next buffer",
		},
		[","] = {
			function()
				require("nvchad_ui.tabufline").tabuflinePrev()
			end,
			"goto previous buffer",
		},

		[";"] = { ":", "enter cmdline", opts = { nowait = true } },

		["<leader>v"] = { "<cmd> vs <CR>", "vertical split" },
	},

	v = {
		["<Tab>"] = { ">><Esc>gv", "Indent line" },
		["<S-Tab>"] = { "<<<Esc>gv", "Unindent line" },
	},
}

return M
