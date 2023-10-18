vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move text blocks w/ J/K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- replace paste
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>l", "iconsole.log(<C-r>=expand('<cword>')<CR>)<Esc>F(a")
vim.keymap.set("n", "<leader>m", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>n", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>c", "<cmd>lclose<CR>zz")

vim.keymap.set("n", "<leader>gh", "<cmd>0GlLog<CR>")

vim.keymap.set("n", "<leader>d", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- map CTRL+V to instert literal escapes in insert mode: <C-v><Esc>
vim.keymap.set({ "i" }, "<C-x>", "<C-v>", { noremap = true, silent = true })

vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC>:w<CR>")

vim.cmd([[:call setreg("o", "F\"vf\"S{wvf\"S(iclsxwa{},bla")
nmap <M-d> @o]])

vim.keymap.set("n", "<leader>l", "iconsole.log(<C-r>=expand('<cword>')<CR>)<Esc>F(a")

--

-- vim.keymap.set("n", "<C-1>", "<C-^>")
--this doesnt work instead:
vim.cmd([[
nnoremap <leader>b <C-^>
]])

