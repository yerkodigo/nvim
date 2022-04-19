call plug#begin('~/.config/nvim/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'       "Theme
"Plug 'rafi/awesome-vim-colorschemes'    "Themes
"Plug 'dkprice/vim-easygrep'             "Search
"Plug 'sheerun/vim-polyglot'             "Syntax
"Plug 'ap/vim-css-color'                 "CSS Color
Plug 'scrooloose/nerdtree'              "Tree Directory
Plug 'ryanoasis/vim-devicons'           "Developer Icons
"Plug 'christoomey/vim-tmux-navigator'   "TMUX Navigator
""Plug 'github/compilot.vim'              "Github compilot

""Typescript
"Plug 'leafgarland/typescript-vim'
"Plug 'ianks/vim-tsx'

""IDE
"Plug 'yggdroot/indentline'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'mhinz/vim-signify'
"Plug 'preservim/nerdcommenter'

""Status Bar
"Plug 'maximbaz/lightline-ale'
"Plug 'itchyny/lightline.vim'

""Typing
"Plug 'alvan/vim-closetag'
"Plug 'jiangmiao/auto-pairs'

""Snippets autocomplete
"Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch':'release'}

"" Git
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-repeat'

"" Live Server Bracey
"Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

"" SmoothScrolling
"Plug 'psliwka/vim-smoothie'

call plug#end()
