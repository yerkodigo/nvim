:set nocompatible
:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set expandtab
:set mouse=a

so /home/user32/.config/nvim/.vim/maps.vim              "Key Mappings
so /home/user32/.config/nvim/.vim/plugins.vim           "Plugins
so /home/user32/.config/nvim/.vim/configPlugins.vim     "Plugins Configuration

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

":set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Monaco\ 11
:set encoding=utf-8

:colorscheme jellybeans      "Terminal Theme

"highlight Normal ctermbg=black
:set laststatus=2

"CursorLine Underline
:set cursorline
:hi clear CursorLine
:hi CursorLine gui=underline cterm=underline
