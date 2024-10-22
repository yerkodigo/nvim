call plug#begin('~/.config/nvim/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'  " Integración de fzf con Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter' " Indicador de cambios en Git
Plug 'sheerun/vim-polyglot' " Soporte para múltiples lenguajes
Plug 'mattn/emmet-vim' " Expansión de abreviaturas HTML/CSS
Plug 'tpope/vim-surround' " Manejo de pares de caracteres
Plug 'tpope/vim-commentary' " Comentarios más fáciles
Plug 'scrooloose/nerdtree' " Explorador de archivos
Plug 'Yggdroot/indentLine' " Líneas de indentación
Plug 'preservim/nerdcommenter'
"Plug 'ryanoasis/vim-devicons'           "Developer Icons -- working just nerdFonts
Plug 'christoomey/vim-tmux-navigator'   "TMUX Navigator

"THEMES
"Plug 'jaredgorski/Mies.vim'
Plug 'chriskempson/base16-vim'

""Typing
Plug 'alvan/vim-closetag' "HTML close tags <div> --> <div></div>
Plug 'jiangmiao/auto-pairs'  "Syntax close { --> {}

"Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

call plug#end()
