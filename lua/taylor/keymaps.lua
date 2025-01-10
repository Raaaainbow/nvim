-- General settings
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
-- for better tab spacing
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- sets universal clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.undofile = true -- long undo history
vim.opt.updatetime = 50 -- faster update time
-- for start and end of line
vim.keymap.set('n', '<leader>h', '^', {silent = true})
vim.keymap.set('n', '<leader>l', '$', {silent = true})
