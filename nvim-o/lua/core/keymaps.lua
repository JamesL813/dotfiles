
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to space
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable keys
map('n', ';', '<nop>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste

-----------------------------------------------------------
-- Navigation
-----------------------------------------------------------
-- Normal --
-- Move around splits using Alt + {h,j,k,l}
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')

map('n', 'H', 'b') -- jump to first non-whitespace character of a line
map('n', 'J', '}') -- jump down a paragraph
map('n', 'K', '{') -- jump up a paragraph'
map('n', 'L', 'w') -- jump to the end of a line

map('n', '<C-h>', '^') --  jump to first non-whitespace character of a line
map('n', '<C-j>', '<C-d>') --  jump down a paragraph
map('n', '<C-k>', '<C-u>') -- jump up a paragraph
map('n', '<C-l>', '$') -- jump to the end of a line

map('n', 'Y', 'y$')	-- y consistancy
map('n', 'U', '<C-R>') -- redo is U

map('n', '<TAB>', '>>') -- Indent line
map('n', '<S-Tab>', '<<') -- Unindent line

map('n', ';', ':', { nowait = true })
map('n', '<leader>v', '<cmd> vs <CR>') -- vertical split
map('n', '<leader><Tab>', '<cmd> bn <CR>') -- vertical split

-- Visual --
map('v', 'H', 'b') -- jump to first non-whitespace character of a line
map('v', 'J', '}') -- jump down a paragraph
map('v', 'K', '{') -- jump up a paragraph'
map('v', 'L', 'w') -- jump to the end of a line

map('v', '<C-h>', '^') --  jump to first non-whitespace character of a line
map('v', '<C-j>', '<C-d>') --  jump down a paragraph
map('v', '<C-k>', '<C-u>') -- jump up a paragraph
map('v', '<C-l>', '$') -- jump to the end of a line

map('v', '<Tab>', '>><Esc>gv') -- Indent line
map('v', '<S-Tab>', '<<<Esc>gv') -- Unindent line
-- Reload configuration without restart nvim
map('n', '<leader>rl', ':so %<CR>')

-- Fast saving with <leader> and w
map('n', '<leader>w', ':w<CR>')

-- Close window and exit from Neovim with <leader> and q
map('n', '<leader>q', ':q<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

map('n', '<leader>ps', ':PackerSync<CR>')

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
    map('n', '<leader>`', ':NvimTreeToggle<CR>')            -- open/close
    map('n', '<leader>t', ':NvimTreeToggle<CR>')            -- open/close
-- map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
-- map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
-- map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close
-- map('n', '<C-n>', '<cmd> Telescope <CR>') -- Open Telescope

return M
