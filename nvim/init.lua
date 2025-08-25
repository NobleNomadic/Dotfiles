-- ===============================
-- GRUVBOX COLOR SCHEME
-- ===============================
vim.g.gruvbox_invert_selection = "0"
vim.cmd("syntax enable")
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
-- ===============================
-- INDENTATION & LINE NUMBERS
-- ===============================
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.number = true
-- ===============================
-- STATUS BAR
-- ===============================
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.statusline = "%t"
-- ===============================
-- PATH & WRAP FIX
-- ===============================
vim.env.PATH = vim.env.PATH .. ':/usr/bin'
vim.o.whichwrap = "b,s,<,>,[,]"

