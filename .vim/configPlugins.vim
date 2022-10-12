"   NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"   ULTISNIPS
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/.vim/UltiSnips']
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<C-_>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

"   Coc
let g:coc_global_extensions = [ 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-tslint', 'coc-prettier', 'coc-html', 'coc-css' ]

""IdentLine
let g:indentLine_char_list = ['|', '¦', '¦', '¦']
let g:indentLine_fileType=['javascript', 'html', 'css', 'scss', 'typescript', 'vim', 'nerdtree', 'json', 'sql', 'mysql']
"let g:indentLine_indentLevel= 20
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1

"   Lightlane
"let g:lightline = {
"            \ 'active': {
"            \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
"            \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
"            \ },
"            \ 'inactive': {
"            \   'left': [['inactive'], ['relativepath']],
"            \   'right': [['bufnum']]
"            \ },
"            \ 'component': {
"            \   'bufnum': '%n',
"            \   'inactive': 'inactive'
"            \ },
"            \ 'component_function': {
"            \   'gitbranch': 'fugitive#head',
"            \   'kitestatus': 'kite#statusline'
"            \ },
"            \ 'colorscheme': 'wombat',
"            \ 'subseparator': {
"            \   'left': '',
"            \   'right': ''
"            \ }
"            \}
