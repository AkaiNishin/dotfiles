vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set wildmenu")
vim.cmd("set wildmode=full")

vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gk", "k")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "gj", "j")

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-|>", ":vsplit<CR>")
vim.keymap.set("n", "<C-->", ":split<CR>")

vim.keymap.set("n", "<Tab>o", ":tabnew<CR>")
vim.keymap.set("n", "<Tab>n", ":tabn<CR>")
vim.keymap.set("n", "<Tab>p", ":tabp<CR>")
vim.keymap.set("n", "<Tab>c", ":tabclose<CR>")

vim.keymap.set("n", "<Tab>k", ":bprevious<CR>")
vim.keymap.set("n", "<Tab>j", ":bnext<CR>")
vim.keymap.set("n", "<Tab>d", ":bdelete<CR>")
vim.keymap.set("n", "<Tab>ls", ":ls<CR>")

vim.g.python3_host_prog = os.getenv("HOME") .. "/Programming/venv/bin/python"
require("config.lazy")

vim.opt.tags:append('tags')
vim.cmd.colorscheme("catppuccin-mocha")
