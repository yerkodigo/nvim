"   NERDTree
let NERDTreeQuitOnOpen=1

"   ULTISNIPS
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-_>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

"IdentLine
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
            \ 'colorscheme': 'gruvbox',
            \ 'subseparator': {
            \   'left': '',
            \   'right': ''
            \ }
            \}
