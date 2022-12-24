local options = {
	-- Memory, CPU --
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	fileencoding = "utf-8", -- the encoding written to a file
	swapfile = false, -- creates a swapfile
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	hidden = true,
	--	synmaxcol = 240,
	lazyredraw = true,
	history = 300,

	-- Tabs and Indentation --
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	smartindent = true, -- make indenting smarter again
	autoindent = true,
	breakindent = true,
	showbreak = "│", --"▎",--" ",
    foldmethod = "indent",
    foldlevel=99,

	-- UI --
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	conceallevel = 0, -- so that `` is visible in markdown files
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	-- showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	title = true,
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	cursorline = true, -- highlight the current line
	colorcolumn = "80", -- Line length marker at 80 columns
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 2, -- set number column width to 2 {default 4}
	signcolumn = "auto", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	linebreak = false, -- companion to wrap, don't split words
	scrolloff = 12, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	guifont = "monospace:h17", -- the font used in graphical neovim applications
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
-- vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
