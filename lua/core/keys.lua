local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
map('n', '<c-t>', ":ToggleTerm size=40 direction=float<CR>", opts)
map('n', '<c-n>', ":Neotree filesystem reveal right<CR>", opts)
map('v', '<Tab>', '>gv', opts)
map('v', '<S-Tab>', '<gv', opts)
