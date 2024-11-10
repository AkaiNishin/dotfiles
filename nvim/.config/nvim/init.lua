vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-|>", ":vsplit<CR>")
vim.keymap.set("n", "<C-->", ":split<CR>")

vim.g.python3_host_prog = os.getenv("HOME") .. "/Programming/venv/bin/python"
require("config.lazy")

vim.opt.tags:append('tags')
vim.cmd.colorscheme("catppuccin-mocha")
