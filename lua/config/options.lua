vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Display
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = false -- Deshabilitado para mejor rendimiento
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = true

-- Editor behavior
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Performance optimizations
opt.lazyredraw = true -- No redibujar durante macros
opt.updatetime = 250 -- Tiempo de espera para CursorHold (default: 4000ms)
opt.timeoutlen = 300 -- Tiempo de espera para keymaps

-- Files
opt.swapfile = false -- Los swapfiles pueden causar lag
opt.backup = false
opt.undofile = true -- Mantener historial de undo persistente
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10 -- Limitar altura del menú de completion

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Backspace
opt.backspace = "indent,eol,start"
