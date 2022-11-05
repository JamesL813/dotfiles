
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

-- Map Esc to kk

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste

-- Change split orientation

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and w
map('n', '<leader>w', ':w<CR>')

-- Close window and exit from Neovim with <leader> and q
map('n', '<leader>q', ':q<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

map('n', '<C-n>', '<cmd> Telescope <CR>') -- Open Telescope

map('n', 'Y', 'y$')	-- y consistancy
map('n', 'U', '<C-R>') -- redo is U

map('n', 'H', 'b') -- jump to first non-whitespace character of a line
map('n', 'J', '}') -- jump down a paragraph
map('n', 'K', '{') -- jump up a paragraph'
map('n', 'L', 'w') -- jump to the end of a line

map('n', '<A-h>', '^') --  jump to first non-whitespace character of a line
map('n', '<A-j>', 'G') --  jump down a paragraph
map('n', '<A-k>', 'gg') -- jump up a paragraph
map('n', '<A-l>', '$') -- jump to the end of a line

map('n', '<TAB>', '>>') -- Indent line
map('n', '<S-Tab>', '<<') -- Unindent line

map('n', ';', ':', { nowait = true })
map('n', '<leader>v', '<cmd> vs <CR>') -- vertical split

-- visual
map('n', '<Tab>', '>><Esc>gv') -- Indent line
map('n', '<S-Tab>', '<<<Esc>gv') -- Unindent line

return M
