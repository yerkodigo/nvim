:set nocompatible
:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set expandtab
:set mouse=a
:set ignorecase

so $HOME/.config/nvim/.vim/maps.vim              "Key Mappings
so $HOME/.config/nvim/.vim/plugins.vim           "Plugins
so $HOME/.config/nvim/.vim/configPlugins.vim     "Plugins Configuration

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

":set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Monaco\ 11
:set encoding=utf-8

"Theme time setting 24 hours       "<-0------7------21-----24->
let hr = (strftime('%H'))          "  | dark | light | dark |     

if hr >= 21 "21 to 24
    let g:sierra_Pitch = 1
    colorscheme sierra
elseif hr >= 7 "7 to 21
    set background=light
    colorscheme scheakur    
elseif hr >= 0 "0 to 7
    let g:sierra_Pitch = 1
    colorscheme sierra
endif

highlight Comment cterm=italic

"highlight Normal ctermbg=black
:set laststatus=2

"CursorLine Underline
:set cursorline
:hi clear CursorLine
:hi CursorLine gui=underline cterm=underline
