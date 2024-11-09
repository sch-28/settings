vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true

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

vim.opt.clipboard = "unnamed,unnamedplus"

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

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



-- Set a red background for errors, removing any underline or undercurl
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { bg = '#3c2c3c', fg = '#c94f6d', underline = true, undercurl = true })

-- Optional: Set similar styles for other diagnostics (warnings, hints, etc.)
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { bg = '#ff8800', fg = 'black', underline = false, undercurl = false })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { bg = '#4444ff', fg = 'white', underline = false, undercurl = false })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { bg = '#00ff00', fg = 'black', underline = false, undercurl = false })

