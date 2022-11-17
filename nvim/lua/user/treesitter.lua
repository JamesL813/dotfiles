local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = {} },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#C586C0",
			"#4EC9B0",
			"#4FC1FF",
			"#DCDCAA",
			"#6A9955",
			"#CE9178",
			"#223E55",
		},
		termcolors = {
			"Red",
			"Green",
			"Yellow",
			"Blue",
			"Magenta",
			"Cyan",
			"White",
		},
		-- colors = {"blue"}, -- table of hex strings
		-- termcolors = {"blue"} -- table of colour name strings
	},
})
