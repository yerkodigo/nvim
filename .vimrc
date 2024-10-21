" Configuraciones adicionales
syntax on                    " Activa la sintaxis
set number                   " Muestra números de línea
set relativenumber           " Números de línea relativos
set tabstop=2                " Número de espacios que representa un tab
set shiftwidth=2             " Número de espacios para la indentación
set expandtab                " Usa espacios en lugar de tabulaciones
set autoindent               " Indentación automática
set smartindent              " Indentación inteligente
set cursorline               " Resalta la línea del cursor
set hlsearch                 " Resalta las búsquedas
set incsearch                " Búsqueda incremental
set ignorecase               " Ignora mayúsculas/minúsculas en búsquedas
set smartcase                " Activa mayúsculas/minúsculas si hay mayúsculas en la búsqueda
set clipboard=unnamedplus    " Usa el portapapeles del sistema

"CHARACTER ENCODING
set encoding=utf-8

"INDENT
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

"MOUSE ENABLED
set mouse=a

"set ignorecase

so $HOME/.config/nvim/.vim/maps.vim              "Key Mappings
so $HOME/.config/nvim/.vim/plugins.vim           "Plugins
so $HOME/.config/nvim/.vim/configPlugins.vim     "Plugins Configuration
so $HOME/.config/nvim/.vim/CocConfig.vim         "Neoclide Coc Configuration
"so $HOME/.config/nvim/.vim/functions.vim         "Custom functions

"THEME
colorscheme base16-grayscale-light

"SPELLING LANGUAGE
set spelllang=es_es
"setlocal spell spelllang=es_es

"CURSIVE COMMENTS
highlight Comment cterm=italic

"ACTIVE LOWER STATUS BAR
set laststatus=2

"CURSOR
set cursorline
set cursorcolumn

"hi CursorLine   cterm=NONE ctermbg=gray ctermfg=white
"hi CursorColumn cterm=NONE ctermbg=gray ctermfg=white

highlight CursorLine cterm=underline gui=underline
