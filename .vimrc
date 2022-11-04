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

so $HOME/.config/nvim/.vim/functions.vim         "Custom functions
so $HOME/.config/nvim/.vim/maps.vim              "Key Mappings
so $HOME/.config/nvim/.vim/plugins.vim           "Plugins
so $HOME/.config/nvim/.vim/configPlugins.vim     "Plugins Configuration
so $HOME/.config/nvim/.vim/CocConfig.vim         "Neoclide Coc Configuration

"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""Theme time setting 24 hours       "<-0------7------21-----24->
"let hr = (strftime('%H'))           "  | dark | light | dark |     
"
"if hr >= 19 "19 to 24
"  call ChangeTheme('dark', 'PaperColor')
"elseif hr >= 7 "7 to 19
"  call ChangeTheme('light', 'PaperColor')
"elseif hr >= 0 "0 to 7
"  call ChangeTheme('dark', 'PaperColor')
"endif

"CURSIVE COMMENTS
highlight Comment cterm=italic

"ACTIVE LOWER STATUS BAR
:set laststatus=2

"CURSOR
:set cursorline
:hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=white
:set cursorcolumn
