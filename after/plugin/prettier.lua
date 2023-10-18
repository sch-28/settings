-- vim.cmd([[
-- let g:prettier#autoformat = 1
-- let g:prettier#autoformat_require_pragma = 0
-- let g:prettier#exec_cmd_async = 1
-- ]])
--
local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
