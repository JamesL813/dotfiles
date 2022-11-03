-- lua/custom/mappings
local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
	n = {
		["<leader>h"] = "",
	},
}

M.general = {

	n = {
		["<C-n>"] = { "<cmd> Telescope <CR>", "Open Telescope" },
		["Y"] = { "y$", "y consistancy" },
		["U"] = { "<C-R>", "redo is U" },
		["H"] = { "^", "jump to first non-whitespace character of a line" },
		["J"] = { "}", "jump down a paragraph" },
		["K"] = { "{", "jump up a paragraph" },
		["L"] = { "$", "jump to the end of a line" },
		["<Tab>"] = { ">>", "Indent line" },
		["<S-Tab>"] = { "<<", "Unindent line" },
	},

	v = {
		["<Tab>"] = { ">><Esc>gv", "Indent line" },
		["<S-Tab>"] = { "<<<Esc>gv", "Unindent line" },
	},
}

return M
