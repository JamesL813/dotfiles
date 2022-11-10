-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer --
    use 'wbthomason/packer.nvim'

    use 'nvim-tree/nvim-web-devicons'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- LSP --
    use 'mhartington/formatter.nvim'
    use 'williamboman/nvim-lsp-installer'
    use "neovim/nvim-lspconfig"

    -- statusline --
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        -- config = function() require('lualine').setup() end
    }

    -- git --
    use { 'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    use { 'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent_blankline').setup {
        }
    end,
    }
    -- colored hex codes: #FF0000 --
    use { 'NvChad/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    }

    -- colorschemes --
    use 'olivercederborg/poimandres.nvim'
    use 'Mofiqul/vscode.nvim'
    use 'sainnhe/edge'
    use 'morhetz/gruvbox'
    use 'arcticicestudio/nord-vim'
end)
