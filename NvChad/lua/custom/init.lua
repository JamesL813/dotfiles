vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({ bufner = bufner })]])
-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead

local opt = vim.opt

-- opt.tabstop = 4
-- opt.softtabstop = 4
-- opt.shiftwidth = 4
opt.shiftround = true --false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smartcase = true
opt.relativenumber = true
opt.scrolloff = 8
opt.breakindent = true
opt.showbreak = "+ "
opt.undofile = true
opt.title = true
-- opt.spell = true

require("lspconfig").rust_analyzer.setup({})
