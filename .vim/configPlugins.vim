"   NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Extensiones de CoC
" - coc-tsserver: Soporte para TypeScript y JavaScript
" - coc-html: Soporte para HTML
" - coc-css: Soporte para CSS
" - coc-angular: Soporte para Angular
" - coc-prettier: Formateador de código
" - coc-eslint: Soporte para ESLint
" - coc-json: Soporte para JSON
" - coc-snippets: Soporte para snippets

let g:coc_global_extensions = ['coc-tsserver', 'coc-html', 'coc-css', 'coc-angular', 'coc-prettier', 'coc-eslint', 'coc-json', 'coc-snippets']

""IdentLine
let g:indentLine_char_list = ['|', '¦', '¦', '¦']
let g:indentLine_fileType=['javascript', 'html', 'css', 'scss', 'typescript', 'vim', 'nerdtree', 'json', 'sql', 'mysql']
"let g:indentLine_indentLevel= 20
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1
