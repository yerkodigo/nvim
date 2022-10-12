call plug#begin('~/.config/nvim/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'       "Theme
"Plug 'rafi/awesome-vim-colorschemes'    "Themes
"Plug 'dkprice/vim-easygrep'             "Search
"Plug 'sheerun/vim-polyglot'             "Syntax
Plug 'ap/vim-css-color'                 "CSS Color
Plug 'scrooloose/nerdtree'              "Tree Directory
Plug 'ryanoasis/vim-devicons'           "Developer Icons -- working just nerdFonts
"Plug 'christoomey/vim-tmux-navigator'   "TMUX Navigator
""Plug 'github/compilot.vim'              "Github compilot

""Typescript
"Plug 'leafgarland/typescript-vim'
"Plug 'ianks/vim-tsx'

""IDE
Plug 'yggdroot/indentline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdcommenter'

""Status Bar
"Plug 'maximbaz/lightline-ale'
"Plug 'itchyny/lightline.vim'

""Typing
Plug 'alvan/vim-closetag' "HTML close tags <div> --> <div></div>
Plug 'jiangmiao/auto-pairs'  "Syntax close { --> {}

"Snippets autocomplete
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch':'release'}

"" Git
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-repeat'

"" Live Server Bracey
"Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" SmoothScrolling
Plug 'psliwka/vim-smoothie' "Smoothing in scroll

call plug#end()
