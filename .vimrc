"CHARACTER ENCODING
:set encoding=utf-8

":set nocompatible

"LEFT NUMBERS
:set number
:set relativenumber

"INDENT
:set shiftwidth=2
:set tabstop=2
:set softtabstop=2
:set expandtab
:set autoindent
:set smartindent

"MOUSE ENABLED
:set mouse=a 

":set ignorecase

"SPELLING LANGUAGE
:set spelllang=es_es

"so $HOME/.config/nvim/.vim/maps.vim              "Key Mappings
"so $HOME/.config/nvim/.vim/plugins.vim           "Plugins
"so $HOME/.config/nvim/.vim/configPlugins.vim     "Plugins Configuration

"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""Theme time setting 24 hours       "<-0------7------21-----24->
"let hr = (strftime('%H'))          "  | dark | light | dark |     

"if hr >= 19 "21 to 24
"    set background=dark
"    colorscheme PaperColor
"elseif hr >= 7 "7 to 21
"    set background=light
"    colorscheme PaperColor
"elseif hr >= 0 "0 to 7
"    set background=dark
"    colorscheme PaperColor
"endif

"CURSIVE COMMENTS
highlight Comment cterm=italic

"ACTIVE LOWER STATUS BAR
:set laststatus=2

"CURSORLINE
:set cursorline
:set cursorcolumn
:hi CursorLine gui=bold cterm=bold ctermbg=8
