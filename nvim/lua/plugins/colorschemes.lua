
vim.cmd('colorscheme vscode')


----------------------------------------
-- Poimandres                              
----------------------------------------
local present, poimandres= pcall(require, 'poimandres')
if not present then
    return
end
poimandres.setup {

}
----------------------------------------
-- VSCode:
----------------------------------------

local c = require('vscode.colors')

local present, vscode = pcall(require, 'vscode')
if not present then
    return
end

vscode.setup {
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    -- disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    -- color_overrides = { vscLineNumber = '#FFFFFF',},

    -- Override highlight groups (see ./lua/vscode/theme.lua)
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
    group_overrides = { 
        Comment = { fg = c.vscGray, bg = 'NONE', italic = true},
        LineNr = {fg = c.vscGreen, bg = 'NONE', italic = true }, 
        String = {fg = c.vscGitAdded, bg = 'NONE' }}
}

-- For dark theme (neovim's default)
-- vim.o.background = 'dark'
-- For light theme
-- vim.o.background = 'light'

