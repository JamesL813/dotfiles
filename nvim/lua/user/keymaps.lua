local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Move around splits using Alt + {h,j,k,l}
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

keymap("n", "H", "b", opts) -- jump to first non-whitespace character of a line
keymap("n", "J", "}", opts) -- jump down a paragraph
keymap("n", "K", "{", opts) -- jump up a paragraph'
keymap("n", "L", "w", opts) -- jump to the end of a line

keymap("n", "<C-h>", "^", opts) --  jump to first non-whitespace character of a line
keymap("n", "<C-j>", "<C-d>", opts) --  jump down a paragraph
keymap("n", "<C-k>", "<C-u>", opts) -- jump up a paragraph
keymap("n", "<C-l>", "$", opts) -- jump to the end of a line

keymap("n", "Y", "y$", opts) -- y consistancy
keymap("n", "U", "<C-R>", opts) -- redo is U

keymap("n", "<TAB>", ">>", opts) -- Indent line
keymap("n", "<S-Tab>", "<<", opts) -- Unindent line

-- keymap('n', ';', ':', { nowait = true })
keymap("n", "<leader>v", "<cmd> vs <CR>", opts) -- vertical split
--keymap("n", "<leader><Tab>", "<cmd> bn <CR>", opts) -- vertical split

-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
--keymap("n", "<S-l>", ":bnext<CR>", opts)
--keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader><Tab>", ":bnext<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
keymap("v", "H", "b", opts) -- jump to first non-whitespace character of a line
keymap("v", "J", "}", opts) -- jump down a paragraph
keymap("v", "K", "{", opts) -- jump up a paragraph'
keymap("v", "L", "w", opts) -- jump to the end of a line

keymap("v", "<C-h>", "^", opts) --  jump to first non-whitespace character of a line
keymap("v", "<C-j>", "<C-d>", opts) --  jump down a paragraph
keymap("v", "<C-k>", "<C-u>", opts) -- jump up a paragraph
keymap("v", "<C-l>", "$", opts) -- jump to the end of a line

keymap("v", "<Tab>", ">><Esc>gv", opts) -- Indent line
keymap("v", "<S-Tab>", "<<<Esc>gv", opts) -- Unindent line
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

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
