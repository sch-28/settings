local lsp_zero = require('lsp-zero')
local util = require 'lspconfig.util'
-- lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gl", function() vim.lsp.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references({includeDeclaration = false}) end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    -- lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("neodev").setup({})
require('mason').setup({})
require("lspconfig").tsserver.setup({
    single_file_support = false,
    root_dir = util.root_pattern('.git'),
    on_init = function(client)
        -- disable formatting capabilities
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
})
require('mason-lspconfig').setup({
    ensure_installed = { "svelte", "lua_ls" },
    lua_ls = function()
        require("lspconfig").lua_ls.setup({
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        })
    end,
    handlers = {
        lsp_zero.default_setup,
    },
})
