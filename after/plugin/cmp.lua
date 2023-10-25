local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- C-space mapping doesnt work for some reasons
-- vim.cmd([[inoremap <C-Space> <C-x><C-o>
--  inoremap <C-@> <C-Space>]])
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        -- instead no dashed border:

        -- window = {
        --     documentation = {
        --         border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        --     },
        --     completion = {
        --         border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
        --         winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
        --     }
        -- },
    },
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-y>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
    })
})
