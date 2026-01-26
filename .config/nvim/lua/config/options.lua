-- Disbale netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable pretty colors
vim.opt.termguicolors = true

-- Set leader key ([SPACE])
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Turn on relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Gimme those 4-spaces (tabs suck but I like the button)
vim.o.tabstop = 8
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.expandtab = true

-- Use system clipboard
vim.o.clipboard="unnamedplus"

-- Case-insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight yanks
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=150})
augroup END
]]

-- Remaps
vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<cr>", { desc = "File Manager" })

vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>", { desc = "Move to the window on the right", silent = true })
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>", { desc = "Move to the window above", silent = true })
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>", { desc = "Move to the window on the left", silent = true })
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>", { desc = "Move to the window below", silent = true })
