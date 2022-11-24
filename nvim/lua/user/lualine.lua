local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	-- sources = { "nvim_diagnostic" },
	-- sections = { "error", "warn" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	colored = true,
	update_in_insert = true,
}

local diff = {
	"diff",
	colored = true,
	-- changes diff symbols
	symbols = { added = " ", modified = " ", removed = " " },
	-- cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return str
	end,
}

local filename = {
	"filename",
	icons_enabled = true,
	symbols = {
		modified = "", -- Text to show when the file is modified.
		readonly = "", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
		newfile = "[New]", -- Text to show for new created file before first writting
	},
}

local filetype = {
	"filetype",
	icon_only = true,
	padding = 0,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = {
	function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = {
			"█  █",
			"█▁▁█",
			"█▂▂█",
			"█▃▃█",
			"█▄▄█",
			"█▅▅█",
			"█▆▆█",
			"█▇▇█",
			"████",
		}
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[10 - index]
	end,
	padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

-- options { default , arrow , round , block █ }--------v
local sep = require("user/icons").statusline_separators.empty

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		section_separators = { left = sep.left, right = sep.right },
		component_separators = { left = "", right = sep.right_sep },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { filename, filetype },
		lualine_c = { branch, diff },
		lualine_x = { diagnostics, },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
