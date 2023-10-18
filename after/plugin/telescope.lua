local builtin = require('telescope.builtin')

-- require('config.telescopePickers').prettyGrepPicker({ file_picker = 'live_grep' })
-- require('config.telescopePickers').prettyGrepPicker({ file_picker = 'grep_string' })
-- require('config.telescopePickers').prettyFilesPicker({ file_picker = 'git_files' })
-- require('config.telescopePickers').prettyFilesPicker({ file_picker = 'find_files' })
-- require('config.telescopePickers').prettyFilesPicker({ file_picker = 'oldfiles' })

local file_picker = require('config.telescopePickers').prettyFilesPicker
local grep_picker = require('config.telescopePickers').prettyGrepPicker

-- builtin.grep_string({ search = vim.fn.input("Grep > ") });
vim.keymap.set('n', '<leader>pf', function() file_picker({ picker = "find_files" }) end, {})
vim.keymap.set('n', '<C-p>', function() file_picker({ picker = "git_files" }) end, {})
vim.keymap.set('n', '<leader>ps', function()
    grep_picker({ picker = "grep_string", options = { search = vim.fn.input("Grep > ") } });
end)
vim.keymap.set('n', '<leader>pd', function()
    local selected_word = vim.fn.expand("<cword>")
    grep_picker({ picker = "grep_string", options = { search = selected_word } })
end)
vim.keymap.set('n', '<Leader>fs', function() builtin.current_buffer_fuzzy_find() end)
