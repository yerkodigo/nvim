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

" Insert a ; at the end of the current line
nmap <Leader>; $a;<Esc>

" Search Occult
nmap <Leader>/ :nohlsearch<CR>

" Format Code
nmap <Leader>f :set filetype<CR>

" Run node current file
nmap <Leader>x :!node %<CR>
