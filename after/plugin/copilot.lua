-- keybdind to dismiss github copilot suggestion
vim.api.nvim_set_keymap('i', '<C-r>', '<Plug>(copilot-dismiss)', { noremap = true, silent = true })
