local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--==========
-- Normal --
--==========

-- Movement
keymap("n", "h", "h", opts)
keymap("n", "t", "j", opts)
keymap("n", "n", "k", opts)
keymap("n", "s", "l", opts)

keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-t>", "<C-w>j", opts)
keymap("n", "<A-n>", "<C-w>k", opts)
keymap("n", "<A-s>", "<C-w>l", opts)

keymap("n", "H", "b", opts) -- jump to first non-whitespace character of a line
keymap("n", "T", "}", opts) -- jump down a paragraph
keymap("n", "N", "{", opts) -- jump up a paragraph'
keymap("n", "S", "w", opts) -- jump to the end of a line

keymap("n", "<C-h>", "^", opts) --  jump to first non-whitespace character of a line
keymap("n", "<C-t>", "<C-d>", opts) --  jump down a paragraph
keymap("n", "<C-n>", "<C-u>", opts) -- jump up a paragraph
keymap("n", "<C-s>", "$", opts) -- jump to the end of a line

-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)


keymap("n", "Y", "y$", opts) -- y consistancy
keymap("n", "U", "<C-R>", opts) -- redo is U

keymap("n", "<TAB>", ">>", opts) -- Indent line
keymap("n", "<S-Tab>", "<<", opts) -- Unindent line

-- keymap('n', ';', ':', { nowait = true })
keymap("n", "<leader>v", "<cmd> vs <CR>", opts) -- vertical split


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader><Tab>", ":bnext<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "tn", "<ESC>", opts)
keymap("i", "nt", "<ESC>", opts)

--==========
-- Visual --
--==========
keymap("v", "h", "h", opts)
keymap("v", "t", "j", opts)
keymap("v", "n", "k", opts)
keymap("v", "s", "l", opts)

keymap("v", "H", "b", opts) -- jump to first non-whitespace character of a line
keymap("v", "T", "}", opts) -- jump down a paragraph
keymap("v", "N", "{", opts) -- jump up a paragraph'
keymap("v", "S", "w", opts) -- jump to the end of a line

keymap("v", "<C-h>", "^", opts) --  jump to first non-whitespace character of a line
keymap("v", "<C-t>", "<C-d>", opts) --  jump down a paragraph
keymap("v", "<C-n>", "<C-u>", opts) -- jump up a paragraph
keymap("v", "<C-s>", "$", opts) -- jump to the end of a line

keymap("v", "<Tab>", ">><Esc>gv", opts) -- Indent line
keymap("v", "<S-Tab>", "<<<Esc>gv", opts) -- Unindent line
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<leader>d", ":lua require(\"duck\").hatch(\"🦀\")<CR>", opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
