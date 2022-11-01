-- First read our docs (completely) then check the example_config repo

local M = {}
local override = require("custom.override")



M.ui = {
  theme = "vscode_dark",
}
M.plugins = {
  user = require("custom.plugins"),
  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    ["williamboman/mason.nvim"] = override.mason,
    ["NvChad/ui"] = override.ui
  }
}


M.mappings = {}
return M
