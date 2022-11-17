local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup {
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

-- 2. (optional) Override the default configuration to be applied to all servers.
lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    { on_attach = on_attach }
)


-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
    lspconfig[server.name].setup {}
end

-- Settings --

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local border = {
    { "🭽", "FloatBorder" },
    { "▔", "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕", "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁", "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏", "FloatBorder" },
}

-------------------------------
-- Keymaps
-------------------------------

local key = vim.keymap
local buf = vim.lsp.buf

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
key.set('n', '<space>e', vim.diagnostic.open_float, opts)
key.set('n', '[d', vim.diagnostic.goto_prev, opts)
key.set('n', ']d', vim.diagnostic.goto_next, opts)
-- key.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    key.set('n', 'gD', buf.declaration, bufopts)
    key.set('n', 'gd', buf.definition, bufopts)
--    key.set('n', 'K', buf.hover, bufopts)
    key.set('n', 'gi', buf.implementation, bufopts)
    key.set('n', '<C-k>', buf.signature_help, bufopts)
    --  key.set('n', '<space>wa', buf.add_workspace_folder, bufopts)
    --  key.set('n', '<space>wr', buf.remove_workspace_folder, bufopts)
    --  key.set('n', '<space>wl', function()
    --    print(vim.inspect(buf.list_workspace_folders()))
    --  end, bufopts)
    key.set('n', '<leader>D', buf.type_definition, bufopts)
    key.set('n', '<leader>r', buf.rename, bufopts)
    key.set('n', '<leader>ca', buf.code_action, bufopts)
    key.set('n', 'gr', buf.references, bufopts)
    -- key.set('n', '<space>f', function() buf.format { async = true } end, bufopts)
end
key.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ bufner = bufner })<CR>', bufopts)
