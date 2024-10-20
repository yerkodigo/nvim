""		KEYMAP
let mapleader=" "

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"Copy into vim in visual mode - Remember install xclip in Linux
vmap <C-c> "+y

" Insert a ; at the end of the current line
nmap <Leader>; $a;<Esc>

" Search Occult
nmap <Leader>/ :nohlsearch<CR>

" Format all Code & current position
nmap <Leader>f :set filetype<CR>gg=G
nmap <Leader>F =ap

" Toggle line number mode
nmap <Leader>rn :set rnu!<cr>o

" Check Spelling
nmap <Leader>pp :set spell!<cr>
nmap <Leader>z z=

"Copy full current file path in clipboard
nmap <C-p> :let @+ = expand('%:p')<CR>

"NERDTreeFind
nmap <Leader>nt :NERDTreeFind<CR>

"Mover lineas en editor
nmap <A-j> :m .+1<CR>==
nmap <A-k> :m .-2<CR>==
imap <A-j> <Esc>:m .+1<CR>==gi
imap <A-k> <Esc>:m .-2<CR>==gi
vmap <A-j> :m '>+1<CR>gv=gv
vmap <A-k> :m '<-2<CR>gv=gv
