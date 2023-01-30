local colorscheme = "darkplus"

--local present, tokyonight = pcall(require, "tokyonight")
--if not present then
--	return
--end

local status_ok, cs = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

-- local C = require("darkplus.colors")

-- local ts = require("darkplus.Treesitter")
-- ts.TSComment = {fg = C.gray}
-- local c = require("vscode.colors")

--vscode.setup({
-- Enable transparent background
--transparent = true,

-- Enable italic comment
--italic_comments = true,

-- Disable nvim-tree background color
-- disable_nvimtree_bg = true,

-- Override colors (see ./lua/vscode/colors.lua)
-- color_overrides = { vscLineNumber = '#FFFFFF',},

-- Override highlight groups (see ./lua/vscode/theme.lua)
-- this supports the same val table as vim.api.nvim_set_hl
-- use colors from this colorscheme by requiring vscode.colors!
--group_overrides = {
--Comment = { fg = c.vscGray, bg = "NONE", italic = true },
--  LineNrAbove = { fg = c.vscGreen, bg = 'NONE'  },
--  LineNrBelow = { fg = c.vscGreen, bg = 'NONE'  },
--CursorLineNr = { italic = true },
--String = { fg = c.vscGitAdded, bg = "NONE" },
--},
--})
