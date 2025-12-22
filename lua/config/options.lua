vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs e identacion
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

-- opciones de busqueda
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.cursorcolumn = true

opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard (configuración multiplataforma)
local platform = require("util.platform")
if platform.is_windows then
  opt.clipboard = "unnamedplus"  -- Windows usa win32yank automáticamente
else
  opt.clipboard:append("unnamedplus")
end

-- split windows
opt.splitright = true
opt.splitbelow = true
