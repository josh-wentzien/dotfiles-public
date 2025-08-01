vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.scrolloff = 5
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true -- copy the indent from prev line when starting new one

opt.wrap = false -- no line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed case, assume case-sensitive

opt.cursorline = true

-- turn on color stuff
opt.termguicolors = true
opt.background = "dark" -- colorschemes which can be light or dark will be dark
opt.signcolumn = "yes" -- show sign column so text does not shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end-of-line, or insert mode start.

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
