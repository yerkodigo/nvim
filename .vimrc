set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set noshowmode
set nocompatible

set tabstop=3 softtabstop=3 shiftwidth=3 expandtab

call plug#begin('~/.config/nvim/.vim/plugged')

" THEMES
Plug 'canop/patine'
"Plug 'nanotech/jellybeans.vim'

"NERD
Plug 'scrooloose/nerdtree'

"TMUX
Plug 'christoomey/vim-tmux-navigator'

"IDE
Plug 'yggdroot/indentline'

"Status Bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

"Snippets autocomplete
"Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch':'release'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

" Live Server Bracey
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

call plug#end()

colorscheme patine 
"colorscheme jellybeans

"****************************************
"		CONFIG
"****************************************

"   CursorLine Underline
set cursorline
:hi clear CursorLine
:hi CursorLine gui=underline cterm=underline


"   NERDTree
let NERDTreeQuitOnOpen=1

"		KEYMAP
let mapleader=" "
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>p :Files<CR>

"" Live Server Bracey
"let g:bracey_browser_command='firefox'
"" Run LiveServer
nmap <Leader>b :Bracey<CR>
"" Stop LiveServer
nmap <Leader>bs :BraceyStop<CR>
"" Reload LiveServer
nmap <Leader>br :BraceyReload<CR>

" Search Occult
nmap <Leader>/ :nohlsearch<CR>

" Format Code
nmap <Leader>f :set filetype<CR>

" Run node current file
nmap <Leader>x :!node %<CR>

"   ULTISNIPS

"let g:UltiSnipsSnippetDirectories=[]
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<Leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

"   IdentLine
let g:indentLine_char_list = ['|', '¦', '¦', '¦']
let g:indentLine_fileType=['javascript', 'html', 'css', 'scss', 'typescript']
"let g:indentLine_indentLevel= 20
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1

"   Custom Jellybeans
"let g:jellybeans_use_term_italics = 1
"
"let g:jellybeans_overrides = {
"            \    'background': { 'guibg': '000000' },
"            \}

"   Lightlane
let g:lightline = {
            \ 'active': {
            \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
            \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
            \ },
            \ 'inactive': {
            \   'left': [['inactive'], ['relativepath']],
            \   'right': [['bufnum']]
            \ },
            \ 'component': {
            \   'bufnum': '%n',
            \   'inactive': 'inactive'
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'kitestatus': 'kite#statusline'
            \ },
            \ 'colorscheme': 'one',
            \ 'subseparator': {
            \   'left': '',
            \   'right': ''
            \ }
            \}
