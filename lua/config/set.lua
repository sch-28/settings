vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- vim.api.nvim_exec("language en_US", true)

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.inccommand = "split"


vim.opt.colorcolumn = ""
vim.o.clipboard = "unnamed,unnamedplus"

-- vim.cmd("colorscheme kanagawa-wave")
require("nightfox").setup({
    options = {
        transparent = true,
    }
})
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.opt.background = "dark"
vim.cmd.colorscheme("nightfox")


-- autoread file on change
-- vim.o.autoread = true
-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
--   command = "if mode() != 'c' | checktime | endif",
--   pattern = { "*" },
-- })

vim.g.user_emmet_leader_key = "<C-z>"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

vim.opt.virtualedit = "all"
